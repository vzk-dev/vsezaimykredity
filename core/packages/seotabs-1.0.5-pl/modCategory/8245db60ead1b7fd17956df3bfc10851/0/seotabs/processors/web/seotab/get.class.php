<?php

class SeoTabsSeoTabGetProcessor extends modObjectGetProcessor
{
    public $classKey = 'SeoTab';
    public $languageTopics = array('seotabs:default');
    public $permission = '';
    /** @var SeoTabs $seotabs */
    public $seotabs;

    public function initialize()
    {
        $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');
        return parent::initialize();
    }

    /**
     * Return the response
     * @return array
     */
    public function cleanup()
    {
        $rid = $this->getProperty('rid', 0);
        $seo = $this->object->get('seo');
        /**@var modResource $resource */
        $resource = $this->modx->getObject('modResource', $rid);
        $this->modx->resource = $resource;
        $resourceData = $resource->toArray();
        $meta = $this->seotabs->getTools()->prepareTabMetaData($this->object->toArray(), $resourceData);

        $content = '';
        if ($seo) {
            $content = $this->seotabs->getTools()->getPdoTools()->getChunk('@INLINE ' . $this->object->get('content'), $resourceData, true);
        }
        return $this->success($content, array('meta' => $meta, 'seo' => $seo));
    }

}

return 'SeoTabsSeoTabGetProcessor';