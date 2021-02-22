<div class="sidebar-block gray" id="mse2_mfilter">
    <div class="sidebar-block__title">{'filter_title' | placeholder}</div>
    <form class="filter" action="{$_modx->resource.parent|url}" method="post" id="mse2_filters">
        {$filters}
        <input type="hidden" name="r_a" value="1">
        <button type="submit" class="btn btn-more">Подобрать предложения</button>
    </form>
</div>