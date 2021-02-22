<?php

class SeoTabsSeoTabRemoveProcessor extends modObjectRemoveProcessor
{
    public $classKey = 'SeoTab';
    public $languageTopics = array('seotabs:default');
    /** @var SeoTabs $seotabs */
    public $seotabs;

    public function initialize()
    {
        $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');
        return parent::initialize();
    }

    public function beforeRemove()
    {
        $rid = $this->object->get('rid');
        $count = $this->modx->getCount($this->classKey, array('rid' => $rid, 'enabled' => 1));
        if ($count > 1 && $this->object->get('active')) {
            return $this->modx->lexicon('seotabs_err_tab_not_active');
        }
        return parent::beforeRemove();
    }

    public function afterRemove()
    {
        if ($ok = parent::afterRemove()) {
            $sql = "UPDATE {$this->modx->getTableName($this->classKey)} SET `rank`=`rank`-1 WHERE `rank`>{$this->object->get('rank')} AND  rid = {$this->object->get('rid')}";
            $this->modx->exec($sql);
            $this->seotabs->getTools()->refreshCache();
        }
        return $ok;
    }

}

return 'SeoTabsSeoTabRemoveProcessor';