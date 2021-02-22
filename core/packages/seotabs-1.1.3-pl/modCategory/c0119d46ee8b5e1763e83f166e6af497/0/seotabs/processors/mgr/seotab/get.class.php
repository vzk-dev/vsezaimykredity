<?php

class SeoTabsSeoTabGetProcessor extends modObjectGetProcessor
{
    public $classKey = 'SeoTab';
    public $languageTopics = array('seotabs:default');
    /** @var SeoTabs $seotabs */
    public $seotabs;

    public function initialize()
    {
        // $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');
        return parent::initialize();
    }

}

return 'SeoTabsSeoTabGetProcessor';