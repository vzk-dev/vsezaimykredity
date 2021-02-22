<?php

class SeoTabsTools
{

    /** @var modX $modx */
    public $modx;
    /** @var SeoTabs $seotabs */
    public $seotabs;
    /** @var pdoTools $pdoTools */
    public $pdoTools;
    /** @var miniShop2 $ms2 */
    public $ms2;
    /** @var array $config */
    protected $config = array();

    public function __construct(SeoTabs &$seotabs, $config = array())
    {
        $this->seotabs = &$seotabs;
        $this->modx = &$seotabs->modx;
        $this->config = array_merge($this->config, $config);
    }

    /**
     * @param array $config
     * @return pdoTools|null
     */
    public function getPdoTools($config = array())
    {
        if (!$this->hasAddition('pdotools')) return null;
        if (class_exists('pdoFetch') && (!isset($this->pdoTools) || !is_object($this->pdoTools))) {
            $this->pdoTools = $this->modx->getService('pdoFetch');
            $this->pdoTools->setConfig($config);
        }
        return empty($this->pdoTools) ? null : $this->pdoTools;
    }

    /**
     * @param string $ctx
     * @param array $config
     * @return  miniShop2|null
     */
    public function getMs2($ctx = '', $config = array())
    {
        if (!$this->hasAddition('minishop2')) return null;
        $ctx = $ctx ? $ctx : $this->modx->context->key;
        if (class_exists('miniShop2') && (!isset($this->ms2) || !is_object($this->ms2))) {
            $this->ms2 = $this->modx->getService('miniShop2');
            $this->ms2->initialize($ctx, $config);
        }

        return empty($this->ms2) ? null : $this->ms2;
    }

    /**
     * @param string $key
     * @param string $value
     * @param string $namespace
     * @param bool $clearCache
     * @return bool
     */
    public function setOption($key, $value, $namespace = '', $clearCache = false)
    {
        if (empty(trim($key))) return false;

        $namespace = $namespace ? $namespace : $this->seotabs->getNamespace();
        $key = $namespace . '_' . $key;

        if (!$setting = $this->modx->getObject('modSystemSetting', $key)) {
            $setting = $this->modx->newObject('modSystemSetting');
            $setting->set('namespace', $namespace);
        }

        $val = is_array($value) ? $this->modx->toJSON($value) : $value;
        $setting->set('value', $val);

        if ($setting->save()) {
            $this->modx->setOption($key, $value);
            if ($clearCache) {
                $this->modx->cacheManager->refresh(array('system_settings' => array()));
            }
            return true;
        }
        return false;
    }

    /**
     * @param $key
     * @param array $config
     * @param null $default
     * @param bool $skipEmpty
     * @return mixed|null
     */
    public function getOption($key, $config = array(), $default = null, $skipEmpty = false)
    {
        $option = $default;
        $key = $this->seotabs->getNamespace() . '_' . $key;

        if (!empty($key) AND is_string($key)) {
            if ($config != null AND array_key_exists($key, $config)) {
                $option = $config[$key];
            } elseif (array_key_exists($key, $this->config)) {
                $option = $this->config[$key];
            } elseif (array_key_exists($key, $this->modx->config)) {
                $option = $this->modx->getOption($key);
            }
        }
        if ($skipEmpty AND empty($option)) {
            $option = $default;
        }

        return $option;
    }


    /**
     * @param int $rid
     * @param bool $up
     * @param array $options
     * @return array
     */
    public function getTabsData($rid, $up = true, array $options = array())
    {
        $classKey = 'SeoTab';
        $columnPrefix = $this->modx->getOption('columnPrefix', $options, '', true);
        $cacheKey = $rid . '.tabs.' . md5($up . $this->modx->toJSON($options));
        $result = $this->getCache($cacheKey);
        if ($result === null) {
            if ($up) {
                $rid = $this->prepareResourceId($rid);
            }
            if ($rid) {
                $result = array();
                $q = $this->modx->newQuery($classKey);
                $q->select($this->modx->getSelectColumns($classKey, $classKey, $columnPrefix));
                $q->where(array(
                    'rid' => $rid,
                    'enabled' => 1
                ));
                $q->sortby("rank", 'ASC');
                if ($q->prepare() && $q->stmt->execute()) {
                    $result = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
                }
                $this->setCache($cacheKey, $result);
            }
        }
        return $result;
    }

