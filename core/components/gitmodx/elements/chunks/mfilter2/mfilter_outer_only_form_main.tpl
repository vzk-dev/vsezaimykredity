<div class="row msearch2" id="mse2_mfilter">
    <div class="col-12 col-lg-8" id="pdopage" >
        <div class="loan-items-list rows" id="mse2_results">
            {$results}
        </div>
        <div class="paging mse2_pagination">
            <nav>
                {'page.nav' | placeholder}
            </nav>
        </div>
    </div>
    <div class="col-12 col-lg-4 main-page-sidebar">
        <div class="sidebar-block gray sticky">
            <div class="sidebar-block__title">{'filter_title' | placeholder}</div>
            <form class="filter" {* action="{$id | url}" *} action="/{$_modx->getPlaceholder('formActionId')|url}" method="post" id="mse2_filters">
                {$filters}
                <button type="submit" class="btn btn-more">Подобрать предложения</button>
            </form>
        </div>
    </div>
</div>