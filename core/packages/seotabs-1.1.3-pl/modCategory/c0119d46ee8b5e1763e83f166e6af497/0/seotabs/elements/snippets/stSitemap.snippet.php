<?php
/**
 * seoTabs
 * @package seotabs
 * @var modX $modx
 * @var SeoTabs $seotabs
 * @var string $sortby
 * @var string $sortdir
 * @var bool $useWeblinkUrl
 * @var string $sitemapSchema
 * @var float|bool $priority
 * @var array $scriptProperties
 */

$seotabs = $modx->getService('seotabs', 'SeoTabs');
$tools = $seotabs->getTools();
$tools->getPdoTools()->setConfig(array('scheme' => 'full'));

$tabColumnPrefix = 'seotab_';
$priorityFreq = $tools->fromJSON($priorityFreq, array());
$containerSuffix = $modx->getOption('container_suffix');
$redirect = $modx->getOption('seotabs_redirect', null, 0, true);
if (empty($outputSeparator)) {
    $outputSeparator = "\n";
}


$classKey = 'SeoTab';
$q = $modx->newQuery($classKey);
$q->leftJoin('modResource', 'Resource', "`Resource`.`id` = `{$classKey}`.`rid`");
$select = array('id', 'editedon', 'createdon', 'context_key', 'class_key', 'uri');
if (!empty($useWeblinkUrl)) {
    $select[] = 'content';
}
$q->select($modx->getSelectColumns($classKey, $classKey, $tabColumnPrefix, array('alias')));
$q->select($modx->getSelectColumns('modResource', 'Resource', '', $select));
$q->where(array(
    'seo' => 1,
    'enabled' => 1,
    '`Resource`.`deleted`' => 0,
));

if (array_key_exists($sortby, $modx->getFields($classKey))) {
    $sortby = "`{$classKey}`.`$sortby`";
}
$q->sortby($sortby, $sortdir);

$result = array();
if ($q->prepare() && $q->stmt->execute()) {
    $now = time();
    while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)) {
        $time = !empty($row['editedon']) ? $row['editedon'] : $row['createdon'];
        $row['date'] = date('c', $time);
        if (!empty($useWeblinkUrl) && $row['class_key'] == 'modWebLink') {
            $url = is_numeric(trim($row['content'], '[]~ '))
                ? $tools->getPdoTools()->makeUrl(intval(trim($row['content'], '[]~ ')), $row) : $row['content'];
        } else {
            $url = $tools->getPdoTools()->makeUrl($row['id'], $row);
        }

        $url .= $row["{$tabColumnPrefix}alias"];
        $hasSlash = substr($url, -1) === '/' ? true : false;
        $extension = pathinfo($url, PATHINFO_EXTENSION);

        switch ($redirect) {
            case 1:
                if ($hasSlash) {
                    $url = preg_replace('/(\/+)$/', '$2', $url);
                }
                break;
            case 2:
                if (!$hasSlash || stristr($url, '//') !== false) {
                    $url = preg_replace('/(\/+)$/', '$2', $url) . '/';
                }
                break;
            case 3:
                if (!$hasSlash && !$extension) {
                    $url = $url . '.html';
                }
                break;
            case 4:
                if ($hasSlash && !$extension) {
                    $url = preg_replace('/(\/+)$/', '$2', $url) . '.html';
                }
                break;
            case 5:
                if (!$hasSlash && !$extension) {
                    $url = $url . '.php';
                }
            case 6:
                if ($hasSlash && !$extension) {
                    $url = preg_replace('/(\/+)$/', '$2', $url) . '.php';
                }
                break;
        }

        $row['url'] = $url;

        if (is_numeric($priority)) {
            $row['priority'] = $priority;
        } else {
            $datediff = floor(($now - $time) / 86400);
            if ($datediff <= 1) {
                $row['priority'] = $priorityFreq['hourly'];
                $row['update'] = 'daily';
            } elseif (($datediff > 1) && ($datediff <= 7)) {
                $row['priority'] = $priorityFreq['daily'];
                $row['update'] = 'weekly';
            } elseif (($datediff > 7) && ($datediff <= 30)) {
                $row['priority'] = $priorityFreq['weekly'];
                $row['update'] = 'weekly';
            } else {
                $row['priority'] = $priorityFreq['monthly'];
                $row['update'] = 'monthly';
            }
        }
        $result[$url] = $tools->getPdoTools()->parseChunk($tpl, $row);
    }
}

$output = $tools->cleanAndImplode($result, $outputSeparator);
$output = $tools->getPdoTools()->getChunk($tplWrapper, array(
    'schema' => $sitemapSchema,
    'output' => $output
));

if (!empty($forceXML)) {
    header("Content-Type:text/xml");
    @session_write_close();
    exit($output);
} else {
    return $output;
}