    /**
     * @param int $rid
     * @param bool $up
     * @param array $options
     * @return array
     */
    public function getActiveTabData($rid, $up = true, array $options = array())
    {
        $classKey = 'SeoTab';
        $columnPrefix = $this->modx->getOption('columnPrefix', $options, '', true);
        $cacheKey = $rid . '.active_tab.' . md5($up . $this->modx->toJSON($options));
        $result = $this->getCache($cacheKey);
        if ($result === null) {
            if ($up) {
                $rid = $this->prepareResourceId($rid);
            }
            if ($rid) {
                $result = array();
                $q = $this->modx->newQuery($classKey);
                $q->select($this->modx->getSelectColumns($classKey, $classKey, $columnPrefix));
                $q->where(array(
                    'rid' => $rid,
                    'enabled' => 1,
                    'active' => 1
                ));
                $q->sortby("rank", 'ASC');
                if ($q->prepare() && $q->stmt->execute()) {
                    $result = $q->stmt->fetch(PDO::FETCH_ASSOC);
                }
                $this->setCache($cacheKey, $result);
            }
        }
        return $result;
    }


    /**
     * @param int $id
     * @param array $options
     * @return int
     */
    public function prepareResourceId($id, array $options = array())
    {
        $classKey = 'SeoTab';
        $ctx = $this->modx->getOption('ctx', $options, $this->modx->context->key, true);
        $depth = $this->modx->getOption('depth', $options, 10, true);
        $ids = $this->modx->getParentIds($id, $depth, array('context' => $ctx));
        $cacheKey = md5($this->modx->toJSON($ids) . $this->modx->toJSON($options));
        $rid = $this->getCache($cacheKey);
        if ($rid === null) {
            array_pop($ids);
            array_unshift($ids, $id);
            $q = $this->modx->newQuery($classKey);
            $q->select($this->modx->getSelectColumns($classKey, $classKey, '', array('rid')));
            $q->where(array(
                'rid:IN' => $ids,
                'enabled' => 1
            ));
            $q->sortby("FIELD(rid, {$this->cleanAndImplode($ids)})");
            $q->limit(1);

            if ($q->prepare() && $q->stmt->execute()) {
                $id = $q->stmt->fetchColumn();
                $this->setCache($cacheKey, $rid);
            }
        } else {
            $id = $rid;
        }
        return $id;
    }

    /**
     * @param int $rid
     * @param string $alias
     * @param array $options
     * @return array
     */
    public function getTabDataByAlias($rid, $alias, array $options = array())
    {

        $classKey = 'SeoTab';
        $cacheKey = 'tab.' . md5($rid . $alias . $this->modx->toJSON($options));
        $columnPrefix = $this->modx->getOption('columnPrefix', $options, '', true);
        $result = $this->getCache($cacheKey);
        if ($result === null) {
            $result = array();
            $q = $this->modx->newQuery($classKey);
            $q->select($this->modx->getSelectColumns($classKey, $classKey, $columnPrefix));

            $q->where(array(
                'rid' => $rid,
                'alias' => $alias
            ));

            if ($q->prepare() && $q->stmt->execute()) {
                $result = $q->stmt->fetch(PDO::FETCH_ASSOC);
                $this->setCache($cacheKey, $result);
            }
        }
        return $result;
    }

    /**
     * @param array $tabData
     * @param array $resourceData
     * @param string $tabKeyPrefix
     * @return array
     */
    public function prepareTabMetaData(array $tabData, array $resourceData, $tabKeyPrefix = 'seotab_')
    {
        $meta = array();
        $data = $this->mergeTabResourceData($tabData, $resourceData, $tabKeyPrefix);
        $keys = $this->getMetaKeys();
        foreach ($keys as $key) {
            $val = '';
            if (!empty($data[$tabKeyPrefix . $key])) {
                $val = $this->getPdoTools()->getChunk('@INLINE ' . $data[$tabKeyPrefix . $key], $data);
            }
            $meta[$key] = $val;
        }
        return $meta;
    }

    /**
     * @param array $tabData
     * @param array $resourceData
     * @param string $prefix
     * @param string $tabKeyPrefix
     * @return array
     */
    public function prepareTabPlaceholderData(array $tabData, array $resourceData, $prefix = '', $tabKeyPrefix = 'seotab_')
    {
        $pls = array();
        $data = $this->mergeTabResourceData($tabData, $resourceData, $tabKeyPrefix);
        $keys = $this->getPlaceholderKeys();
        foreach ($keys as $key) {
            $val = '';
            if (!empty($data[$tabKeyPrefix . $key])) {
                $val = $this->getPdoTools()->getChunk('@INLINE ' . $data[$tabKeyPrefix . $key], $data);
            }
            $pls[$prefix . $key] = $val;
        }
        return $pls;
    }

