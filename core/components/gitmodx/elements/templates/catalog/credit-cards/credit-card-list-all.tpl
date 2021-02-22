{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}

<section>
    <div class="container-main">
        {'!pdoCrumbs' | snippet : [
            'to' => $_modx->id,
        	'showHome' => 1,
        	'tpl' => 'bread_tpl',
        	'tplWrapper' => 'bread_tplWrapper',
        	'tplCurrent' => 'bread_tplCurrent'
        ]}
            <h1 class="title">{$_modx->resource.pagetitle}</h1>
            <p>{$_modx->resource.introtext}</p>
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
                
				'parents' => '645, 654, 660, 666, 671, 677, 683, 689, 695, 701, 707, 713, 719, 724, 730, 736, 746, 751, 757, 762, 767, 773, 779, 784',
				'where' => $where|toJSON,
				'leftJoin' => $leftJoin|toJSON,
				'groupby'=>'modResource.id',
				'loadModels'=>'tvsuperselect',
				'showEmptyFilters' => 1,
				'forceSearch' => 0,
				'limit' => 10,
				'filters' => '
					tv|age_credit_cards_range:numbers,
					tv|limit_range:numbers',
				'aliases' => '
				    tv|age_credit_cards_range==credit_cards_age,
				    tv|limit_range==credit_cards_limit',
				'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
				'sort' => 'tv|manual_sort:desc,tv|referal_link:desc,resource|pagetitle:asc',
				'tvPrefix' => 'tv.',
				'tpl' => 'credit-cards',
				'tplOuter' => 'mfilter_outer_listing',
				'tplFilter.outer.obtaining' => 'filter_outer_select',
				'tplFilter.row.obtaining' => 'filter_outer_select',
				'tplFilter.outer.summ' => 'filter_outer_price',
				'tplFilter.row.summ' => 'filter_row_price',
				'tplFilter.outer.credit_cards_limit' => 'filter_outer_price',
				'tplFilter.row.credit_cards_limit' => 'filter_row_price',
				'tplFilter.outer.credit_cards_age' => 'filter_outer_price',
				'tplFilter.row.credit_cards_age' => 'filter_row_price',
				'ajaxMode' => 'button',
			])}

</section>


{/block}

{block 'before_footer'}{/block}
{block 'after_footer'}
	{$_modx->runSnippet('!reload_filter')}
{/block}