<div class="mobile_filter_button">Подбор кредитной карты</div>
<!-- Стили в filter -->
<div class="filtr">
    <div class="container-main">
        <div class="filter-title">Подобрать кредитную карту {'!city_case'|snippet:['case'=>'где']}</div>
        <form class="filter" action="{$_modx->resource.id | url}" method="post" id="mse2_filters">
            <div class="row msearch2" id="mse2_mfilter">
                {$filters}
            </div>
        </form>
        {*<button class="btn btn-more filter-reset">Сбросить</button>*}
        <div class="col-md-7 col-lg-4 mb-4">
            <div class="credits-search-cancel">
                <div class="filter-reset credits-search-cancel__text">Сбросить фильтры</div>
            </div>
        </div>
	</div>
</div>

<div class="ground pb-5">
    <div class="container-main">
        <!-- Стили в card -->
        
        <div id="mse2_total" style="display:none;">{$total ?: 0}</div>
        <div id="mse2_sort" class="sort" >    
            <div class="sort-choice">
                <div class="sort-title">Сортировать:</div>
                <a class="sort-value sort-value--color1" href="#" data-sort="tv|age_credit_cards_range" data-dir="{if $sort == 'tv|age_credit_cards_range:desc'}desc{/if}" data-default="desc">по возрасту<span class="sort-arrow"></span></a>
            </div>
            <div class="sort-update">
                Обновлено {$editedon  | date : 'd.m.Y'}
            </div>
        </div>
        
        <div class="row msearch2" id="mse2_mfilter">
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
    
        {*<div class="more"><a href="#" class="btn btn-more">Показать еще<span class="btn-dop"></span></a></div>*}
    </div>
</div>