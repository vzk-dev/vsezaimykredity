{*<div class="filter-criteria" id="mse2_{$table}{$delimeter}{$filter}">
    <div class="sidebar-block__title">{$_modx->lexicon('mse2_filter_'~$table~'_'~$filter)}</div>
    <div class="filter-select">
        <select name="{$filter_key}" id="{$key}_0" class="select2input ">
            <option value="" selected>{'mse2_select' | lexicon}</option>
            {$rows}
        </select>
    </div>
</div>*}

<div class="col-sm-6 col-md-6 col-lg-6 mb-4">
<div class="filter-input" id="mse2_{$table}{$delimeter}{$filter}">
    <label class="filter-input__name">{$_modx->lexicon('mse2_filter_'~$table~'_'~$filter)}</label>
    <select name="{$filter_key}" id="{$key}_0" class="select2input ">
        <option value="" selected>{'mse2_select' | lexicon}</option>
        {$rows}
    </select>
</div>
</div>