<?php
/**
 * seoTabs
 * @package seotabs
 */
/**
 * @var modX $modx
 * @var array $scriptProperties
 */

/** @var SeoTabs $seotabs */
$seotabs = $modx->getService('seotabs', 'SeoTabs');

switch ($modx->event->name) {
    case 'OnDocFormPrerender':
        if (!$id || !$seotabs->isWorkingTemplates($modx->controller->resourceArray['template'])) return;
        $seotabs->loadControllerJsCss($id, $modx->controller);
        break;
    case 'OnLoadWebDocument':
        if (
            !$modx->resource ||
            $modx->seotabsActiveTab ||
            !$seotabs->isWorkingTemplates($modx->resource->get('template'))
        ) {
            return;
        }

        $rid = $modx->resource->get('id');
        $tab = $seotabs->getTools()->getActiveTabData($rid, true);
        if (empty($tab)) return;
        $pls = $seotabs->getTools()->prepareTabPlaceholderData($tab, $modx->resource->toArray(), 'st.');
        $modx->setPlaceholders($pls);
        break;
    case 'OnPageNotFound':
        $pageId = 0;
        $urlRedirect = '';
        $tabColumnPrefix = 'seotab_';
        $containerSuffix = $modx->getOption('container_suffix');
        $contentExtension = $seotabs->getTools()->getContentTypeExtension();
        $alias = $modx->context->getOption('request_param_alias', 'q');
        $redirect = $modx->getOption('seotabs_redirect', null, 0, true);
        if (!isset($_REQUEST[$alias])) return;
        $request = trim($_REQUEST[$alias]);
        $hasSlash = substr($request, -1) === '/' ? true : false;
        $extension = pathinfo($request, PATHINFO_EXTENSION);
        /** @var SeoTabsTools $tools */
        $tools = $seotabs->getTools();
        $aliases = $tools->explodeAndClean($request, '/');

        if ($extension) {
            $idx = count($aliases) - 2;
            $tabAlias = $aliases[$idx];
            unset($aliases[$idx]);
        } else {
            $tabAlias = array_pop($aliases);
        }

        if (empty($aliases)) {
            $uri = '';
            $pageId = $modx->getOption('site_start');
        } else {
            $uri = $tools->cleanAndImplode($aliases, '/');
            if ($containerSuffix && $contentExtension == '/') {
                $uri .= $containerSuffix;
            }
        }

        switch ($redirect) {
            case 1:
                if ($hasSlash) {
                    $urlRedirect = preg_replace('/(\/+)$/', '$2', $request);
                }
                break;
            case 2:
                if (!$hasSlash || stristr($_SERVER['REQUEST_URI'], '//') !== false) {
                    $urlRedirect = preg_replace('/(\/+)$/', '$2', $request) . '/';
                }
                break;
            case 3:
                if (!$hasSlash && !$extension) {
                    $urlRedirect = $request . '.html';
                }
                break;
            case 4:
                if ($hasSlash && !$extension) {
                    $urlRedirect = preg_replace('/(\/+)$/', '$2', $request) . '.html';
                }
                break;
            case 5:
                if (!$hasSlash && !$extension) {
                    $urlRedirect = $request . '.php';
                }
            case 6:
                if ($hasSlash && !$extension) {
                    $urlRedirect = preg_replace('/(\/+)$/', '$2', $request) . '.php';
                }
                break;
        }

        if ($urlRedirect) {
            $modx->sendRedirect($urlRedirect, array('responseCode' => 'HTTP/1.1 301 Moved Permanently'));
        }

        if (!$pageId) {
            if (!$pageId = $modx->findResource($uri)) return;
        }

        if (!$rid = $tools->prepareResourceId($pageId)) return;
        if (!$tab = $tools->getTabDataByAlias($rid, $tabAlias, array('onlySeo' => true, 'columnPrefix' => $tabColumnPrefix))) return;
        /** @vr modResource $resource */
        $resource = $modx->getObject('modResource', $pageId);
        $modx->resource = $resource;
        $pls = $tools->prepareTabPlaceholderData($tab, $resource->toArray(), 'st.');
        $modx->setPlaceholders($pls);
        $modx->seotabsActiveTab = $tab[$tabColumnPrefix . 'name'];
        $modx->sendForward($pageId);
        break;
}
return;