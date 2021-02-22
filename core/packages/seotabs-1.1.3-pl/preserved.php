<?php return array (
  'cc303924ed5e51896d77b3baaf95a30b' => 
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
  '74d04e53c434d222da0e3435e91f8ebf' => 
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
  'a3edfd80b2a4f0a67ef1e98b6a949132' => 
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
  'e1e8c76c9b0c96ca5b39301962147963' => 
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
  'f6a5ceaf8dbac91f4e03d0187fcae0c0' => 
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
  '8050962a32257a40e20e4b61868e7262' => 
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
  '81791ad74a34a12e09f09ee4ebbc6fb5' => 
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
  'be51c2954cdc1b8550bbcf1ba45344d3' => 
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
  'd1c8f95fef3e86de3e8e7b7c00425d56' => 
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
  '2c8200fc6650bd91329552081931483c' => 
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
  'a0c1f66bc3e29703a4dac85ef73be5f2' => 
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
  '39d7735783b71589bcc579588003cb9b' => 
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
<div class="tab-content mt-4">
    {$content}
</div>
',
      'locked' => 0,
      'properties' => 'a:0:{}',
      'static' => 0,
      'static_file' => '',
      'content' => '<ul class="nav nav-tabs">
    {$tabs}
</ul>
<div class="tab-content mt-4">
    {$content}
</div>
',
    ),
  ),
  'ee38c2cb7e2ed3ae3725635284298cdc' => 
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
  'e74c410e1ae76ff213b5c939df53f93d' => 
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
  '4baaf0d2cb825882d2c4a7440cb61309' => 
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
  'f38c8763df8cb6de62977037a0a133da' => 
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
  'a874f45ae59e615b9f5cc1b8ec83af74' => 
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
  '4ea824e1d02258687642941fee541c33' => 
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
  'b19c4256f92baf93ac6ff6ec381aef7e' => 
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