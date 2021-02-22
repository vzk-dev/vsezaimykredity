{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}

<section>
    <div class="container">
        {'!pdoCrumbs' | snippet : [
            'to' => $_modx->id,
        	'showHome' => 1,
        	'tpl' => 'bread_tpl',
        	'tplWrapper' => 'bread_tplWrapper',
        	'tplCurrent' => 'bread_tplCurrent'
        ]}
        <div class="credits-bank-inner">
            <div class="credits-bank">
                <h1 class="title">{$_modx->resource.longtitle}</h1>
            </div>
            <picture>
                <source srcset="{$_modx->resource.parent|resource:'img'}" type="image/webp" />
                <img class="b-lazy credits-bank__image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_modx->resource.parent|resource:'img'}" alt="{$_modx->resource.longtitle}" />
            </picture>
            {*<img class="credits-bank__image" src="assets/img/s.png" alt="">*}
        </div>
    </div>
    <div class="bg-nav-sub">
        <div class="container">
            <nav class="nav-sub">
                {include 'nav_sub'}
            </nav>
        </div>
    </div>


        <!-- Фильтр по городам -->
		{set $location = ''|getUserLocation}
		
		{set $leftJoin = [
			'cityin'=>[
				'class' => 'tvssOption',
				'on' => '`modResource`.`id` = `cityin`.`resource_id` AND `cityin`.`tv_id` = 65 AND `cityin`.`value` = "'~$location.name~'"'
			]
		]}
		{set $where = [
			[
				'
				NOT EXISTS (SELECT * FROM `uy76g8_tvss_options` `pcityex` WHERE `modResource`.`id` = `pcityex`.`resource_id` AND `pcityex`.`tv_id` = 66 AND `pcityex`.`value` = "'~$location.name~'")
				AND (`cityin`.`value` = "'~$location.name~'" OR `cityin`.`value` IS NULL and `TVcity_new`.`value` = "[]")
				'
			]
		]}
        
        {$_modx->runSnippet('!mFilter2', [
				'parents' => $_modx->resource.id,
				'where' => $where|toJSON,
				'leftJoin' => $leftJoin|toJSON,
				'groupby'=>'modResource.id',
				'loadModels'=>'tvsuperselect',
				'showEmptyFilters' => 1,
				'forceSearch' => 0,
				'limit' => 0,
				'filters' => '
    				tv|debit_age:numbers,',
    			'aliases' => '
				    tv|debit_age==debit_age,',
				'includeTVs' => $_modx->getChunk('debit_card_tvs'),
				'sort' => 'tv|manual_sort:desc,tv|referal_link:desc,resource|pagetitle:asc',
				'tvPrefix' => 'tv.',
				'tpl' => 'cards-item',
				'tplOuter' => 'mfilter_outer_list_category',
				'tplFilter.outer.default' => 'filter_outer_checkbox',
				'tplFilter.row.default' => 'filter_row_checkbox',
				'tplFilter.outer.debit_age' => 'filter_outer_price',
				'tplFilter.row.debit_age' => 'filter_row_price',
				'tplFilter.outer.persent' => 'filter_outer_price',
				'tplFilter.row.persent' => 'filter_row_price',
				'tplFilter.outer.credit_card_age' => 'filter_outer_price',
				'tplFilter.row.credit_card_age' => 'filter_row_price',
				'ajaxMode' => 'button',
			])}

</section>

<div class="credits-bank-text">
    <div class="container">
        {'content'|resource}
    </div>
</div>

<!-- Лучшие предложения месяца -->
<div class="ground">
    <div class="container">
        <div class="text-center">
    <h2 class="page-title">Лучшие дебетовые карты месяца</h2>
</div>
<div class="best-offers">
    <div class="best-offers-image">
        <img src="assets/template/assets/img/hand.png" alt="">
    </div>
    {'!pdoResources' | snippet : [
    		'parents'=> 641,
    		'tpl' => 'best_cards',
    		'limit' => 4,
    		'includeTVs' => $_modx->getChunk('debit_card_tvs'),
    		'sortby' => 'RAND()',
    		'where' => '{"template":"13", "referal_link:LIKE":"%https%"}'

    	]}
</div>
    </div>
</div>
{*
<!--Отзывы-->
{{> reviews-slider }*}

{/block}

{block 'before_footer'}{/block}
{block 'after_footer'}
	{$_modx->runSnippet('!reload_filter')}
{/block}