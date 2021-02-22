<?php return array (
  '94c3763bc52c75d873d16634a567d792' => 
  array (
    'criteria' => 
    array (
      'name' => 'goodstar',
    ),
    'object' => 
    array (
      'name' => 'goodstar',
      'path' => '{core_path}components/goodstar/',
      'assets_path' => '{base_path}goodStar/assets/components/goodstar/',
    ),
  ),
  'd0981708d0b98b912c11b323214b52e3' => 
  array (
    'criteria' => 
    array (
      'key' => 'goodstar_jsUrl',
    ),
    'object' => 
    array (
      'key' => 'goodstar_jsUrl',
      'value' => 'assets/components/goodstar/js/jquery-bar-rating/dist/jquery.barrating.min.js',
      'xtype' => 'textfield',
      'namespace' => 'goodstar',
      'area' => 'goodstar_main',
      'editedon' => NULL,
    ),
  ),
  '9d90fd9430809f01c6a91fa2ae65b99d' => 
  array (
    'criteria' => 
    array (
      'key' => 'goodstar_jsCustom',
    ),
    'object' => 
    array (
      'key' => 'goodstar_jsCustom',
      'value' => 'assets/components/goodstar/js/goodstar.js',
      'xtype' => 'textfield',
      'namespace' => 'goodstar',
      'area' => 'goodstar_main',
      'editedon' => NULL,
    ),
  ),
  'ff06e992634e27284f5dc2e9223abc3f' => 
  array (
    'criteria' => 
    array (
      'key' => 'goodstar_theme',
    ),
    'object' => 
    array (
      'key' => 'goodstar_theme',
      'value' => 'css-stars',
      'xtype' => 'textfield',
      'namespace' => 'goodstar',
      'area' => 'goodstar_main',
      'editedon' => '2020-02-20 15:36:03',
    ),
  ),
  'b6fcc25c31a3ae06fefbcd2bc6287c1a' => 
  array (
    'criteria' => 
    array (
      'key' => 'goodstar_selector',
    ),
    'object' => 
    array (
      'key' => 'goodstar_selector',
      'value' => '.example',
      'xtype' => 'textfield',
      'namespace' => 'goodstar',
      'area' => 'goodstar_main',
      'editedon' => NULL,
    ),
  ),
  '52071be6174e69ab517717e028c64fa1' => 
  array (
    'criteria' => 
    array (
      'key' => 'goodstar_hide_scheme',
    ),
    'object' => 
    array (
      'key' => 'goodstar_hide_scheme',
      'value' => '1',
      'xtype' => 'combo-boolean',
      'namespace' => 'goodstar',
      'area' => 'goodstar_main',
      'editedon' => '2020-02-20 15:40:58',
    ),
  ),
  '54e1b1263f9f7df961b73906d44c4454' => 
  array (
    'criteria' => 
    array (
      'category' => 'goodStar',
    ),
    'object' => 
    array (
      'id' => 45,
      'parent' => 0,
      'category' => 'goodStar',
      'rank' => 0,
    ),
  ),
  '9a9251146a3daa2b3e93cbc60df82d96' => 
  array (
    'criteria' => 
    array (
      'name' => 'tpl.goodStar',
    ),
    'object' => 
    array (
      'id' => 49,
      'source' => 1,
      'property_preprocess' => 0,
      'name' => 'tpl.goodStar',
      'description' => 'Чанк для вывода рейтинга',
      'editor_type' => 0,
      'category' => 45,
      'cache_type' => 0,
      'snippet' => '<div itemscope itemtype="http://schema.org/Product">
    <p itemprop="name" class="rating-hide">[[+name]]</p> <!-- Название Продукта -->

    <select class="example" data-thread="[[+id]]" data-current-rating="[[+current_rating]]" data-group="[[+group]]" data-readonly="[[+readonly]]">
        <option value=""></option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    <span>[[+user_rating:notempty=`Ваш голос: [[+user_rating]]`]]</span>
    <span>Число голосов: [[+count_voite]]</span>

    <div itemscope itemtype="http://schema.org/AggregateRating" itemprop="aggregateRating" class="rating-hide"> <!-- Начало РЕЙТИНГА -->
        <div itemprop="ratingValue">[[+current_rating]]</div> <!-- Значение рейтинга -->
        <div itemprop="bestRating">5</div> <!-- Максимальное Значение рейтинга -->
        <div itemprop="worstRating">1</div> <!-- Минимальное Значение рейтинга -->
        <div itemprop="ratingCount">[[+count_voite]]</div> <!-- Число голосов -->
    </div><!-- Конец РЕЙТИНГА -->
</div>',
      'locked' => 0,
      'properties' => NULL,
      'static' => 0,
      'static_file' => 'core/components/goodstar/elements/chunks/item.tpl',
      'content' => '<div itemscope itemtype="http://schema.org/Product">
    <p itemprop="name" class="rating-hide">[[+name]]</p> <!-- Название Продукта -->

    <select class="example" data-thread="[[+id]]" data-current-rating="[[+current_rating]]" data-group="[[+group]]" data-readonly="[[+readonly]]">
        <option value=""></option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    <span>[[+user_rating:notempty=`Ваш голос: [[+user_rating]]`]]</span>
    <span>Число голосов: [[+count_voite]]</span>

    <div itemscope itemtype="http://schema.org/AggregateRating" itemprop="aggregateRating" class="rating-hide"> <!-- Начало РЕЙТИНГА -->
        <div itemprop="ratingValue">[[+current_rating]]</div> <!-- Значение рейтинга -->
        <div itemprop="bestRating">5</div> <!-- Максимальное Значение рейтинга -->
        <div itemprop="worstRating">1</div> <!-- Минимальное Значение рейтинга -->
        <div itemprop="ratingCount">[[+count_voite]]</div> <!-- Число голосов -->
    </div><!-- Конец РЕЙТИНГА -->
</div>',
    ),
  ),
  '5eca7301293ad11b7069b963fbdf26b2' => 
  array (
    'criteria' => 
    array (
      'name' => 'goodStar',
    ),
    'object' => 
    array (
      'id' => 63,
      'source' => 1,
      'property_preprocess' => 0,
      'name' => 'goodStar',
      'description' => 'Снипет для вывода звездного рейтинга',
      'editor_type' => 0,
      'category' => 45,
      'cache_type' => 0,
      'snippet' => '/** @var modX $modx */
/** @var array $scriptProperties */
/** @var goodStar $goodStar */
$goodStar = $modx->getService(\'goodStar\', \'goodStar\', $modx->getOption(\'goodstar_core_path\' ,\'\', MODX_CORE_PATH . \'components/goodstar/\') . \'model/\', $scriptProperties);
if (!$goodStar) {
    return \'Could not load goodStar class!\';
}

$thread = !empty($thread) ? $thread : $modx->resource->id;
$tpl = !empty($tpl) ? $tpl : \'tpl.goodStar\';
$group = !empty($group) ? $group : \'\';
$conclusion = !empty($conclusion) ? $conclusion : \'wilson\';
$onlyAuth = !empty($onlyAuth) ? $onlyAuth : false;
$readonly = !empty($readonly) ? $readonly : false;

$current_rating = $goodStar->getCurrentRating($thread, $conclusion);
$count_voite = $goodStar->getCountVoite($thread);

$readonly  = $goodStar->getReadOnly($thread, $readonly, $onlyAuth);

$arr = array(
    \'id\' => $thread,
    \'current_rating\' => $current_rating,
    \'user_rating\' => $goodStar->getCurrentRating($thread, \'user\'),
    \'group\' => $group,
    \'count_voite\' => $count_voite,
    \'readonly\' => $readonly,
    \'name\' => $goodStar->getName($thread)
);

/**
 * @var pdoTools $pdoTools
 */
if($pdoTools = $modx->getService(\'pdotools\')){
    $output = $pdoTools->getChunk($tpl, $arr);
}else{
    $output = $modx->getChunk($tpl, $arr);
}

return $output;',
      'locked' => 0,
      'properties' => 'a:5:{s:6:"thread";a:7:{s:4:"name";s:6:"thread";s:4:"desc";s:20:"goodstar_prop_thread";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:0:"";s:7:"lexicon";s:19:"goodstar:properties";s:4:"area";s:0:"";}s:5:"group";a:7:{s:4:"name";s:5:"group";s:4:"desc";s:19:"goodstar_prop_group";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:0:"";s:7:"lexicon";s:19:"goodstar:properties";s:4:"area";s:0:"";}s:3:"tpl";a:7:{s:4:"name";s:3:"tpl";s:4:"desc";s:17:"goodstar_prop_tpl";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:12:"tpl.goodStar";s:7:"lexicon";s:19:"goodstar:properties";s:4:"area";s:0:"";}s:10:"conclusion";a:7:{s:4:"name";s:10:"conclusion";s:4:"desc";s:24:"goodstar_prop_conclusion";s:4:"type";s:4:"text";s:7:"options";a:0:{}s:5:"value";s:6:"wilson";s:7:"lexicon";s:19:"goodstar:properties";s:4:"area";s:0:"";}s:8:"readonly";a:7:{s:4:"name";s:8:"readonly";s:4:"desc";s:22:"goodstar_prop_readonly";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:0:"";s:7:"lexicon";s:19:"goodstar:properties";s:4:"area";s:0:"";}}',
      'moduleguid' => '',
      'static' => 0,
      'static_file' => 'core/components/goodstar/elements/snippets/goodstar.php',
      'content' => '/** @var modX $modx */
/** @var array $scriptProperties */
/** @var goodStar $goodStar */
$goodStar = $modx->getService(\'goodStar\', \'goodStar\', $modx->getOption(\'goodstar_core_path\' ,\'\', MODX_CORE_PATH . \'components/goodstar/\') . \'model/\', $scriptProperties);
if (!$goodStar) {
    return \'Could not load goodStar class!\';
}

$thread = !empty($thread) ? $thread : $modx->resource->id;
$tpl = !empty($tpl) ? $tpl : \'tpl.goodStar\';
$group = !empty($group) ? $group : \'\';
$conclusion = !empty($conclusion) ? $conclusion : \'wilson\';
$onlyAuth = !empty($onlyAuth) ? $onlyAuth : false;
$readonly = !empty($readonly) ? $readonly : false;

$current_rating = $goodStar->getCurrentRating($thread, $conclusion);
$count_voite = $goodStar->getCountVoite($thread);

$readonly  = $goodStar->getReadOnly($thread, $readonly, $onlyAuth);

$arr = array(
    \'id\' => $thread,
    \'current_rating\' => $current_rating,
    \'user_rating\' => $goodStar->getCurrentRating($thread, \'user\'),
    \'group\' => $group,
    \'count_voite\' => $count_voite,
    \'readonly\' => $readonly,
    \'name\' => $goodStar->getName($thread)
);

/**
 * @var pdoTools $pdoTools
 */
if($pdoTools = $modx->getService(\'pdotools\')){
    $output = $pdoTools->getChunk($tpl, $arr);
}else{
    $output = $modx->getChunk($tpl, $arr);
}

return $output;',
    ),
  ),
  'addfb034d7fcd0e6172160d186d4b551' => 
  array (
    'criteria' => 
    array (
      'name' => 'goodStar',
    ),
    'object' => 
    array (
      'id' => 28,
      'source' => 1,
      'property_preprocess' => 0,
      'name' => 'goodStar',
      'description' => 'Плагин для подключения стилей',
      'editor_type' => 0,
      'category' => 45,
      'cache_type' => 0,
      'plugincode' => '/** @var modX $modx */
switch ($modx->event->name) {

    case \'OnLoadWebDocument\':
        /**
         * @var goodStar $goodStar
         */

        $goodStar = $modx->getService(\'goodStar\', \'goodStar\', $modx->getOption(\'goodstar_core_path\' ,\'\', MODX_CORE_PATH . \'components/goodstar/\') . \'model/\', $scriptProperties);
        if (!$goodStar) {
            return \'Could not load goodStar class!\';
        }

        $goodStar->initialize();

        break;

}',
      'locked' => 0,
      'properties' => NULL,
      'disabled' => 0,
      'moduleguid' => '',
      'static' => 0,
      'static_file' => 'core/components/goodstar/elements/plugins/goodstar.php',
      'content' => '/** @var modX $modx */
switch ($modx->event->name) {

    case \'OnLoadWebDocument\':
        /**
         * @var goodStar $goodStar
         */

        $goodStar = $modx->getService(\'goodStar\', \'goodStar\', $modx->getOption(\'goodstar_core_path\' ,\'\', MODX_CORE_PATH . \'components/goodstar/\') . \'model/\', $scriptProperties);
        if (!$goodStar) {
            return \'Could not load goodStar class!\';
        }

        $goodStar->initialize();

        break;

}',
    ),
  ),
  '200821c63d2434a1be7c26e6b5cf8d3d' => 
  array (
    'criteria' => 
    array (
      'pluginid' => 28,
      'event' => 'OnLoadWebDocument',
    ),
    'object' => 
    array (
      'pluginid' => 28,
      'event' => 'OnLoadWebDocument',
      'priority' => 0,
      'propertyset' => 0,
    ),
  ),
);