    /**
     * @param array $tabData
     * @param array $resourceData
     * @param string $tabKeyPrefix
     * @return array
     */
    public function mergeTabResourceData(array $tabData, array $resourceData, $tabKeyPrefix = 'seotab_')
    {
        $firstKey = $this->getArrayFirstKey($tabData);
        if (strpos($firstKey, $tabKeyPrefix) === false) {
            $tabData = $this->addArrayKeyPrefix($tabData, $tabKeyPrefix);
        }
        return array_merge($resourceData, $tabData);
    }

    /**
     * @return array
     */
    public function getPlaceholderKeys()
    {
        return array(
            'name',
            'title',
            'caption',
            'description'
        );
    }

    /**
     * @return array
     */
    public function getMetaKeys()
    {
        return array(
            'title',
            'description'
        );
    }

    /**
     * @param string $url
     * @return bool
     */
    public function isUrl($url)
    {
        $url = parse_url($url);
        return isset($url['host']);
    }

    /**
     * @param $str
     * @param string $default
     * @param bool $skipEmpty
     * @return mixed|string
     */
    public function fromJSON($str, $default = '', $skipEmpty = true)
    {
        $val = $this->modx->fromJSON($str);
        if ($val === '' && $skipEmpty) {
            $val = $default;
        }
        return $val;
    }

    /**
     * Shorthand for original modX::invokeEvent() method with some useful additions.
     *
     * @param $eventName
     * @param array $params
     * @param $glue
     *
     * @return array
     */
    public function invokeEvent($eventName, array $params = array(), $glue = '<br/>')
    {
        if (isset($this->modx->event->returnedValues)) {
            $this->modx->event->returnedValues = null;
        }

        $response = $this->modx->invokeEvent($eventName, $params);
        if (is_array($response) && count($response) > 1) {
            foreach ($response as $k => $v) {
                if (empty($v)) {
                    unset($response[$k]);
                }
            }
        }

        $message = is_array($response) ? implode($glue, $response) : trim((string)$response);
        if (isset($this->modx->event->returnedValues) && is_array($this->modx->event->returnedValues)) {
            $params = array_merge($params, $this->modx->event->returnedValues);
        }

        return array(
            'success' => empty($message),
            'message' => $message,
            'data' => $params,
        );
    }

    /**
     * @return array
     */
    public function getCacheOptions()
    {
        $cacheOptions = array(
            xPDO::OPT_CACHE_KEY => 'default/' . $this->seotabs->getNamespace() . '/',
            xPDO::OPT_CACHE_EXPIRES => $this->config['cacheTime']
        );

        return $cacheOptions;
    }

    /**
     * @param string $cacheKey
     * @param mixed $data
     * @return mixed
     */
    public function setCache($cacheKey, $data)
    {

        $this->modx->cacheManager->set(
            $cacheKey,
            $data,
            $this->config['cacheTime'],
            $this->getCacheOptions()
        );
    }


    /**
     * @param string $cacheKey
     * @return mixed
     */
    public function getCache($cacheKey)
    {
        $cacheOptions = $this->getCacheOptions();
        return $this->modx->cacheManager->get($cacheKey, $cacheOptions);
    }

    /**
     * @param string $cacheKey
     */
    public function deleteCache($cacheKey)
    {
        $cacheOptions = $this->getCacheOptions();
        $this->modx->cacheManager->delete($cacheKey, $cacheOptions);
    }

    public function refreshCache()
    {
        $cacheOptions = $this->getCacheOptions();
        $this->modx->cacheManager->refresh(array(
            $cacheOptions[xPDO::OPT_CACHE_KEY] => array(),
        ));
    }


    /**
     * @param array $options
     *
     * @return bool
     */
    public function clearCache($options = array())
    {
        $cacheKey = $this->getCacheKey($options);
        $cacheOptions = $this->getCacheOptions($options);
        $cacheOptions['cache_key'] .= $cacheKey;
        if (!empty($cacheOptions) AND $this->modx->getCacheManager()) {
            return $this->modx->cacheManager->clean($cacheOptions);
        }

        return false;
    }

    /**
     * Sanitize the specified path
     *
     * @param string $path The path to clean
     * @return string The sanitized path
     */
    public function normalizePath($path)
    {
        $path = str_replace('./', '/', $path);
        return preg_replace(array("/\.*[\/|\\\]/i", "/[\/|\\\]+/i"), array(DIRECTORY_SEPARATOR, DIRECTORY_SEPARATOR), $path);
    }

    /**
     * @param string $str
     * @return mixed
     */
    public function unquote($str)
    {
        return str_replace(array("'", '"'), '', trim($str));
    }

