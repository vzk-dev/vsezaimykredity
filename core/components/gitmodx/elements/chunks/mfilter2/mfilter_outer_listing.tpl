{if $_modx->resource.template not in [26,33]}
<div class="mobile_filter_button">Поиск</div>
<div class="filtr">
    <div class="container-main">
        <div class="filter-title">Подобрать {if $_modx->resource.template in [6,20]}займ{elseif $_modx->resource.template == 29}кредитную карту{elseif $_modx->resource.template == 26}дебетовую карту{elseif $_modx->resource.template in [28,34]}кредит{else}ипотеку{/if} {'!city_case'|snippet:['case'=>'где']}</div>
        <form class="filter" action="{$_modx->resource.id | url}" method="post" id="mse2_filters">
            <div class="row msearch2" id="mse2_mfilter">
                {$filters}
            </div>
        </form>
        <div class="credits-search-cancel">
            <div class="filter-reset credits-search-cancel__text">Сбросить фильтры</div>
        </div>
	</div>
</div>
{/if}
<div class="{if $_modx->resource.template not in[26,33]}ground{/if} pb-5">
    <div class="container-main">
        <div id="mse2_total" style="display:none;">{$total ?: 0}</div>
        <div id="mse2_sort" class="sort" >    
            <div class="sort-choice">
                {*Для шаблонов МФО*}
                {if $_modx->resource.template in [6,20]}
                <div class="sort-title">Сортировать:</div>
                    <a class="sort-value sort-value--color1" href="#" data-sort="tv|summ_range" data-dir="{if $sort == 'tv|summ_range:desc'}desc{/if}" data-default="desc">по сумме<span class="sort-arrow"></span></a>
                    <a class="sort-value sort-value--color2" href="#" data-sort="tv|time_range" data-dir="{if $sort == 'tv|time_range:desc'}desc{/if}" data-default="desc">по сроку<span class="sort-arrow"></span></a>
                    <a class="sort-value sort-value--color3" href="#" data-sort="tv|age_range" data-dir="{if $sort == 'tv|age_range:desc'}desc{/if}" data-default="desc">по возрасту<span class="sort-arrow"></span></a>
                {/if}
            </div>
            <div class="sort-update">
                Обновлено {$editedon  | date : 'd.m.Y'}
            </div>
        </div>
        
        <div class="row msearch2" id="mse2_mfilter" data-mod-id="[[*id]]">
    		<div class="col-12 col-lg-12">
        		<div class="loan-items-list" id="mse2_results">
            		{$results}
        		</div>
        		<div class="paging mse2_pagination" style="display:none">
                    <nav>
                        {'page.nav' | placeholder}
                    </nav>
                </div>
        	</div>
        </div>
    </div>
</div>