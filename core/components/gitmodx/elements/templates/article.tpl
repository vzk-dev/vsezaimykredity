{extends 'template:base'}

{block 'after_header'}
{/block}

{block 'body'}

<div class="site-container">
	<div class="container-main">
	
		{'!pdoCrumbs' | snippet : [
			'to' => $_modx->id,
			'showHome' => 1,
			'tpl' => 'bread_tpl',
			'tplWrapper' => 'bread_tplWrapper',
			'tplCurrent' => 'bread_tplCurrent'
		]}

        <h1 class="page-title">{$_modx->resource.pagetitle}</h1>


            {'content'|resource}
            

                {'!pdoResources' | snippet : [
                    'parents' => 794,
                    'groupby' => 'modResource.parent',
                	'tpl' => 'zaim',
                	'depth' => 0,
                	'includeTVs' => $_modx->getChunk('microloans_tvs'),
                	'limit' => 1,
                ]}


{*
        <!-- облако тегов -->
        {include 'tag_cloud_links'}

        {'!pdoPage' | snippet : [
            'parents'=> 0,
            'resources' => $_modx->resource.recomended,
            'tpl' => 'news-item',
            'limit' => 3,
            'includeTVs' => 'img',
            'toPlaceholder' => 'recomended'
        ]}

        {if $_modx->getPlaceholder('recomended')}
        <div class="resomended-wrapper">
            <div class="h3">Рекомендуем по теме</div>
            <div class="row">
                {$_modx->getPlaceholder('recomended')}
            </div>
        </div>
        {/if}

    </div>	

	<div class="right-sidebar">

        {if $_modx->resource.main_type == 1}
            {'!set_custom_placeholder'| snippet:['key'=>'filter_title','value'=>'Поиск займа']}
            {$_modx->runSnippet('!set_custom_placeholder',['key'=>'parent_id','value'=>15])}
            
            {$_modx->runSnippet('!mFilter2', [
                'parents' => 15,
                'showEmptyFilters' => 1,
                'forceSearch' => 0,
                'limit' => 1,
                'filters' => '
                    tv|age_range:numbers,
                    tv|summ_range:numbers,
                    tv|time_range:numbers,
                    tv|obtaining,
                    tv|options',
                'aliases' => '
                    tv|age_range==age,
                    tv|summ_range==summ,
                    tv|time_range==time,
                    tv|obtaining==sposob_polucheniya,
                    tv|options==options',
                'includeTVs' => $_modx->getChunk('microloans_tvs'),
                'sort' => '',	
                'tvPrefix' => 'tv.',
                'tpl' => 'loan-item',
                'tplOuter' => 'mfilter_outer_only_form_article',
                'tplFilter.outer.default' => 'filter_outer_checkbox',
                'tplFilter.row.default' => 'filter_row_checkbox',
                'tplFilter.outer.summ' => 'filter_outer_price',
                'tplFilter.row.summ' => 'filter_row_price',
                'tplFilter.outer.time' => 'filter_outer_price',
                'tplFilter.row.time' => 'filter_row_price',
                'tplFilter.outer.age' => 'filter_outer_price',
                'tplFilter.row.age' => 'filter_row_price',
                'filterOptions' => '{"autoLoad":0}',
            ])}
        {elseif $_modx->resource.main_type == 2}

            {'!set_custom_placeholder'| snippet:['key'=>'filter_title','value'=>'Поиск кредитной карты']}
            {$_modx->runSnippet('!set_custom_placeholder',['key'=>'parent_id','value'=>39])}
            
            {$_modx->runSnippet('!mFilter2', [
                'parents' => 39,
                'showEmptyFilters' => 1,
                'forceSearch' => 0,
                'limit' => 1,
                'filters' => '
                    tv|limit_range:numbers,
                    tv|persent_range:numbers,
                    tv|age_range:numbers,
                    tv|grace_period,
                    tv|credit_options',
                'aliases' => '
                    tv|limit_range==limit_summ,
                    tv|persent_range==persent,
                    tv|age_range==credit_card_age,
                    tv|grace_period==grace,
                    tv|credit_options==credit_options',
                'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
                'sort' => '',	
                'tvPrefix' => 'tv.',
                'tpl' => 'loan-item',
                'tplOuter' => 'mfilter_outer_only_form_article',
                'tplFilter.outer.default' => 'filter_outer_checkbox',
                'tplFilter.row.default' => 'filter_row_checkbox',
                'tplFilter.outer.limit_summ' => 'filter_outer_price',
                'tplFilter.row.limit_summ' => 'filter_row_price',
                'tplFilter.outer.persent' => 'filter_outer_price',
                'tplFilter.row.persent' => 'filter_row_price',
                'tplFilter.outer.credit_card_age' => 'filter_outer_price',
                'tplFilter.row.credit_card_age' => 'filter_row_price',
                'filterOptions' => '{"autoLoad":0}',
            ])}

        {elseif $_modx->resource.main_type == 3}
        
            {'!set_custom_placeholder'| snippet:['key'=>'filter_title','value'=>'Поиск дебетовой карты']}
            {$_modx->runSnippet('!set_custom_placeholder',['key'=>'parent_id','value'=>42])}
            
            {$_modx->runSnippet('!mFilter2', [
                'parents' => 42,
                'showEmptyFilters' => 1,
                'forceSearch' => 0,
                'limit' => 1,
                'filters' => '
                    tv|debit_age:numbers,
                    tv|debit_option,
                    tv|banki',
                'aliases' => '
                    tv|debit_age==debit_age,
                    tv|debit_option==debit_option,
                    tv|banki==debit_banki',
                'includeTVs' => $_modx->getChunk('debit_card_tvs'),
                'sort' => '',	
                'tvPrefix' => 'tv.',
                'tpl' => 'loan-item',
                'tplOuter' => 'mfilter_outer_only_form_article',
                'tplFilter.outer.default' => 'filter_outer_checkbox',
                'tplFilter.row.default' => 'filter_row_checkbox',
                'tplFilter.outer.debit_age' => 'filter_outer_price',
                'tplFilter.row.debit_age' => 'filter_row_price',
                'filterOptions' => '{"autoLoad":0}',
            ])}

        {elseif $_modx->resource.main_type == 4}

            {'!set_custom_placeholder'| snippet:['key'=>'filter_title','value'=>'Поиск кредита']}
            {$_modx->runSnippet('!set_custom_placeholder',['key'=>'parent_id','value'=>45])}
            
            {$_modx->runSnippet('!mFilter2', [
                'parents' => 45,
                'showEmptyFilters' => 1,
                'forceSearch' => 0,
                'limit' => 1,
                'filters' => '
                    tv|credit_summ:numbers,
                    tv|credit_time:numbers,
                    tv|credit_age:numbers,
                    tv|credit_type,
                    tv|credit_option',
                'aliases' => '
                    tv|credit_summ==summ,
                    tv|credit_time==time,
                    tv|credit_age==age,
                    tv|credit_type==type,
                    tv|credit_option==credit_option',
                'includeTVs' => $_modx->getChunk('credit_tvs'),
                'sort' => '',	
                'tvPrefix' => 'tv.',
                'tpl' => 'loan-item',
                'tplOuter' => 'mfilter_outer_only_form_article',
                'tplFilter.outer.default' => 'filter_outer_checkbox',
                'tplFilter.row.default' => 'filter_row_checkbox',
                'tplFilter.outer.summ' => 'filter_outer_price',
                'tplFilter.row.summ' => 'filter_row_price',
                'tplFilter.outer.time' => 'filter_outer_price',
                'tplFilter.row.time' => 'filter_row_price',
                'tplFilter.outer.age' => 'filter_outer_price',
                'tplFilter.row.age' => 'filter_row_price',
                'filterOptions' => '{"autoLoad":0}',
            ])}

        {/if}
		
		<!-- Перелинковка -->
		{include 'offers_page_relinks'}

	</div>*}
	
</div>
	
{/block}

{block 'before_footer'}
{/block}