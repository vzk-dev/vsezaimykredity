<?php
if (!class_exists('seoTabsManagerController')) {
    require_once dirname(dirname(__FILE__)) . '/manager.class.php';
}


class seoTabsMgrTabsManagerController extends seoTabsManagerController
{

    public function loadCustomCssJs()
    {

        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/seotabs/tree.resource.js');
        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/seotabs/tabs.panel.js');
        $this->addHtml('<script type="text/javascript">
        // <![CDATA[
        Ext.onReady(function() {
            MODx.add({
              xtype: "seotabs-panel-tabs",
              });
        });
        // ]]>
        </script>');
        $this->modx->invokeEvent('seotabsOnManagerCustomCssJs', array('controller' => &$this, 'page' => 'seotabs'));
    }

    public function getPageTitle()
    {
        return $this->modx->lexicon('seotabs_page_title_tree_tabs');
    }
}