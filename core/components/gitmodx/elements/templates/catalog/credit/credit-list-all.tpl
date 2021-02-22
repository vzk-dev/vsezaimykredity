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

				'parents' => '646, 655, 661, 667, 672, 678, 684, 690, 696, 702, 708, 714, 720, 725, 731, 737, 742, 747, 752, 758, 763, 768, 774, 780, 785, 789, 791, 793',
				'where' => $where|toJSON,
				'leftJoin' => $leftJoin|toJSON,
				'groupby'=>'modResource.id',
				'loadModels'=>'tvsuperselect',
				'showEmptyFilters' => 1,
				'forceSearch' => 0,
				'limit' => 10,
				'filters' => '
					tv|credit_age:numbers,
					tv|credit_summ:numbers,
					tv|credit_time:numbers',
				'aliases' => '
				    tv|credit_age==credit_age,
				    tv|credit_summ==credit_summ,
				    tv|credit_time==credit_time',
				'includeTVs' => $_modx->getChunk('credit_tvs'),
				'sort' => 'tv|manual_sort:desc,tv|referal_link:desc,resource|pagetitle:asc',
				'tvPrefix' => 'tv.',
				'tpl' => 'credit',
				'tplOuter' => 'mfilter_outer_listing',
				'tplFilter.outer.obtaining' => 'filter_outer_select',
				'tplFilter.row.obtaining' => 'filter_outer_select',
				'tplFilter.outer.credit_age' => 'filter_outer_price',
				'tplFilter.row.credit_age' => 'filter_row_price',
				'tplFilter.outer.credit_summ' => 'filter_outer_price',
				'tplFilter.row.credit_summ' => 'filter_row_price',
				'tplFilter.outer.credit_time' => 'filter_outer_price',
				'tplFilter.row.credit_time' => 'filter_row_price',
				'ajaxMode' => 'button',
			])}

</section>

{/block}

{block 'before_footer'}{/block}
{block 'after_footer'}
	{$_modx->runSnippet('!reload_filter')}
{/block}