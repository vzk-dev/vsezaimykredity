<?php

/**
 * The home manager controller for tvSuperSelect.
 *
 */
class tvSuperSelectHomeManagerController extends tvSuperSelectMainController {
	/* @var tvSuperSelect $tvSuperSelect */
	public $tvSuperSelect;


	/**
	 * @param array $scriptProperties
	 */
	public function process(array $scriptProperties = array()) {
	}


	/**
	 * @return null|string
	 */
	public function getPageTitle() {
		return $this->modx->lexicon('tvsuperselect');
	}


	/**
	 * @return void
	 */
	public function loadCustomCssJs() {
		$this->addCss($this->tvSuperSelect->config['cssUrl'] . 'mgr/main.css');
		$this->addCss($this->tvSuperSelect->config['cssUrl'] . 'mgr/bootstrap.buttons.css');
		$this->addJavascript($this->tvSuperSelect->config['jsUrl'] . 'mgr/misc/utils.js');
		$this->addJavascript($this->tvSuperSelect->config['jsUrl'] . 'mgr/widgets/items.grid.js');
		$this->addJavascript($this->tvSuperSelect->config['jsUrl'] . 'mgr/widgets/items.windows.js');
		$this->addJavascript($this->tvSuperSelect->config['jsUrl'] . 'mgr/widgets/home.panel.js');
		$this->addJavascript($this->tvSuperSelect->config['jsUrl'] . 'mgr/sections/home.js');
		$this->addHtml('<script type="text/javascript">
		Ext.onReady(function() {
			MODx.load({ xtype: "tvsuperselect-page-home"});
		});
		</script>');
	}


	/**
	 * @return string
	 */
	public function getTemplateFile() {
		return $this->tvSuperSelect->config['templatesPath'] . 'home.tpl';
	}
}