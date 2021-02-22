<?php

class SeoTabsSeoTabGetListProcessor extends modObjectGetListProcessor
{
    public $languageTopics = array('seotabs:default');
    public $classKey = 'SeoTab';
    public $defaultSortField = 'rank';
    public $defaultSortDirection = 'ASC';
    public $checkListPermission = true;
    /** @var SeoTabs $seotabs */
    public $seotabs;

    public function initialize()
    {
        // $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');
        return parent::initialize();
    }

    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        $query = $this->getProperty('query');
        $rid = $this->getProperty('rid', 0);

        if (!empty($query)) {
            $c->where(array(
                'name:LIKE' => '%' . $query . '%',
                'OR:url:LIKE' => "%{$query}%",
            ));
        }

        $c->where(array(
            'rid' => $rid,
        ));
        return $c;
    }

    public function prepareRow(xPDOObject $object)
    {
        $data = $object->toArray();

        if (!$this->getProperty('combo')) {
            $data['actions'] = array(
                array(
                    'cls' => array(
                        'menu' => 'green',
                        'button' => 'green',
                    ),
                    'icon' => 'icon icon-edit',
                    'title' => $this->modx->lexicon('seotabs_menu_update'),
                    'action' => 'updateTab',
                    'button' => true,
                    'menu' => true,
                ),
            );

            if (!$data['enabled']) {
                $data['actions'][] = array(
                    'cls' => array(
                        'menu' => 'blue',
                        'button' => 'blue',
                    ),
                    'icon' => 'icon icon-power-off',
                    'title' => $this->modx->lexicon('seotabs_menu_enable'),
                    'multiple' => $this->modx->lexicon('seotabs_menu_multiple_enable'),
                    'action' => 'enableTab',
                    'button' => true,
                    'menu' => true,
                );
            } else {
                $data['actions'][] = array(
                    'cls' => array(
                        'menu' => 'gray',
                        'button' => 'gray',
                    ),
                    'icon' => 'icon icon-power-off',
                    'title' => $this->modx->lexicon('seotabs_menu_disable'),
                    'multiple' => $this->modx->lexicon('seotabs_menu_multiple_disable'),
                    'action' => 'disableTab',
                    'button' => true,
                    'menu' => true,
                );
            }

            $data['actions'][] = array(
                'cls' => array(
                    'menu' => 'red',
                    'button' => 'red',
                ),
                'icon' => 'icon icon-trash-o',
                'title' => $this->modx->lexicon('seotabs_menu_remove'),
                'multiple' => $this->modx->lexicon('seotabs_menu_multiple_remove'),
                'action' => 'removeTab',
                'button' => true,
                'menu' => true,
            );

        }

        return $data;
    }
}

return 'SeoTabsSeoTabGetListProcessor';