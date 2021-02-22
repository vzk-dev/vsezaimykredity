<?php

class SeoTabsSeoTabCreateProcessor extends modObjectCreateProcessor
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
        $rid = $this->getProperty('rid');
        $name = trim($this->getProperty('name'));
        $url = trim($this->getProperty('url', ''));
        $active = trim($this->getProperty('active', 1));

        if ($this->modx->getCount($this->classKey, array('rid' => $rid, 'name' => $name))) {
            return $this->modx->lexicon('seotabs_err_tab_name_ae');
        }

        if ($url !== '') {
            if ($this->modx->getCount($this->classKey, array('rid' => $rid, 'url' => $url))) {
                return $this->modx->lexicon('seotabs_err_tab_alias_ae');
            }
        }

        if (!$active && !$this->modx->getCount($this->classKey, array('rid' => $rid, 'active' => 1, 'enabled' => 1))) {
            return $this->modx->lexicon('seotabs_err_tab_not_active');
        }

        if ($this->getProperty('rank', '') === '') {
            $rank = $this->modx->getCount($this->classKey, array('rid' => $rid)) + 1;
            $this->setProperty('rank', $rank);
        }
        $this->setProperty('name', $name);
        $this->setProperty('url', $url);

        return true;
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

return 'SeoTabsSeoTabCreateProcessor';