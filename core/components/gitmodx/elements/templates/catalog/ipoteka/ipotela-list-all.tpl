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
                
				'parents' => '647,656,662,673,679,685,691,697,703,709,715,726,732,738,753,769,775,786',
				'where' => $where|toJSON,
				'leftJoin' => $leftJoin|toJSON,
				'groupby'=>'modResource.id',
				'loadModels'=>'tvsuperselect',
				'showEmptyFilters' => 1,
				'forceSearch' => 0,
				'limit' => 10,
				'filters' => '
					tv|ipoteka_age:numbers,
					tv|ipoteka_summ:numbers,
					tv|ipoteka_time:numbers',
				'aliases' => '
				    tv|ipoteka_age==ipoteka_age,
				    tv|ipoteka_summ==ipoteka_summ,
				    tv|ipoteka_time==ipoteka_time',
				'includeTVs' => $_modx->getChunk('ipoteka_tvs'),
				'sort' => 'tv|manual_sort:desc,tv|referal_link:desc,resource|pagetitle:asc',
				'tvPrefix' => 'tv.',
				'tpl' => 'ipoteka',
				'tplOuter' => 'mfilter_outer_listing',
				'tplFilter.outer.obtaining' => 'filter_outer_select',
				'tplFilter.row.obtaining' => 'filter_outer_select',
				'tplFilter.outer.ipoteka_age' => 'filter_outer_price',
				'tplFilter.row.ipoteka_age' => 'filter_row_price',
				'tplFilter.outer.ipoteka_summ' => 'filter_outer_price',
				'tplFilter.row.ipoteka_summ' => 'filter_row_price',
				'tplFilter.outer.ipoteka_time' => 'filter_outer_price',
				'tplFilter.row.ipoteka_time' => 'filter_row_price',
				'ajaxMode' => 'button',
			])}

</section>

{/block}

{block 'before_footer'}{/block}
{block 'after_footer'}
	{$_modx->runSnippet('!reload_filter')}
{/block}