    /**
     * @param int $length
     * @return string
     * @throws Exception
     */
    public function uniqid($length = 32)
    {
        if (function_exists("random_bytes")) {
            $bytes = random_bytes($length);
        } elseif (function_exists("openssl_random_pseudo_bytes")) {
            $bytes = openssl_random_pseudo_bytes($length);
        } else {
            return substr(sha1(uniqid(rand(), true)), 0, $length);
        }
        return substr(bin2hex($bytes), 0, $length);
    }

    /**
     * @param string $str
     * @param string $delimiter
     * @return array
     */
    public function explodeAndClean($str, $delimiter = ',')
    {
        $array = explode($delimiter, $str);
        $array = array_map('trim', $array);
        $array = array_keys(array_flip($array));
        $array = array_filter($array);

        return $array;
    }

    /**
     * @param $array
     * @param string $delimiter
     * @return array|string
     */
    public function cleanAndImplode($array, $delimiter = ',')
    {
        $array = array_map('trim', $array);
        $array = array_keys(array_flip($array));
        $array = array_filter($array);
        $array = implode($delimiter, $array);

        return $array;
    }

    /**
     * @param array $array
     * @return array
     */
    public function cleanArray(array $array = array())
    {
        $array = array_map('trim', $array);
        $array = array_filter($array);
        $array = array_keys(array_flip($array));

        return $array;
    }

    /**
     * @param $needle
     * @param array $array
     * @param bool $all
     * @return array
     */
    public function removeArrayByValue($needle, $array = array(), $all = true)
    {
        if (!$all) {
            if (FALSE !== $key = array_search($needle, $array)) unset($array[$key]);
            return $array;
        }
        foreach (array_keys($array, $needle) as $key) {
            unset($array[$key]);
        }
        return $array;
    }

    /**
     * @param array $arr
     * @return string|null
     */
    public function getArrayFirstKey(array $arr)
    {
        $keys = array_keys($arr);
        return empty($keys) ? null : $keys[0];
    }

    /**
     * @param array $arr
     * @param string $prefix
     * @return array
     */
    public function addArrayKeyPrefix(array $arr, $prefix = '')
    {
        if ($arr) {
            foreach ($arr as $key => $val) {
                $arr[$prefix . $key] = $val;
                unset($arr[$key]);
            }
        }
        return $arr;
    }


    /**
     * @param string $path
     * @param bool $normalize
     * @return mixed|string
     */
    public function preparePath($path = '', $normalize = false)
    {
        $path = str_replace(array(
            '{base_path]',
            '{core_path}',
            '{assets_path}',
            '{assets_url}',
            '{mgr_path}',
            '{+core_path}',
            '{+assets_path}',
            '{+assets_url}',
        ), array(
            $this->modx->getOption('base_path', null, MODX_BASE_PATH),
            $this->modx->getOption('core_path', null, MODX_CORE_PATH),
            $this->modx->getOption('assets_path', null, MODX_ASSETS_PATH),
            $this->modx->getOption('assets_url', null, MODX_ASSETS_URL),
            $this->modx->getOption('mgr_path', null, MODX_MANAGER_PATH),
            $this->modx->getOption('core_path', null, MODX_CORE_PATH) . 'components/seotabs/',
            $this->modx->getOption('assets_path', null, MODX_ASSETS_PATH) . 'components/seotabs/',
            $this->modx->getOption('assets_url', null, MODX_ASSETS_PATH) . 'components/seotabs/',
        ), $path);
        return $normalize ? $this->normalizePath($path) : $path;
    }

    /**
     * @param string $addition
     * @return bool
     */
    public function hasAddition($addition = '')
    {
        $addition = strtolower($addition);
        return file_exists(MODX_CORE_PATH . 'components/' . $addition . '/model/' . $addition . '/');
    }

    /**
     * @param int $number
     *
     * @return float
     */
    public function formatNumber($number = 0, $ceil = false)
    {
        $number = str_replace(',', '.', $number);
        $number = (float)$number;

        if ($ceil) {
            $number = ceil($number / 10) * 10;
        }

        return round($number, 3);
    }

    /**
     * @param string|array $message
     * @param int $level
     */
    public function log($message, $level = modX::LOG_LEVEL_ERROR)
    {
        if (is_array($message)) {
            $message = print_r($message, 1);
        }
        $curLevel = $this->modx->getLogLevel();
        $this->modx->setLogLevel($level);
        $this->modx->log($level, $message);
        $this->modx->setLogLevel($curLevel);
    }

    /**
     * @param string|array $message
     */
    public function debug($message)
    {

        if (is_array($message)) {
            $message = print_r($message, 1);
        }
        $this->log($message, modX::LOG_LEVEL_DEBUG);
    }

}
