{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}

<section data-mod-id="{$_modx->resource.id}">
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

				'parents' => '794',
				'where' => $where|toJSON,
				'leftJoin' => $leftJoin|toJSON,
				'groupby' => 'modResource.parent',
				'loadModels'=>'tvsuperselect',
				'showEmptyFilters' => 1,
				'forceSearch' => 0,
				'limit' => 10,
				'depth' => 0,
				'filters' => '
					tv|age_range:numbers,
					tv|summ_range:numbers,
					tv|time_range:numbers,
					tv|obtaining',
				'aliases' => '
					tv|age_range==age,
					tv|summ_range==summ,
					tv|time_range==time,
					tv|obtaining==sposob_polucheniya',
				'includeTVs' => $_modx->getChunk('microloans_tvs'),
				'sort' => 'tv|manual_sort:desc,tv|referal_link:desc,resource|menuindex:asc',
				'tvPrefix' => 'tv.',
				'tpls' => 'zaim, zaim_dop_card',
				'tplOuter' => 'mfilter_outer_listing',
				'tplFilter.outer.default' => 'filter_row_checkbox',
				'tplFilter.row.default' => 'filter_row_checkbox',
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