{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}

<section class="section section__page" data-mod-id="{$_modx->resource.parent}">
    <div class="container-main">
        {'!pdoCrumbs' | snippet : [
            'to' => $_modx->id,
        	'showHome' => 1,
        	'tpl' => 'bread_tpl',
        	'tplWrapper' => 'bread_tplWrapper',
        	'tplCurrent' => 'bread_tplCurrent'
        ]}
            <h1 class="title">{$_modx->resource.longtitle}</h1>
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
                'resources' => $_modx->resource.microloans_tags_ids,
				'parents' => 794,
				'where' => $where|toJSON,
				'leftJoin' => $leftJoin|toJSON,
                'groupby' => 'modResource.id',
				'loadModels'=>'tvsuperselect',
				'showEmptyFilters' => 1,
				'forceSearch' => 0,
				'hideContainers' => 1,
				'limit' => 1000,
				'filters' => 'tv|age_range:numbers, tv|summ_range:numbers, tv|time_range:numbers, tv|obtaining:select',
				'aliases' => 'tv|age_range==age, tv|summ_range==summ, tv|time_range==time, tv|obtaining==sposob_polucheniya',
				'includeTVs' => $_modx->getChunk('microloans_tvs'),
				'sort' => 'tv|manual_sort:desc,tv|referal_link:desc,resource|menuindex:asc',
				'tvPrefix' => 'tv.',
				'tpls' => 'zaim, zaim_dop_card',
				'tplOuter' => 'mfilter_outer_listing',
				'tplFilter.outer.sposob_polucheniya' => 'filter_outer_select',
				'tplFilter.row.sposob_polucheniya' => 'filter_outer_select',
				'tplFilter.outer.summ' => 'filter_outer_price',
				'tplFilter.row.summ' => 'filter_row_price',
				'tplFilter.outer.time' => 'filter_outer_price',
				'tplFilter.row.time' => 'filter_row_price',
				'tplFilter.outer.age' => 'filter_outer_price',
				'tplFilter.row.age' => 'filter_row_price',
				'ajaxMode' => 'button',
			])}


</section>

{/block}

{block 'before_footer'}{/block}
{block 'after_footer'}
	{$_modx->runSnippet('!reload_filter')}
{/block}