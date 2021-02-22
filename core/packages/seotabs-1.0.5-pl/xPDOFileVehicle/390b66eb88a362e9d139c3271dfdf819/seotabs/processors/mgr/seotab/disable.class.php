<?php

class SeoTabsSeoTabDisableProcessor extends modObjectUpdateProcessor
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
        $this->setProperty('enabled', 0);
        return true;
    }

    public function afterSave()
    {
        if ($ok = parent::afterSave()) {
            $this->seotabs->getTools()->refreshCache();
        }
        return $ok;
    }
}

return 'SeoTabsSeoTabDisableProcessor';