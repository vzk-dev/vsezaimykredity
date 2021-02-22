<?php

class SeoTabsSeoTabGetProcessor extends modProcessor
{
    public $classKey = 'SeoTab';
    public $languageTopics = array('seotabs:default');
    public $permission = '';
    /** @var SeoTabs $seotabs */
    public $seotabs;
    /** @var SeoTab[] */
    public $tabs = array();

    public function initialize()
    {
        $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');
        return parent::initialize();
    }

    /**
     * {@inheritDoc}
     * @return mixed
     */
    public function process()
    {
        return $this->cleanup();
    }

    /**
     * Return the response
     * @return array
     */
    public function cleanup()
    {
        $result = array();
        $rid = $this->getProperty('rid', 0);
        $ids = $this->getProperty('ids', array());
        if (empty($ids)) {
            return $this->failure('Not set tab ids');
        }
        $this->tabs = $this->getTabs($ids);
        /**@var modResource $resource */
        $resource = $this->modx->getObject('modResource', $rid);
        $this->modx->resource = $resource;
        $resourceData = $resource->toArray();
        if ($this->tabs) {
            foreach ($this->tabs as $tab) {
                $content = $this->seotabs->getTools()->getPdoTools()->getChunk('@INLINE ' . $tab->get('content'), $resourceData, true);
                $this->modx->resource->_output = $content;
                $this->modx->invokeEvent("OnWebPagePrerender");
                $content = $this->modx->resource->_output;
                $result[$tab->get('id')] = array(
                    'seo' => $tab->get('seo'),
                    'meta' => $this->seotabs->getTools()->prepareTabMetaData($tab->toArray(), $resourceData),
                    'content' => $this->seotabs->getTools()->getPdoTools()->getChunk('@INLINE ' . $content, $resourceData, true),
                );
            }
        }
        return $this->success('', $result);
    }

    /**
     * @param array $ids
     * @return SeoTab[]|null
     */
    public function getTabs($ids)
    {
        $q = $this->modx->newQuery($this->classKey);
        $q->where(array('id:IN' => $ids));
        return $this->modx->getCollection($this->classKey, $q);
    }

}

return 'SeoTabsSeoTabGetProcessor';