<?php

/**
 * MODx SeoTabs Class
 *
 * @package seotabs
 */
class SeoTabs
{

    const version = '1.1.1-pl';
    /** @var SeoTabsController $controller */
    public $controller;
    /** @var SeoTabsTools $tools */
    public $tools;
    public $namespace = 'seotabs';

    /**
     * SeoTabs constructor.
     * @param modX $modx
     * @param array $config
     */
    function __construct(modX &$modx, array $config = array())
    {
        $this->modx =& $modx;
        $this->modx->lexicon->load('seotabs:default');
        $corePath = $modx->getOption('seotabs.core_path', $config, $modx->getOption('core_path', null, MODX_CORE_PATH) . 'components/seotabs/');
        $assetsUrl = $modx->getOption('seotabs.assets_url', $config, $modx->getOption('assets_url') . 'components/seotabs/');
        $assetsPath = $modx->getOption('seotabs.assets_path', $config, $modx->getOption('assets_path', null, MODX_ASSETS_PATH) . 'components/seotabs/');
        $this->config = array_merge(array(
            'chunksPath' => $corePath . 'elements/chunks/',
            'controllersPath' => $corePath . 'controllers/',
            'corePath' => $corePath,
            'assetsUrl' => $assetsUrl,
            'assetsPath' => $assetsPath,
            'modelPath' => $corePath . 'model/',
            'processorsPath' => $corePath . 'processors/',
            'jsUrl' => $assetsUrl . 'js/',
            'cssUrl' => $assetsUrl . 'css/',
            'templatesPath' => $corePath . 'elements/templates/',
            'connector_url' => $assetsUrl . 'connector.php',
            'actionUrl' => $assetsUrl . 'action.php',
            'handlersPath' => $corePath . 'handlers/',
            'toolsHandler' => $this->modx->getOption('seotabs_tools_handler_class', null, 'SeoTabsTools', true),
            'cacheTime' => (int)$this->modx->getOption('cache_resource_expires', null, 0),
        ), $config);
        $this->modx->addPackage('seotabs', $this->config['modelPath']);
        // $this->checkStat();
    }

    /**
     * @return string
     */
    public function getNamespace()
    {
        return $this->namespace;
    }

    /**
     * Shorthand for the call of processor
     *
     * @access public
     *
     * @param string $action Path to processor
     * @param array $data Data to be transmitted to the processor
     *
     * @return mixed The result of the processor
     */
    public function runProcessor($action = '', $data = array())
    {
        if (empty($action)) {
            return $this->modx->error->failure();
        }

        if ($this->modx->context->get('key') !== 'mgr') {
            $action = 'web/' . $action;
        }
        $this->modx->error->reset();
        $processorsPath = !empty($this->config['processorsPath'])
            ? $this->config['processorsPath']
            : MODX_CORE_PATH . 'components/seotabs/processors/';

        return $this->modx->runProcessor($action, $data, array(
            'processors_path' => $processorsPath,
        ));
    }

    /**
     * @param modProcessorResponse|array $response
     * @return array
     */
    public function prepareResponse($response)
    {
        if ($response instanceof modProcessorResponse) {
            $output = $response->getResponse();
        } else {
            $output = $response;
        }
        return $output;
    }

    /**
     * @param array $config
     * @return SeoTabsTools
     */
    public function getTools(array $config = array())
    {
        if (!is_object($this->tools) || !($this->tools instanceof SeoTabsTools)) {
            $toolsClass = $this->modx->loadClass('tools.' . $this->config['toolsHandler'], $this->config['handlersPath'], true, true);
            if ($toolsClass) {
                $config = array_merge($this->config, $config);
                $this->tools = new $toolsClass($this, $config);
            }
        }
        return $this->tools;
    }

    /**
     * @param int $template
     * @return bool
     */
    public function isWorkingTemplates($template)
    {
        $templates = $this->getTools()->explodeAndClean($this->modx->getOption('seotabs_working_templates', null, ''));
        return empty($templates) || in_array($template, $templates);
    }

    /**
     * @param int $rid
     * @param modManagerController $controller
     */
    public function loadControllerJsCss($rid, modManagerController &$controller)
    {
        $controller->addLexiconTopic('seotabs:default');
        $config = array_merge($this->config, array(
            'rid' => $rid,
            'description_default' => $this->modx->getOption('seotabs_description_default'),
        ));
        $controller->addHtml("<script type='text/javascript'>  SeoTabs.config = {$this->modx->toJSON($config)}</script>");
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/seotabs.js');
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/misc/clipboard.js');
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/misc/combo.js');
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/misc/strftime-min-1.3.js');
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/misc/default.grid.js');
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/misc/default.window.js');
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/seotab/seotab.grid.js');
        $controller->addJavascript($this->config['jsUrl'] . 'mgr/inject/inject.js');

        $controller->addCss($this->config['cssUrl'] . 'mgr/main.css');
        $controller->addCss($this->config['cssUrl'] . 'mgr/bootstrap.buttons.css');
        $controller->addCss($this->config['assetsUrl'] . 'vendor/fontawesome/css/font-awesome.min.css');

    }


    protected function checkStat()
    {
        $key = strtolower(__CLASS__);
        /** @var modDbRegister $registry */
        $registry = $this->modx->getService('registry', 'registry.modRegistry')
            ->getRegister('user', 'registry.modDbRegister');
        $registry->connect();
        $registry->subscribe('/modstore/' . md5($key));
        if ($res = $registry->read(array('poll_limit' => 1, 'remove_read' => false))) {
            return;
        }
        $c = $this->modx->newQuery('transport.modTransportProvider', array('service_url:LIKE' => '%modstore%'));
        $c->select('username,api_key');
        /** @var modRest $rest */
        $rest = $this->modx->getService('modRest', 'rest.modRest', '', array(
            'baseUrl' => 'https://modstore.pro/extras',
            'suppressSuffix' => true,
            'timeout' => 1,
            'connectTimeout' => 1,
        ));
        if ($rest) {
            $level = $this->modx->getLogLevel();
            $this->modx->setLogLevel(modX::LOG_LEVEL_FATAL);
            $rest->post('stat', array(
                'package' => $key,
                'version' => $this::version,
                'keys' => $c->prepare() && $c->stmt->execute()
                    ? $c->stmt->fetchAll(PDO::FETCH_ASSOC)
                    : array(),
                'uuid' => $this->modx->uuid,
                'database' => $this->modx->config['dbtype'],
                'revolution_version' => $this->modx->version['code_name'] . '-' . $this->modx->version['full_version'],
                'supports' => $this->modx->version['code_name'] . '-' . $this->modx->version['full_version'],
                'http_host' => $this->modx->getOption('http_host'),
                'php_version' => XPDO_PHP_VERSION,
                'language' => $this->modx->getOption('manager_language'),
            ));
            $this->modx->setLogLevel($level);
        }
        $registry->subscribe('/modstore/');
        $registry->send('/modstore/', array(md5($key) => true), array('ttl' => 3600 * 24));
    }
}