<?php

class sfRuleGetListProcessor extends modObjectGetListProcessor
{
    public $objectType = 'sfRule';
    public $classKey = 'sfRule';
    public $defaultSortField = 'id';
    public $defaultSortDirection = 'DESC';
    //public $permission = 'list';
    public $proMode = 0;

    public function initialize()
    {
        $this->proMode = (int)$this->modx->getOption('seofilter_pro_mode', null, 0);

        return parent::initialize();
    }

    /**
     * We do a special check of permissions
     * because our objects is not an instances of modAccessibleObject
     *
     * @return boolean|string
     */
    public function beforeQuery()
    {
        if (!$this->checkPermissions()) {
            return $this->modx->lexicon('access_denied');
        }

        if($this->getProperty('sort') == 'actions') {
            $this->setProperty('sort','active');
        }

        return true;
    }


    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        $query = trim($this->getProperty('query'));
        if ($query) {
            $c->where(array(
                'name:LIKE' => "%{$query}%",
                'OR:id:LIKE' => "%{$query}%",
                'OR:url:LIKE' => "%{$query}%",
                'OR:title:LIKE' => "%{$query}%",
            ));
        }
        
        if ($page = $this->getProperty('page',null)) {
            $proMode =  $this->modx->getOption('seofilter_pro_mode',null,0,true);
            if($proMode) {
                $c->andCondition('1=1 AND FIND_IN_SET('.$page.',REPLACE(IFNULL(NULLIF(pages,""),page)," ",""))');
//                $q->where(array('(page = '.$page.') OR (1 = 1 AND FIND_IN_SET('.$page.',pages))'));
            } else {
                $c->andCondition(array('page' => $page), '', 1);
            }
        }

        if($id = $this->getProperty('id',null)) {
            $c->where(array('id'=>$id));
        }

        //if($this->getProperty('page')) {

            $c->leftJoin('modResource', 'modResource', $this->classKey . '.page = modResource.id');
            $c->leftJoin('sfFieldIds','RuleFields',$this->classKey.'.id = RuleFields.multi_id and RuleFields.where = 1');
            $c->select($this->modx->getSelectColumns($this->classKey, $this->classKey));
            $c->select($this->modx->getSelectColumns('modResource', 'modResource', '', array('pagetitle')));
            $c->select(array('count(RuleFields.id) as fields_where'));
            $c->groupby($this->classKey.'.id');

        //}


        return $c;
    }


    /**
     * @param xPDOObject $object
     *
     * @return array
     */
    public function prepareRow(xPDOObject $object)
    {
        if ($this->getProperty('combo')) {
            $array = array(
                'id' => $object->get('id'),
                'name' => "({$object->get('id')}) ".$object->get('name'),
            );
        } else {
            $array = $object->toArray();

//        $array['pagetitle'] = '';
//        if ($page = $array['page']) {
//            $q = $this->modx->newQuery('modResource', array('id' => $page));
//            $q->select('pagetitle');
//            $q->limit(1);
//            if ($q->prepare() && $q->stmt->execute()) {
//                $array['pagetitle'] = $q->stmt->fetch(PDO::FETCH_COLUMN);
//            }
//        }

            $array['actions'] = array();

            if ($array['active']) {
                //recount
                $array['actions'][] = array(
                    'cls' => '',
                    'icon' => 'icon icon-refresh',
                    'title' => $this->modx->lexicon('seofilter_url_recount'),
                    'multiple' => $this->modx->lexicon('seofilter_url_recount'),
                    'action' => 'reCounting',
                    'button' => false,
                    'menu' => true,
                );
            }

            // Edit
            $array['actions'][] = array(
                'cls' => '',
                'icon' => 'icon icon-edit',
                'title' => $this->modx->lexicon('seofilter_rule_update'),
                //'multiple' => $this->modx->lexicon('seofilter_rules_update'),
                'action' => 'updateRule',
                'button' => true,
                'menu' => true,
            );

            // Duplicate
            $array['actions'][] = array(
                'cls' => '',
                'icon' => 'icon icon-files-o',
                'title' => $this->modx->lexicon('seofilter_rule_duplicate'),
                'action' => 'duplicateRule',
                'button' => true,
                'menu' => true,
            );

            if (!$array['active']) {
                $array['actions'][] = array(
                    'cls' => '',
                    'icon' => 'icon icon-power-off action-green',
                    'title' => $this->modx->lexicon('seofilter_rule_enable'),
                    'multiple' => $this->modx->lexicon('seofilter_rules_enable'),
                    'action' => 'enableRule',
                    'button' => true,
                    'menu' => true,
                );
            } else {
                $array['actions'][] = array(
                    'cls' => '',
                    'icon' => 'icon icon-power-off action-gray',
                    'title' => $this->modx->lexicon('seofilter_rule_disable'),
                    'multiple' => $this->modx->lexicon('seofilter_rules_disable'),
                    'action' => 'disableRule',
                    'button' => true,
                    'menu' => true,
                );
            }

            // Remove
            $array['actions'][] = array(
                'cls' => '',
                'icon' => 'icon icon-trash-o action-red',
                'title' => $this->modx->lexicon('seofilter_rule_remove'),
                'multiple' => $this->modx->lexicon('seofilter_rules_remove'),
                'action' => 'removeRule',
                'button' => true,
                'menu' => true,
            );
        }

        return $array;
    }

}

return 'sfRuleGetListProcessor';