<?php

class SeoTabsSeoTabUpdateProcessor extends modObjectUpdateProcessor
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

    public function beforeSet()
    {
        $id = $this->getProperty('id', 0);
        $rid = $this->getProperty('rid', 0);
        $name = trim($this->getProperty('name'));
        $url = trim($this->getProperty('url', ''));

        if ($this->modx->getCount($this->classKey, array('id:!=' => $id, 'rid' => $rid, 'name' => $name))) {
            return $this->modx->lexicon('seotabs_err_tab_name_ae');
        }

        if ($url !== '') {
            if ($this->modx->getCount($this->classKey, array('id:!=' => $id, 'rid' => $rid, 'url' => $url))) {
                return $this->modx->lexicon('seotabs_err_tab_alias_ae');
            }
        }

        $this->setProperty('name', $name);
        $this->setProperty('url', $url);

        return true;
    }

    public function beforeSave()
    {
        $id = $this->object->get('id');
        $rid = $this->object->get('rid');
        $active = trim($this->getProperty('active', 1));
        if (!$active && !$this->modx->getCount($this->classKey, array('rid' => $rid, 'id:!=' => $id, 'active' => 1, 'enabled' => 1))) {
            return $this->modx->lexicon('seotabs_err_tab_not_active');
        }
        return parent::beforeSave();
    }

    public function afterSave()
    {
        if ($ok = parent::afterSave()) {
            $active = trim($this->getProperty('active', 1));
            if ($active) {
                $id = $this->object->get('id');
                $rid = $this->object->get('rid');
                $table = $this->modx->getTableName($this->classKey);
                $sql = "UPDATE {$table} SET active = 0 WHERE rid = {$rid} AND id !={$id}";
                $this->modx->exec($sql);
            }
            $this->seotabs->getTools()->refreshCache();
        }
        return $ok;
    }

}

return 'SeoTabsSeoTabUpdateProcessor';