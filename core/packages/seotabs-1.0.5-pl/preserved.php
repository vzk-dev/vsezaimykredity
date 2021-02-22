<?php return array (
  '4ae0370bf24f85ef3fc47aabe4310d40' => 
  array (
    'criteria' => 
    array (
      'name' => 'seotabs',
    ),
    'object' => 
    array (
      'name' => 'seotabs',
      'path' => '{core_path}components/seotabs/',
      'assets_path' => '{assets_path}components/seotabs/',
    ),
  ),
  '082f842fcf1bb11318d29318cf40c637' => 
  array (
    'criteria' => 
    array (
      'name' => 'seotabs',
    ),
    'object' => 
    array (
      'name' => 'seotabs',
      'path' => '{core_path}components/seotabs/',
      'assets_path' => '{assets_path}components/seotabs/',
    ),
  ),
  'd09af3ff104a2566a4296e6994ad8536' => 
  array (
    'criteria' => 
    array (
      'key' => 'seotabs_description_default',
    ),
    'object' => 
    array (
      'key' => 'seotabs_description_default',
      'value' => '[[+pagetitle]] - [[+seotab_caption]]',
      'xtype' => 'textfield',
      'namespace' => 'seotabs',
      'area' => 'seotabs_seo',
      'editedon' => NULL,
    ),
  ),
  'aae70f4d8bc74461e1a4ca01996807da' => 
  array (
    'criteria' => 
    array (
      'key' => 'seotabs_redirect',
    ),
    'object' => 
    array (
      'key' => 'seotabs_redirect',
      'value' => '0',
      'xtype' => 'textfield',
      'namespace' => 'seotabs',
      'area' => 'seotabs_main',
      'editedon' => NULL,
    ),
  ),
  '3e22430d5602eb12d527fc195194bc5f' => 
  array (
    'criteria' => 
    array (
      'key' => 'seotabs_replacebefore',
    ),
    'object' => 
    array (
      'key' => 'seotabs_replacebefore',
      'value' => '0',
      'xtype' => 'combo-boolean',
      'namespace' => 'seotabs',
      'area' => 'seotabs_seo',
      'editedon' => NULL,
    ),
  ),
  'd13c49b402f2e874ec73c1f684b24665' => 
  array (
    'criteria' => 
    array (
      'key' => 'seotabs_replaceseparator',
    ),
    'object' => 
    array (
      'key' => 'seotabs_replaceseparator',
      'value' => ' - ',
      'xtype' => 'textfield',
      'namespace' => 'seotabs',
      'area' => 'seotabs_seo',
      'editedon' => NULL,
    ),
  ),
  '4ac9fa4369b8c5d797ae3112e823db10' => 
  array (
    'criteria' => 
    array (
      'key' => 'seotabs_title_default',
    ),
    'object' => 
    array (
      'key' => 'seotabs_title_default',
      'value' => '',
      'xtype' => 'textfield',
      'namespace' => 'seotabs',
      'area' => 'seotabs_seo',
      'editedon' => NULL,
    ),
  ),
  '6cbd8696835713fb55f5959a5af54ca3' => 
  array (
    'criteria' => 
    array (
      'key' => 'seotabs_tools_handler_class',
    ),
    'object' => 
    array (
      'key' => 'seotabs_tools_handler_class',
      'value' => 'SeoTabsTools',
      'xtype' => 'textfield',
      'namespace' => 'seotabs',
      'area' => 'seotabs_main',
      'editedon' => NULL,
    ),
  ),
  '49cd9345dd6f840ef5f156e0389dc7ac' => 
  array (
    'criteria' => 
    array (
      'key' => 'seotabs_working_templates',
    ),
    'object' => 
    array (
      'key' => 'seotabs_working_templates',
      'value' => '',
      'xtype' => 'textfield',
      'namespace' => 'seotabs',
      'area' => 'seotabs_main',
      'editedon' => NULL,
    ),
  ),
  'f7c2de6a193bc361a031e91d8921fe36' => 
  array (
    'criteria' => 
    array (
      'category' => 'seoTabs',
    ),
    'object' => 
    array (
      'id' => 48,
      'parent' => 0,
      'category' => 'seoTabs',
      'rank' => 0,
    ),
  ),
  '10552fc2ec19e5f8cade369f33e0180e' => 
  array (
    'criteria' => 
    array (
      'name' => 'tpl.seoTabsWrapper',
    ),
    'object' => 
    array (
      'id' => 50,
      'source' => 0,
      'property_preprocess' => 0,
      'name' => 'tpl.seoTabsWrapper',
      'description' => '',
      'editor_type' => 0,
      'category' => 48,
      'cache_type' => 0,
      'snippet' => '{$output}',
      'locked' => 0,
      'properties' => NULL,
      'static' => 0,
      'static_file' => '',
      'content' => '{$output}',
    ),
  ),
  'c97e4d8b32a478f34e9f096d8296c165' => 
  array (
    'criteria' => 
    array (
      'name' => 'tpl.seoTabs',
    ),
    'object' => 
    array (
      'id' => 51,
      'source' => 0,
      'property_preprocess' => 0,
      'name' => 'tpl.seoTabs',
      'description' => '',
      'editor_type' => 0,
      'category' => 48,
      'cache_type' => 0,
      'snippet' => '<ul class="nav nav-tabs">
    {$tabs}
</ul>
<div class="tab-content">
    {$content}
</div>
',
      'locked' => 0,
      'properties' => NULL,
      'static' => 0,
      'static_file' => '',
      'content' => '<ul class="nav nav-tabs">
    {$tabs}
</ul>
<div class="tab-content">
    {$content}
</div>
',
    ),
  ),
  'a641380ebd24cd9ff0b410c313ae1dc6' => 
  array (
    'criteria' => 
    array (
      'name' => 'tpl.seoTabsTab',
    ),
    'object' => 
    array (
      'id' => 52,
      'source' => 0,
      'property_preprocess' => 0,
      'name' => 'tpl.seoTabsTab',
      'description' => '',
      'editor_type' => 0,
      'category' => 48,
      'cache_type' => 0,
      'snippet' => '<li class="nav-item">
    <a class="seotab nav-link{if $active?} active{/if}" data-id="{$tab.id}"
       {if $tab.seo?}data-alias="{$tab.alias}"{/if} {if $active && $tab.seo} data-loaded="1"{/if}
       href="#seotab-{$tab.id}">{if $image?}{$image}{/if}{$tab.caption}</a>
</li>',
      'locked' => 0,
      'properties' => NULL,
      'static' => 0,
      'static_file' => '',
      'content' => '<li class="nav-item">
    <a class="seotab nav-link{if $active?} active{/if}" data-id="{$tab.id}"
       {if $tab.seo?}data-alias="{$tab.alias}"{/if} {if $active && $tab.seo} data-loaded="1"{/if}
       href="#seotab-{$tab.id}">{if $image?}{$image}{/if}{$tab.caption}</a>
</li>',
    ),
  ),
  '52899e997e74e39cc76792605b5cffd8' => 
  array (
    'criteria' => 
    array (
      'name' => 'tpl.seoTabsContent',
    ),
    'object' => 
    array (
      'id' => 53,
      'source' => 0,
      'property_preprocess' => 0,
      'name' => 'tpl.seoTabsContent',
      'description' => '',
      'editor_type' => 0,
      'category' => 48,
      'cache_type' => 0,
      'snippet' => '<div role="tabpanel" class="tab-pane{if $active?} active{/if}" id="seotab-{$tab.id}">
    {$tab.content}
    {if $tab.field?}{$res[$tab.field]}{/if}
</div>',
      'locked' => 0,
      'properties' => NULL,
      'static' => 0,
      'static_file' => '',
      'content' => '<div role="tabpanel" class="tab-pane{if $active?} active{/if}" id="seotab-{$tab.id}">
    {$tab.content}
    {if $tab.field?}{$res[$tab.field]}{/if}
</div>',
    ),
  ),
  '4c3ceee8de108c3eb4b20504d3c257a9' => 
  array (
    'criteria' => 
    array (
      'name' => 'seoTabs',
    ),
    'object' => 
    array (
      'id' => 65,
      'source' => 1,
      'property_preprocess' => 0,
      'name' => 'seoTabs',
      'description' => '',
      'editor_type' => 0,
      'category' => 48,
      'cache_type' => 0,
      'snippet' => '/**
 * seoTabs
 * @package seotabs
 * @var modX $modx
 * @var array $scriptProperties
 */

/** @var SeoTabs $seotabs */
$seotabs = $modx->getService(\'seotabs\', \'SeoTabs\');
$tools = $seotabs->getTools();
$rid = !empty($rid) ? $rid : $modx->resource->get(\'id\');
if (!$tabs = $tools->getTabsData($rid, $up)) return \'\';
$resourceData = $modx->resource->toArray();

$config = array(
    \'meta\' => array(),
    \'startActiveTabId\' => 0,
    \'rid\' => $modx->resource->get(\'id\'),
    \'url\' => $seotabs->config[\'actionUrl\'],
    \'pageUrl\' => $modx->makeUrl($modx->resource->get(\'id\')),
    \'redirect\' => $modx->getOption(\'seotabs_redirect\', null, 1, true),
    \'replacebefore\' => $modx->getOption(\'seotabs_replacebefore\', null, 1, true),
    \'replaceseparator\' => $modx->getOption(\'seotabs_replaceseparator\', null, \' - \', true),
);

$result = array(
    \'tabs\' => \'\',
    \'content\' => \'\',
    \'res\' => $resourceData,
);

foreach ($tabs as $tab) {
    $active = 0;
    if (
        $modx->seotabsActiveTab &&
        $tab[\'name\'] == $modx->seotabsActiveTab ||
        !$modx->seotabsActiveTab &&
        $tab[\'active\']
    ) {
        $active = 1;
        $config[\'startActiveTabId\'] = $tab[\'id\'];
    }
    $config[\'meta\'][$tab[\'id\']] = $tools->prepareTabMetaData($tab, $resourceData);
    if (empty($tab[\'seo\']) || !empty($tab[\'seo\']) && $active) {
        $tab[\'content\'] = $tools->getPdoTools()->getChunk(\'@INLINE \' . $tab[\'content\'], $resourceData, true);
    }
    $data = array(
        \'tab\' => $tab,
        \'res\' => $resourceData,
        \'active\' => $active,
    );
    $result[\'tabs\'] .= $tools->getPdoTools()->getChunk($tplTab, $data);
    $result[\'content\'] .= $tools->getPdoTools()->getChunk($tplTabContent, $data);
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

$modx->regClientScript(\'
<script type="text/javascript">
   (function ($) {
        new SeoTabs(\' . $modx->toJSON($config) . \');
   })(jQuery);
 </script>\', true);

if ($tplWrapper) {
    return $tools->getPdoTools()->getChunk($tplWrapper, array(\'output\' => $output));
} else {
    return $output;
}',
      'locked' => 0,
      'properties' => 'a:10:{s:3:"css";a:9:{s:4:"name";s:3:"css";s:4:"desc";s:16:"seotabs_prop_css";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:0:"";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:254:"Если вы хотите использовать собственные стили - укажите путь к ним  здесь, или очистите параметр и загрузите их вручную через шаблон  сайта.";s:10:"area_trans";s:0:"";}s:6:"jquery";a:9:{s:4:"name";s:6:"jquery";s:4:"desc";s:19:"seotabs_prop_jquery";s:4:"type";s:13:"combo-boolean";s:7:"options";a:0:{}s:5:"value";b:0;s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:44:"Нужно ли подключать jQuery.";s:10:"area_trans";s:0:"";}s:9:"jqueryUrl";a:9:{s:4:"name";s:9:"jqueryUrl";s:4:"desc";s:22:"seotabs_prop_jqueryUrl";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:64:"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:58:"URL, подключаемой библиотеки jQuery.";s:10:"area_trans";s:0:"";}s:2:"js";a:9:{s:4:"name";s:2:"js";s:4:"desc";s:15:"seotabs_prop_js";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:34:"{+assets_url}js/web/default.min.js";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:258:"Если вы хотите использовать  собственные скрипты - укажите путь к ним здесь, или очистите параметр и  загрузите их вручную через шаблон сайта.";s:10:"area_trans";s:0:"";}s:3:"rid";a:9:{s:4:"name";s:3:"rid";s:4:"desc";s:16:"seotabs_prop_rid";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:1:"0";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:149:"ID ресурса из которого брать табы. Если не указан, используется ID текущего ресурса.";s:10:"area_trans";s:0:"";}s:3:"tpl";a:9:{s:4:"name";s:3:"tpl";s:4:"desc";s:16:"seotabs_prop_tpl";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:11:"tpl.seoTabs";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:89:"Чанк, для оформления результата работы сниппета.";s:10:"area_trans";s:0:"";}s:6:"tplTab";a:9:{s:4:"name";s:6:"tplTab";s:4:"desc";s:20:"seotabs_prop_tpl_tab";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:14:"tpl.seoTabsTab";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:47:"Чанк, для оформления таба.";s:10:"area_trans";s:0:"";}s:13:"tplTabContent";a:9:{s:4:"name";s:13:"tplTabContent";s:4:"desc";s:28:"seotabs_prop_tpl_tab_content";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:18:"tpl.seoTabsContent";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:64:"Чанк, для оформления контента таба.";s:10:"area_trans";s:0:"";}s:10:"tplWrapper";a:9:{s:4:"name";s:10:"tplWrapper";s:4:"desc";s:24:"seotabs_prop_tpl_wrapper";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:18:"tpl.seoTabsWrapper";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:87:"Чанк-обёртка, для обертывания всех результатов.";s:10:"area_trans";s:0:"";}s:2:"up";a:9:{s:4:"name";s:2:"up";s:4:"desc";s:15:"seotabs_prop_up";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:1:"1";s:7:"lexicon";s:18:"seotabs:properties";s:4:"area";s:0:"";s:10:"desc_trans";s:100:"Искать табы у родителей если у текущего ресурса их нет.";s:10:"area_trans";s:0:"";}}',
      'moduleguid' => '',
      'static' => 0,
      'static_file' => '',
      'content' => '/**
 * seoTabs
 * @package seotabs
 * @var modX $modx
 * @var array $scriptProperties
 */

/** @var SeoTabs $seotabs */
$seotabs = $modx->getService(\'seotabs\', \'SeoTabs\');
$tools = $seotabs->getTools();
$rid = !empty($rid) ? $rid : $modx->resource->get(\'id\');
if (!$tabs = $tools->getTabsData($rid, $up)) return \'\';
$resourceData = $modx->resource->toArray();

$config = array(
    \'meta\' => array(),
    \'startActiveTabId\' => 0,
    \'rid\' => $modx->resource->get(\'id\'),
    \'url\' => $seotabs->config[\'actionUrl\'],
    \'pageUrl\' => $modx->makeUrl($modx->resource->get(\'id\')),
    \'redirect\' => $modx->getOption(\'seotabs_redirect\', null, 1, true),
    \'replacebefore\' => $modx->getOption(\'seotabs_replacebefore\', null, 1, true),
    \'replaceseparator\' => $modx->getOption(\'seotabs_replaceseparator\', null, \' - \', true),
);

$result = array(
    \'tabs\' => \'\',
    \'content\' => \'\',
    \'res\' => $resourceData,
);

foreach ($tabs as $tab) {
    $active = 0;
    if (
        $modx->seotabsActiveTab &&
        $tab[\'name\'] == $modx->seotabsActiveTab ||
        !$modx->seotabsActiveTab &&
        $tab[\'active\']
    ) {
        $active = 1;
        $config[\'startActiveTabId\'] = $tab[\'id\'];
    }
    $config[\'meta\'][$tab[\'id\']] = $tools->prepareTabMetaData($tab, $resourceData);
    if (empty($tab[\'seo\']) || !empty($tab[\'seo\']) && $active) {
        $tab[\'content\'] = $tools->getPdoTools()->getChunk(\'@INLINE \' . $tab[\'content\'], $resourceData, true);
    }
    $data = array(
        \'tab\' => $tab,
        \'res\' => $resourceData,
        \'active\' => $active,
    );
    $result[\'tabs\'] .= $tools->getPdoTools()->getChunk($tplTab, $data);
    $result[\'content\'] .= $tools->getPdoTools()->getChunk($tplTabContent, $data);
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

$modx->regClientScript(\'
<script type="text/javascript">
   (function ($) {
        new SeoTabs(\' . $modx->toJSON($config) . \');
   })(jQuery);
 </script>\', true);

if ($tplWrapper) {
    return $tools->getPdoTools()->getChunk($tplWrapper, array(\'output\' => $output));
} else {
    return $output;
}',
    ),
  ),
  '4f268498b4a7adab1ec900c4772d426f' => 
  array (
    'criteria' => 
    array (
      'name' => 'seoTabs',
    ),
    'object' => 
    array (
      'id' => 31,
      'source' => 0,
      'property_preprocess' => 0,
      'name' => 'seoTabs',
      'description' => '',
      'editor_type' => 0,
      'category' => 48,
      'cache_type' => 0,
      'plugincode' => '/**
 * seoTabs
 * @package seotabs
 */
/**
 * @var modX $modx
 * @var array $scriptProperties
 */

/** @var SeoTabs $seotabs */
$seotabs = $modx->getService(\'seotabs\', \'SeoTabs\');

switch ($modx->event->name) {
    case \'OnDocFormPrerender\':
        if (!$id || !$seotabs->isWorkingTemplates($modx->controller->resourceArray[\'template\'])) return;
        $seotabs->loadControllerJsCss($id, $modx->controller);
        break;
    case \'OnLoadWebDocument\':
        if (
            !$modx->resource ||
            $modx->seotabsActiveTab ||
            !$seotabs->isWorkingTemplates($modx->resource->get(\'template\'))
        ) {
            return;
        }

        $rid = $modx->resource->get(\'id\');
        $tab = $seotabs->getTools()->getActiveTabData($rid, true);
        if (empty($tab)) return;
        $pls = $seotabs->getTools()->prepareTabPlaceholderData($tab, $modx->resource->toArray(), \'st.\');
        $modx->setPlaceholders($pls);
        break;
    case \'OnPageNotFound\':
        $pageId = 0;
        $urlRedirect = \'\';
        $tabColumnPrefix = \'seotab_\';
        $alias = $modx->context->getOption(\'request_param_alias\', \'q\');
        $redirect = $modx->getOption(\'seotabs_redirect\', null, 0, true);
        if (!isset($_REQUEST[$alias])) return;
        $request = trim($_REQUEST[$alias]);
        $hasSlash = substr($request, -1) === \'/\' ? true : false;
        $extension = pathinfo($request, PATHINFO_EXTENSION);
        /** @var SeoTabsTools $tools */
        $tools = $seotabs->getTools();
        $aliases = $tools->explodeAndClean($request, \'/\');

        if ($extension) {
            $idx = count($aliases) - 2;
            $tabAlias = $aliases[$idx];
            unset($aliases[$idx]);
        } else {
            $tabAlias = array_pop($aliases);
        }

        if (empty($aliases)) {
            $uri = \'\';
            $pageId = $modx->getOption(\'site_start\');
        } else {
            $uri = $tools->cleanAndImplode($aliases, \'/\');
        }

        switch ($redirect) {
            case 1:
                if ($hasSlash) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request);
                }
                break;
            case 2:
                if (!$hasSlash || stristr($_SERVER[\'REQUEST_URI\'], \'//\') !== false) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request) . \'/\';
                }
                break;
            case 3:
                if (!$hasSlash && !$extension) {
                    $urlRedirect = $request . \'.html\';
                }
                break;
            case 4:
                if ($hasSlash && !$extension) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request) . \'.html\';
                }
                break;
            case 5:
                if (!$hasSlash && !$extension) {
                    $urlRedirect = $request . \'.php\';
                }
            case 6:
                if ($hasSlash && !$extension) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request) . \'.php\';
                }
                break;
        }

        if ($urlRedirect) {
            $modx->sendRedirect($urlRedirect, array(\'responseCode\' => \'HTTP/1.1 301 Moved Permanently\'));
        }

        if (!$pageId) {
            if (!$pageId = $modx->findResource($uri)) return;
        }

        if (!$rid = $tools->prepareResourceId($pageId)) return;
        if (!$tab = $tools->getTabDataByAlias($rid, $tabAlias, array(\'columnPrefix\' => $tabColumnPrefix))) return;
        /** @vr modResource $resource */
        $resource = $modx->getObject(\'modResource\', $pageId);
        $pls = $tools->prepareTabPlaceholderData($tab, $resource->toArray(), \'st.\');
        $modx->setPlaceholders($pls);
        $modx->seotabsActiveTab = $tab[$tabColumnPrefix . \'name\'];
        $modx->sendForward($pageId);
        break;
}
return;',
      'locked' => 0,
      'properties' => NULL,
      'disabled' => 0,
      'moduleguid' => '',
      'static' => 0,
      'static_file' => '',
      'content' => '/**
 * seoTabs
 * @package seotabs
 */
/**
 * @var modX $modx
 * @var array $scriptProperties
 */

/** @var SeoTabs $seotabs */
$seotabs = $modx->getService(\'seotabs\', \'SeoTabs\');

switch ($modx->event->name) {
    case \'OnDocFormPrerender\':
        if (!$id || !$seotabs->isWorkingTemplates($modx->controller->resourceArray[\'template\'])) return;
        $seotabs->loadControllerJsCss($id, $modx->controller);
        break;
    case \'OnLoadWebDocument\':
        if (
            !$modx->resource ||
            $modx->seotabsActiveTab ||
            !$seotabs->isWorkingTemplates($modx->resource->get(\'template\'))
        ) {
            return;
        }

        $rid = $modx->resource->get(\'id\');
        $tab = $seotabs->getTools()->getActiveTabData($rid, true);
        if (empty($tab)) return;
        $pls = $seotabs->getTools()->prepareTabPlaceholderData($tab, $modx->resource->toArray(), \'st.\');
        $modx->setPlaceholders($pls);
        break;
    case \'OnPageNotFound\':
        $pageId = 0;
        $urlRedirect = \'\';
        $tabColumnPrefix = \'seotab_\';
        $alias = $modx->context->getOption(\'request_param_alias\', \'q\');
        $redirect = $modx->getOption(\'seotabs_redirect\', null, 0, true);
        if (!isset($_REQUEST[$alias])) return;
        $request = trim($_REQUEST[$alias]);
        $hasSlash = substr($request, -1) === \'/\' ? true : false;
        $extension = pathinfo($request, PATHINFO_EXTENSION);
        /** @var SeoTabsTools $tools */
        $tools = $seotabs->getTools();
        $aliases = $tools->explodeAndClean($request, \'/\');

        if ($extension) {
            $idx = count($aliases) - 2;
            $tabAlias = $aliases[$idx];
            unset($aliases[$idx]);
        } else {
            $tabAlias = array_pop($aliases);
        }

        if (empty($aliases)) {
            $uri = \'\';
            $pageId = $modx->getOption(\'site_start\');
        } else {
            $uri = $tools->cleanAndImplode($aliases, \'/\');
        }

        switch ($redirect) {
            case 1:
                if ($hasSlash) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request);
                }
                break;
            case 2:
                if (!$hasSlash || stristr($_SERVER[\'REQUEST_URI\'], \'//\') !== false) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request) . \'/\';
                }
                break;
            case 3:
                if (!$hasSlash && !$extension) {
                    $urlRedirect = $request . \'.html\';
                }
                break;
            case 4:
                if ($hasSlash && !$extension) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request) . \'.html\';
                }
                break;
            case 5:
                if (!$hasSlash && !$extension) {
                    $urlRedirect = $request . \'.php\';
                }
            case 6:
                if ($hasSlash && !$extension) {
                    $urlRedirect = preg_replace(\'/(\\/+)$/\', \'$2\', $request) . \'.php\';
                }
                break;
        }

        if ($urlRedirect) {
            $modx->sendRedirect($urlRedirect, array(\'responseCode\' => \'HTTP/1.1 301 Moved Permanently\'));
        }

        if (!$pageId) {
            if (!$pageId = $modx->findResource($uri)) return;
        }

        if (!$rid = $tools->prepareResourceId($pageId)) return;
        if (!$tab = $tools->getTabDataByAlias($rid, $tabAlias, array(\'columnPrefix\' => $tabColumnPrefix))) return;
        /** @vr modResource $resource */
        $resource = $modx->getObject(\'modResource\', $pageId);
        $pls = $tools->prepareTabPlaceholderData($tab, $resource->toArray(), \'st.\');
        $modx->setPlaceholders($pls);
        $modx->seotabsActiveTab = $tab[$tabColumnPrefix . \'name\'];
        $modx->sendForward($pageId);
        break;
}
return;',
    ),
  ),
  '36391d6db63c8d1d0c6c46cd597ebafc' => 
  array (
    'criteria' => 
    array (
      'pluginid' => 31,
      'event' => 'OnDocFormPrerender',
    ),
    'object' => 
    array (
      'pluginid' => 31,
      'event' => 'OnDocFormPrerender',
      'priority' => 0,
      'propertyset' => 0,
    ),
  ),
  'a5d245cfc7ec3bbf81a0db037aa4fae9' => 
  array (
    'criteria' => 
    array (
      'pluginid' => 31,
      'event' => 'OnLoadWebDocument',
    ),
    'object' => 
    array (
      'pluginid' => 31,
      'event' => 'OnLoadWebDocument',
      'priority' => 0,
      'propertyset' => 0,
    ),
  ),
  '01dc92f6c72964a09581032d94c3d61f' => 
  array (
    'criteria' => 
    array (
      'pluginid' => 31,
      'event' => 'OnPageNotFound',
    ),
    'object' => 
    array (
      'pluginid' => 31,
      'event' => 'OnPageNotFound',
      'priority' => 0,
      'propertyset' => 0,
    ),
  ),
);