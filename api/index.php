<?php
/**
 * Created by PhpStorm.
 * User: Artem
 * Date: 19.03.2019
 * Time: 10:39
 */

define('MODX_API_MODE', true);
require_once dirname(dirname(__FILE__)) . '/index.php';

$modx->getService('error', 'error.modError');
$modx->setLogLevel(modX::LOG_LEVEL_ERROR);
$modx->setLogTarget('FILE');

$modx->initialize('web');


/*Directories that contain classes*/
/*$classesDir = array (
	dirname(__FILE__).'/inc/',
	dirname(__FILE__).'/controller/',
);
function __autoload($class_name) {
	global $classesDir;
	foreach ($classesDir as $directory) {
		if (file_exists($directory . $class_name . '.php')) {
			require_once ($directory . $class_name . '.php');
			return;
		}
	}
}*/

if (file_exists(dirname(__FILE__) . '/inc/Api.php')) {
	require_once(dirname(__FILE__) . '/inc/Api.php');
}

if (file_exists(dirname(__FILE__) . '/inc/Base.php')) {
	require_once(dirname(__FILE__) . '/inc/Base.php');
}

$api = new Api($modx);

if (!$api->init([
	"loging" => true,
	"onlyAjax" => false,
])) {
	return;
}