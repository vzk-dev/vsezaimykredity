<div class="col-sm-6 col-md-6 col-lg mb-4">
    <div class="filter-criteria" id="mse2_{$table}{$delimeter}{$filter}">
        <div class="filter-criteria__title">{$_modx->lexicon('mse2_filter_'~$table~'_'~$filter)}</div>
        <div class="filter-slider">
            <div class="filter-slider__visual-input">
                <div class="filter-slider__value"></div>
                <div class="filter-slider__text"></div>
            </div>
            <input type="number" name="{$filter_key}" class="js-slider-input" id="mse2_{$table}{$delimeter}{$filter}"  />
            <div class="js-slider-container"></div>
            <div class="filter-slider__inputs">{$rows}</div>
        </div>
    </div>
</div>

{*<div class="col-sm-6 col-md-6 col-lg-6 mb-4">
<div class="filter-input" id="mse2_{$table}{$delimeter}{$filter}">
    <label for="" class="filter-input__name">{$_modx->lexicon('mse2_filter_'~$table~'_'~$filter)}</label>
    <input type="number" class="filter-input__value" placeholder="{$_modx->lexicon('mse2_filter_'~$table~'_'~$filter)}" name="{$filter_key}" id="mse2_{$table}{$delimeter}{$filter}">
    <div class="filter-range">
        <div class="min-filter-range">100</div>
        <div class="max-filter-range">300 000</div>
    </div>
</div>
</div>*}