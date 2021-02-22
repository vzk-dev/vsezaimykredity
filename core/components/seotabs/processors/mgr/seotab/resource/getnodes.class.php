<?php

require_once MODX_CORE_PATH . 'model/modx/processors/resource/getnodes.class.php';

class SeoTabsResourceGetNodesProcessor extends modResourceGetNodesProcessor
{
    protected $pid;
    protected $parent_id;
    protected $preset;
    protected $depth = 10;
    protected $resources = array();

    /** {@inheritDoc} */
    public function initialize()
    {
        $initialize = parent::initialize();
        $this->itemClass = $this->getProperty('class_key', 'modResource');
        return $initialize;
    }

    /** {@inheritDoc} */
    public function getResourceQuery()
    {
        $ids = $this->getTreeResourceIds();
        $resourceColumns = array(
            'id',
            'pagetitle',
            'longtitle',
            'alias',
            'description',
            'parent',
            'published',
            'deleted',
            'isfolder',
            'menuindex',
            'menutitle',
            'hidemenu',
            'class_key',
            'context_key',
        );
        $c = $this->modx->newQuery('modResource');
        //  $c->leftJoin('modResource', 'Child', array('modResource.id = Child.parent'));
        $c->leftJoin('SeoTab', 'SeoTab', array('modResource.id = SeoTab.rid'));
        $c->select($this->modx->getSelectColumns('modResource', 'modResource', '', $resourceColumns));
        $c->select($this->modx->getSelectColumns('SeoTab', 'SeoTab', 'seotab_', array('id')));
        /* $c->select(array(
             'childrenCount' => 'COUNT(Child.id)',
         ));*/
        $c->where(array(
            'modResource.id:IN' => $ids,
        ));


        $c->where(array(
            'context_key' => $this->contextKey,
            // 'show_in_tree' => true,
        ));

        if (empty($this->startNode) && !empty($this->defaultRootId)) {
            $c->where(array(
                'id:IN' => explode(',', $this->defaultRootId),
                'parent:NOT IN' => explode(',', $this->defaultRootId),
            ));
        } else {
            $c->where(array(
                'parent' => $this->startNode,
            ));
        }
        $c->groupby($this->modx->getSelectColumns('modResource', 'modResource', '', $resourceColumns), '');
        $c->sortby('modResource.' . $this->getProperty('sortBy'), $this->getProperty('sortDir'));

        return $c;
    }


    /** {@inheritDoc} */
    public function prepareContextNode(modContext $context)
    {
        $context->prepare();
        return array(
            'text' => $context->get('key')
        , 'id' => $context->get('key') . '_0'
        , 'pk' => $context->get('key')
        , 'ctx' => $context->get('key')
        , 'leaf' => false
        , 'cls' => 'icon-context'
        , 'iconCls' => $this->modx->getOption('mgr_tree_icon_context', null, 'tree-context')
        , 'qtip' => $context->get('description') != '' ? strip_tags($context->get('description')) : ''
        , 'type' => 'modContext'
        );
    }


