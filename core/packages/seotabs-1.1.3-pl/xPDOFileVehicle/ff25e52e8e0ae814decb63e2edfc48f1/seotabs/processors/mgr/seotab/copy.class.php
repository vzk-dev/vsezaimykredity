<?php

class SeoTabsSeoTabCopyProcessor extends modObjectProcessor
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

    /**
     * @return array|string
     */
    public function process()
    {
        $targetId = $this->getProperty('target');
        $sourceId = $this->getProperty('source');

        /** @var modResource $target */
        if (!$target = $this->modx->getObject('modResource', $targetId)) {
            return $this->failure($this->modx->lexicon('seotabs_err_resource_nf', array('id' => $targetId)));
        }

        /** @var modResource $source */
        if (!$source = $this->modx->getObject('modResource', $sourceId)) {
            return $this->failure($this->modx->lexicon('seotabs_err_resource_nf', array('id' => $sourceId)));
        }

        if ($tabs = $this->getTabs($sourceId)) {
            foreach ($tabs as $tab) {
                if ($fTab = $this->findTab($targetId, $tab)) {
                    $tab['target_id'] = $targetId;
                    $tab['source_id'] = $sourceId;
                    if ($fTab->get('name') == $tab['name']) {
                        $err = $this->modx->lexicon('seotabs_err_cope_tab_name_ae', $tab);
                    } else {
                        $err = $this->modx->lexicon('seotabs_err_cope_tab_alias_ae', $tab);
                    }
                    $this->modx->log(modX::LOG_LEVEL_ERROR, $err);
                } else {
                    $this->addTab($targetId, $tab);
                }
            }
            $this->seotabs->getTools()->refreshCache();
        }
        return $this->modx->error->success();
    }

    /**
     * @param int $rid
     * @param array $data
     * @return bool
     */
    public function addTab($rid, array $data = array())
    {
        $tab = $this->modx->newObject($this->classKey);
        $tab->fromArray($data);
        $tab->set('rid', $rid);
        return $tab->save();
    }

    /**
     * @param int $rid
     * @return array
     */
    public function getTabs($rid)
    {
        $result = array();
        $q = $this->modx->newQuery($this->classKey);
        $q->select($this->modx->getSelectColumns($this->classKey, $this->classKey, '', array('id', 'rid'), true));
        $q->where(array(
            'rid' => $rid
        ));
        if ($q->prepare() && $q->stmt->execute()) {
            $result = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        return $result;
    }

    /**
     * @param int $rid
     * @param array $options
     * @return SeoTab|null
     */
    public function findTab($rid, array $options = array())
    {
        $q = $this->modx->newQuery($this->classKey);
        $q->where(array(
            'rid' => $rid,
            'name' => $this->modx->getOption('name', $options, '', true),
            'OR:rid:=' => $rid,
            'url:!=' => '',
            'url' => $this->modx->getOption('url', $options, '', true),
        ));
        /*  $q->prepare();
          $this->modx->log(modX::LOG_LEVEL_ERROR, $q->toSQL());*/

        return $this->modx->getObject($this->classKey, $q);
    }
}

return 'SeoTabsSeoTabCopyProcessor';