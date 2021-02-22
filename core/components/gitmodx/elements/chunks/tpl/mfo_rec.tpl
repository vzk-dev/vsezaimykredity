<div class="mfo-popular-table-wrap">
    <table class="mfo-popular">
        <thead>
            <tr>
                <th>МФО</th>
                <th>Сумма</th>
                <th>Ставка в день</th>
                <th>Срок</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="mfo-popular-table-value"><a href="{$id | url}">
                    <picture>
                    <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}" type="image/webp" />
                        <img class="b-lazy mfo-popular-table__image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1] | phpthumbon : "w=250"}" alt="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>1]}" />
                    </picture></a>
                    <span class="mfo-popular-table-reg">Лицензия {'!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>1]}</span>
                    </td>
                <td class="mfo-popular-table-value" data-label="Сумма">
                    <div class="mfo-popular-table-summ"><a class="mfo-popular-table-summ__link" href="{$id | url}">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.summ_range"],'get_max'=>1]) | number : 0 : '.' : ' '} руб</a></div> <span class="mfo-popular-value-name">{$pagetitle}</span>
                </td>
                {if $_pls["tv.rate"] == 1}
                <td class="mfo-popular-table-value" data-label="Ставка в день">до {$_pls['tv.rate']}%</td>
                {else}
                <td class="mfo-popular-table-value" data-label="Ставка в день">от {$_pls['tv.rate']}%</td>
                {/if}
                <td class="mfo-popular-table-value" data-label="Срок">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"]])} - {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"],'get_max'=>1]) | declension:'дня|дней':true}</td>
                <td class="mfo-popular-table-value" data-label=""><a class="btn btn-offer" href="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top' => 1]}" target="_blank" rel="nofollow">Оформить</a>{*<span class="mfo-popular-table-reg">11 863 заявки</span>*}</td>
            </tr>
        </tbody>
    </table>
</div>