    /** {@inheritDoc} */
    public function prepareResourceNode(modResource $resource)
    {

        $nodeName = $this->modx->getOption('resource_tree_node_name', null, 'pagetitle');
        $qtipField = $this->getProperty('qtipField');
        $nodeField = $this->getProperty('nodeField', $nodeName);


        //$hasChildren = (int)$resource->get('childrenCount') > 0 && $resource->get('hide_children_in_tree') == 0 ? true : false;
        // $hasChildren =   (int)$resource->get('childrenCount') > 0 ? true : false;
        $hasChildren = $this->getChildrenCount($resource->get('id')) > 0 ? true : false;
        $seotabId = $resource->get('seotab_id');
        // Assign an icon class based on the class_key
        $class = $iconCls = array();
        $classKey = strtolower($resource->get('class_key'));
        if (substr($classKey, 0, 3) == 'mod') {
            $classKey = substr($classKey, 3);
        }
        $classKeyIcon = $this->modx->getOption('mgr_tree_icon_' . $classKey, null, 'tree-resource');
        $iconCls[] = $classKeyIcon;

        $class[] = 'icon-' . strtolower(str_replace('mod', '', $resource->get('class_key')));
        if (!$resource->isfolder) {
            $class[] = 'x-tree-node-leaf icon-resource';
        }
        if (!$resource->get('published')) $class[] = 'unpublished';
        if ($resource->get('deleted')) $class[] = 'deleted';
        if ($resource->get('hidemenu')) $class[] = 'hidemenu';
        if ($hasChildren) {
            $class[] = 'haschildren';
            if ($seotabId) {
                $iconCls[] = $this->modx->getOption('mgr_tree_icon_folder', null, 'tree-folder');
            } else {
                $iconCls[] = 'icon-circle-o';
            }
            $iconCls[] = 'parent-resource';
        }

        $qtip = '';
        if ($seotabId) {
            $statCountTabs = $this->getStatCountTabs($resource->get('id'));
            $qtip = $this->modx->lexicon('seotabs_tabs_tree_node_qtip', array(
                'total_tabs' => $statCountTabs['total'],
                'count_enabled_tabs' => $statCountTabs['enabled'],
                'class_key' => $resource->get('class_key'),
            ));
        }

        $text = $resource->get($nodeField);
        //$idNote = $this->modx->hasPermission('tree_show_resource_ids') ? ' <span dir="ltr">('.$resource->id.')</span>' : '';
        $idNote = $this->modx->hasPermission('tree_show_resource_ids') ? ' (' . $resource->id . ')' : '';
        $charset = $this->modx->getOption('modx_charset', null, 'UTF-8');
        $text = htmlentities($text, ENT_QUOTES, $charset);

        //
        $itemArray = array(
            'text' => $text . $idNote,
            'id' => $resource->context_key . '_' . $resource->id,
            'pk' => $resource->id,
            'cls' => implode(' ', $class),
            'iconCls' => implode(' ', $iconCls),
            'type' => 'modResource',
            'classKey' => $resource->class_key,
            'ctx' => $resource->context_key,
            'hide_children_in_tree' => $resource->hide_children_in_tree,
            'qtip' => $qtip,
            // 'checked' => in_array($resource->id, $this->resources) ? true : false,
            'disabled' => false
        );
        if (!$hasChildren) {
            $itemArray['hasChildren'] = false;
            $itemArray['children'] = array();
            $itemArray['expanded'] = true;
        } else {
            $itemArray['hasChildren'] = true;
        }

        return $itemArray;
    }

    /**
     * @param int $rid
     * @return array
     */
    public function getStatCountTabs($rid)
    {
        $result = array('total' => 0, 'enabled' => 0);
        $classKey = 'SeoTab';
        $q = $this->modx->newQuery($classKey);
        $q->select($this->modx->getSelectColumns($classKey, $classKey, '', array('enabled', 'active')));
        $q->where(array('rid' => $rid));
        if ($q->prepare() && $q->stmt->execute()) {
            while ($item = $q->stmt->fetch(PDO::FETCH_ASSOC)) {
                $result['total']++;
                if ($item['enabled']) {
                    $result['enabled']++;
                }
            }
        }
        return $result;
    }

    /**
     * @return array
     */
    public function getSeoTabResource()
    {
        $result = array();
        $classKey = 'SeoTab';
        $q = $this->modx->newQuery($classKey);
        $q->leftJoin('modResource', 'Resource', array('SeoTab.rid = Resource.id'));
        $q->select($this->modx->getSelectColumns($classKey, $classKey, '', array('rid')));
        $q->select($this->modx->getSelectColumns('modResource', 'Resource', '', array('context_key')));
        $q->groupby('rid');
        if ($q->prepare() && $q->stmt->execute()) {
            $result = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        return $result;
    }

    /**
     * @return array
     */
    public function getTreeResourceIds()
    {
        $result = array();
        if ($tabs = $this->getSeoTabResource()) {
            foreach ($tabs as $tab) {
                $result[] = $tab['rid'];
                $parentIds = $this->modx->getParentIds($tab['rid'], $this->depth, array('context' => $tab['context_key']));
                $result = array_merge_recursive($result, $parentIds);
            }
        }
        return $result;
    }

    /**
     * @param int $rid
     * @return int
     */
    public function getChildrenCount($rid)
    {
        $q = $this->modx->newQuery('modResource');
        $q->where(array('parent' => $rid));
        return $this->modx->getCount('modResource', $q);
    }

}

return 'SeoTabsResourceGetNodesProcessor';