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
                'resources' => $_modx->resource.debit_card_tags_ids,
				'parents' => '643,650,659,665,670,676,682,688,694,700,706,712,718,723,729,735,741,745,750,756,761,766,772,778,783,977',
				'where' => $where|toJSON,
				'leftJoin' => $leftJoin|toJSON,
				'groupby'=>'modResource.id',
				'loadModels'=>'tvsuperselect',
				'showEmptyFilters' => 1,
				'forceSearch' => 0,
				'limit' => 10,
				'filters' => '
					tv|debit_age:numbers',
				'aliases' => '
					tv|debit_age==debit_age',
				'includeTVs' => $_modx->getChunk('debit_card_tvs'),
				'sort' => 'tv|manual_sort:desc,tv|referal_link:desc,resource|pagetitle:asc',
				'tvPrefix' => 'tv.',
				'tpl' => 'debit-cards',
				'tplOuter' => 'mfilter_outer_listing',
				'tplFilter.outer.obtaining' => 'filter_outer_select',
				'tplFilter.row.obtaining' => 'filter_outer_select',
				'tplFilter.outer.summ' => 'filter_outer_price',
				'tplFilter.row.summ' => 'filter_row_price',
				'tplFilter.outer.time' => 'filter_outer_price',
				'tplFilter.row.time' => 'filter_row_price',
				'tplFilter.outer.debit_age' => 'filter_outer_price',
				'tplFilter.row.debit_age' => 'filter_row_price',
				'ajaxMode' => 'button',
			])}


</section>

{/block}

{block 'before_footer'}{/block}
{block 'after_footer'}
	{$_modx->runSnippet('!reload_filter')}
{/block}