<?php
header('Content-Type: application/json; charset=UTF-8');
define('MODX_API_MODE', true);
require_once dirname(dirname(dirname(dirname(__FILE__)))) . '/index.php';

$modx->getService('error', 'error.modError');
$modx->setLogLevel(modX::LOG_LEVEL_ERROR);
$modx->setLogTarget('FILE');

if ($_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') {
    $modx->sendRedirect($modx->makeUrl($modx->getOption('site_start'), '', '', 'full'));
}

/** @var SeoTabs $seotabs */
$seotabs = $modx->getService('seotabs', 'SeoTabs');

$action = $modx->getOption('action', $_POST, '', true);
unset($_POST['action']);

$response = $seotabs->runProcessor($action, $_POST);
$output = $seotabs->prepareResponse($response);
if (is_array($output)) {
    $output = $modx->toJSON($output);
}
@session_write_close();
echo $output;