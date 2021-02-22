<?php
/**
 * seoTabs
 * @package seotabs
 * @var modX $modx
 * @var array $scriptProperties
 */

/** @var SeoTabs $seotabs */
$seotabs = $modx->getService('seotabs', 'SeoTabs');
$tools = $seotabs->getTools();
$rid = !empty($rid) ? $rid : $modx->resource->get('id');
if (!$tabs = $tools->getTabsData($rid, $up)) return '';
$resourceData = $modx->resource->toArray();

$config = array(
    'meta' => array(),
    'startActiveTabId' => 0,
    'rid' => $modx->resource->get('id'),
    'url' => $seotabs->config['actionUrl'],
    'pageUrl' => $modx->makeUrl($modx->resource->get('id')),
    'redirect' => $modx->getOption('seotabs_redirect', null, 1, true),
    'replacebefore' => $modx->getOption('seotabs_replacebefore', null, 1, true),
    'replaceseparator' => $modx->getOption('seotabs_replaceseparator', null, ' - ', true),
);

$result = array(
    'tabs' => '',
    'content' => '',
    'res' => $resourceData,
);

foreach ($tabs as $tab) {
    $active = 0;
    if (
        $modx->seotabsActiveTab &&
        $tab['name'] == $modx->seotabsActiveTab ||
        !$modx->seotabsActiveTab &&
        $tab['active']
    ) {
        $active = 1;
        $config['startActiveTabId'] = $tab['id'];
    }
    $config['meta'][$tab['id']] = $tools->prepareTabMetaData($tab, $resourceData);
    if (empty($tab['seo']) || !empty($tab['seo']) && $active) {
        $tab['content'] = $tools->getPdoTools()->getChunk('@INLINE ' . $tab['content'], $resourceData, true);
    }
    $data = array(
        'tab' => $tab,
        'res' => $resourceData,
        'active' => $active,
    );
    $result['tabs'] .= $tools->getPdoTools()->getChunk($tplTab, $data);
    $result['content'] .= $tools->getPdoTools()->getChunk($tplTabContent, $data);
}

$output = $tools->getPdoTools()->getChunk($tpl, $result);

if ($jquery && $jqueryUrl) {
    $modx->regClientScript($tools->preparePath($jqueryUrl));
}

if (!empty($css)) {
    $modx->regClientCSS($tools->preparePath($css));
}

if (!empty($js)) {
    $modx->regClientScript($tools->preparePath($js));
}

$modx->regClientScript('
<script type="text/javascript">
   (function ($) {
        new SeoTabs(' . $modx->toJSON($config) . ');
   })(jQuery);
 </script>', true);

if ($tplWrapper) {
    return $tools->getPdoTools()->getChunk($tplWrapper, array('output' => $output));
} else {
    return $output;
}