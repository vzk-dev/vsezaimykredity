<fieldset class="filter-criteria" id="mse2_{$table}{$delimeter}{$filter}">
    <div class="filter-criteria__title">{$_modx->lexicon('mse2_filter_'~$table~'_'~$filter)}</div>
    <div class="filter-criteria__slider">
        <div class="mse2_number_slider"></div>
        <div class="mse2_number_inputs row">
            {$rows}
        </div>
    </div>
</fieldset>