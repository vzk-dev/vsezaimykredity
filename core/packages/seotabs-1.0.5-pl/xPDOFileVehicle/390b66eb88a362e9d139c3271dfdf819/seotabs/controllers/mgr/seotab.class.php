<?php
if (!class_exists('seoTabsManagerController')) {
    require_once dirname(dirname(__FILE__)) . '/manager.class.php';
}


class seoTabsMgrSeoTabManagerController extends seoTabsManagerController
{

    public function loadCustomCssJs()
    {

        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/seotab/seotab.grid.js');
        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/seotab/seotab.panel.js');
        $this->addHtml('<script type="text/javascript">
        // <![CDATA[
        Ext.onReady(function() {
            MODx.add({
              xtype: "seotabs-panel-seotab",
              });
        });
        // ]]>
        </script>');
        $this->modx->invokeEvent('seotabsOnManagerCustomCssJs', array('controller' => &$this, 'page' => 'seotab'));
    }

    /**
     * @return array
     */
    public function getConfig()
    {
        $config = parent::getConfig();
        $config['title_default'] = $this->modx->getOption('seotabs_title_default');
        $config['description_default'] = $this->modx->getOption('seotabs_description_default');
        return $config;
    }

    public function getPageTitle()
    {
        return $this->modx->lexicon('msimportexport_page_title_seotab');
    }
}