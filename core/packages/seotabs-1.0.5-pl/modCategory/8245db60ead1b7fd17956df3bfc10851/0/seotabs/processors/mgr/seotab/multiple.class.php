<?php

class SeoTabsSeoTabMultipleProcessor extends modProcessor
{

    /** @var SeoTabs $seotabs */
    public $seotabs;
    public $languageTopics = array('seotabs:default');

    public function initialize()
    {
        $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');
        return parent::initialize();
    }

    /**
     * @return array|string
     */
    public function process()
    {
        $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');

        if (!$method = $this->getProperty('method', false)) {
            return $this->failure();
        }
        $ids = json_decode($this->getProperty('ids'), true);
        if (empty($ids)) {
            return $this->success();
        }

        foreach ($ids as $id) {
            $this->modx->error->reset();
            /** @var modProcessorResponse $response */
            $response = $this->modx->runProcessor(
                'mgr/seotab/' . $method,
                array('id' => $id),
                array('processors_path' => $this->seotabs->config['processorsPath'])
            );
            if ($response->isError()) {
                return $response->getResponse();
            }
        }

        return $this->success();
    }

}

return 'SeoTabsSeoTabMultipleProcessor';