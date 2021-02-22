<tr>
    {if $_pls["tv.summ_range"]}
        <td class="mfo-category-table-value" data-label="Сумма">
            <div class="mfo-category-table-summ">
                <a class="mfo-category-table-summ__link" href="{$id | url}">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.summ_range"],'get_max'=>1]) | number : 0 : '.' : ' '} руб.</a>
            </div> 
            <span class="mfo-category-value-name">{$pagetitle}</span>
        </td>
    {/if}
    
    {if $_pls["tv.rate"] == 1}
        <td class="mfo-category-table-value" data-label="Ставка в день">до {$_pls["tv.rate"]}%</td>
        {else}
        <td class="mfo-category-table-value" data-label="Ставка в день">от {$_pls["tv.rate"]}%</td>
    {/if}
    
    {if $_pls["tv.time_range"]}
        <td class="mfo-category-table-value" data-label="Срок">
            {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"]])} - {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"],'get_max'=>1]) | decl:'дня|дней':true}
        </td>
    {/if}
    {if $_pls["tv.age_range"]}
        <td class="mfo-category-table-value" data-label="Возраст">
            {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.age_range"]]) | decl:'год|года|лет':true}
        </td>
    {/if}
    
    {*<td class="mfo-category-table-value" data-label="Переплата">22 837 руб.</td>
    {if $_pls["tv.referal_link"]}
        <td class="mfo-category-table-value" data-label=""><a class="btn btn-table" onclick="yaCounter55104013.reachGoal('{$_pls["tv.target"]}'); return true;" href="
        {'!pdoField' | snippet : [ 'id' => $_pls["794"], 'field' => 'referal_link' ]}" target="_blank" rel="nofollow">Подать заявку</a></td>
    {else}
        {if $_pls["tv.link_to_site"]}
            <td class="mfo-category-table-value" data-label=""><a class="btn btn-offer" onclick="yaCounter55104013.reachGoal('{$_pls["tv.target"]}'); return true;" href="https://{$_pls['tv.link_to_site']}" target="_blank" rel="nofollow">Подать заявку</a></td>
        {/if}
    {/if*}
    {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top' => 1]}
        <td class="mfo-category-table-value" data-label=""><a class="btn btn-table" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" href="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top' => 1]}" target="_blank" rel="nofollow">Подать заявку</a></td>
    {else}
        {if '!pdoField' | snippet : [ 'id' => $_modx->resource.794, 'field' => 'link_to_site']}
            <td class="mfo-category-table-value" data-label=""><a class="btn btn-offer" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" href="https://{'!pdoField' | snippet : [ 'id' => $_modx->resource.794, 'field' => 'referal_link']}" target="_blank" rel="nofollow">Подать заявку</a></td>
        {/if}
    {/if}
</tr>
