{if $_modx->resource.template not in [14]}
    {if $_modx->resource.template in [14,32]}<div class="mobile_filter_button">Подбор карты</div>
        {elseif $_modx->resource.template == 17}<div class="mobile_filter_button">Подбор кредита</div>
        {else}<div class="mobile_filter_button">Подбор ипотеки</div>
    {/if}
    
    <div class="filtr">
        <div class="container">
            {if $_modx->resource.template in [14,32]}<div class="credits-title">Подбор карты</div>
                {elseif $_modx->resource.template == 17}<div class="credits-title">Подбор кредита</div>
                {else}<div class="credits-title">Подбор ипотеки</div>
            {/if}
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

<div class="{if $_modx->resource.template not in[14]}ground{/if} pb-5">
    <div class="container">

        {*<div id="mse2_total" style="display:none;">{$total ?: 0}</div>
        <div id="mse2_sort" class="sort" >    
            <div class="sort-choice">
                <div class="sort-title">Сортировать:</div>
                <a class="sort-value sort-value--color1" href="#" data-sort="tv|age_credit_cards_range" data-dir="{if $sort == 'tv|age_credit_cards_range:desc'}desc{/if}" data-default="desc">по возрасту<span class="sort-arrow"></span></a>
            </div>
            <div class="sort-update">
                Обновлено {$editedon  | date : 'd.m.Y'}
            </div>
        </div>*}
        
        <div class="row msearch2" id="mse2_mfilter" data-mod-id=[[*id]]>
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