<?php
if (file_exists(dirname(dirname(dirname(dirname(__FILE__)))) . '/config.core.php')) {
    /** @noinspection PhpIncludeInspection */
    require_once dirname(dirname(dirname(dirname(__FILE__)))) . '/config.core.php';
} else {
    require_once dirname(dirname(dirname(dirname(dirname(__FILE__))))) . '/config.core.php';
}

require_once MODX_CORE_PATH.'model/modx/modx.class.php';
$modx = new modX();
$modx->initialize('web');
$modx->getService('error','error.modError', '', '');

/** @var goodStar $goodStar */
$goodStar = $modx->getService('goodStar', 'goodStar', $modx->getOption('goodstar_core_path', '', MODX_CORE_PATH . 'components/goodstar/') . 'model/');
if (!$goodStar) {;
    return 'Could not load goodStar class!';
}

return $goodStar->saveVoice($_POST);