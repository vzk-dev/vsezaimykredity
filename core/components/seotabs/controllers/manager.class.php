<?php
/**
 * @package seotabs
 * @subpackage controllers
 */


class seoTabsManagerController extends modExtraManagerController
{
    /** @var SeoTabs $seotabs */
    public $seotabs;

    public function initialize()
    {
        $this->seotabs = $this->modx->getService('seotabs', 'SeoTabs');

        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/seotabs.js');
        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/misc/strftime-min-1.3.js');
        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/misc/clipboard.js');
        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/misc/default.grid.js');
        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/misc/default.window.js');
        $this->addJavascript($this->seotabs->config['jsUrl'] . 'mgr/misc/combo.js');

        $this->addCss($this->seotabs->config['cssUrl'] . 'mgr/main.css');
        $this->addCss($this->seotabs->config['cssUrl'] . 'mgr/bootstrap.buttons.css');
        $this->addCss($this->seotabs->config['assetsUrl'] . 'vendor/fontawesome/css/font-awesome.min.css');

        $this->addHtml('<script type="text/javascript">
        Ext.onReady(function() {
            SeoTabs.config = ' . $this->modx->toJSON($this->getConfig()) . ';
        });
        </script>');

        return parent::initialize();
    }

    /**
     * @return array
     */
    public function getConfig()
    {
        return $this->seotabs->config;
    }

    public function getLanguageTopics()
    {
        return array('seotabs:default');
    }

    public function checkPermissions()
    {
        return true;
    }
}