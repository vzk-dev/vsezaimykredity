<?php

class SeoTabsResourceGetListProcessor extends modObjectGetListProcessor
{
    public $classKey = 'SeoTab';
    public $languageTopics = array('seotabs:default');
    public $defaultSortField = 'id';
    public $defaultSortDirection = 'ASC';
    public $checkListPermission = true;

    public function initialize()
    {

        /*if (!$this->getProperty('limit')) {
            $this->setProperty('limit', 20);
        }*/

        if ($this->getProperty('sort') == 'menuindex') {
            $this->setProperty('sort', 'Resource.parent ' . $this->getProperty('dir') . ', Resource.menuindex');
        }

        return parent::initialize();
    }

    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        $c->leftJoin('modResource', 'Resource', 'Resource.id = ' . $this->classKey . '.rid');
        $c->leftJoin('modContext', 'modContext', 'modContext.key = Resource.context_key');
        $c->select('Resource.id ,Resource.pagetitle, Resource.context_key, modContext.name AS context_name');

        $c->where(array(
            $this->classKey . '.rid:!=' => $this->getProperty('target')
        ));

        $query = $this->getProperty('query');
        if (!empty($query)) {
            if (is_numeric($query)) {
                $c->where(array(
                    'Resource.id:=' => $query,
                ));
            } else {
                $c->where(array(
                    'Resource.pagetitle:LIKE' => '%' . $query . '%',
                ));
            }
        }

        $c->groupby('Resource.id');

        return $c;
    }

    /**
     * @return array
     */
    public function getData()
    {
        $data = array();
        $limit = intval($this->getProperty('limit'));
        $start = intval($this->getProperty('start'));

        $c = $this->modx->newQuery($this->classKey);
        $c = $this->prepareQueryBeforeCount($c);
        $data['total'] = $this->modx->getCount($this->classKey, $c);
        $c = $this->prepareQueryAfterCount($c);

        $sortClassKey = $this->getSortClassKey();
        $sortKey = $this->modx->getSelectColumns($sortClassKey, $this->getProperty('sortAlias', $sortClassKey), '',
            array($this->getProperty('sort')));
        if (empty($sortKey)) {
            $sortKey = $this->getProperty('sort');
        }
        $c->sortby($sortKey, $this->getProperty('dir'));
        if ($limit > 0) {
            $c->limit($limit, $start);
        }

        if ($c->prepare() && $c->stmt->execute()) {
            $data['results'] = $c->stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        return $data;
    }


    /**
     * @param array $data
     *
     * @return array
     */
    public function iterate(array $data)
    {
        $list = array();
        $list = $this->beforeIteration($list);
        $this->currentIndex = 0;
        /** @var xPDOObject|modAccessibleObject $object */
        foreach ($data['results'] as $array) {
            $list[] = $this->prepareArray($array);
            $this->currentIndex++;
        }
        $list = $this->afterIteration($list);

        return $list;
    }


    /**
     * @param array $array
     *
     * @return array
     */
    public function prepareArray(array $array)
    {
        if ($this->getProperty('combo')) {
            $array['parents'] = array();
            $parents = $this->modx->getParentIds($array['id'], 2, array(
                'context' => $array['context_key'],
            ));
            if (empty($parents[count($parents) - 1])) {
                unset($parents[count($parents) - 1]);
            }
            if (!empty($parents) && is_array($parents)) {
                $q = $this->modx->newQuery('modResource', array('id:IN' => $parents));
                $q->select('id,pagetitle');
                if ($q->prepare() && $q->stmt->execute()) {
                    while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)) {
                        $key = array_search($row['id'], $parents);
                        if ($key !== false) {
                            $parents[$key] = $row;
                        }
                    }
                }
                $array['parents'] = array_reverse($parents);
            }
        }
        return $array;
    }

}

return 'SeoTabsResourceGetListProcessor';