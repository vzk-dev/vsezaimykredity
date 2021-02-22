<div class="card-offer-bg mt-4" data-mod-id="{$id}"  data-mod-parent-id="{$parent}">
    <div class="row">
        <div class="col-12 col-md-3 col-lg-2">
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}
                <div class="card-offer__image">
                    <picture>
                        <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}" type="image/webp" />
                        <img class="b-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}" alt="{$pagetitle}" />
                    </picture>
                </div>
            {/if}
            <div class="mt-2 mb-2">
                <div class="card-offer-item">
                    <div class="card-offer-stars">
                        {$_modx->runSnippet('!ecThreadRating',[
                        'thread'=>'resource-'~$id
                        ])}
                        {var $rCount = $_modx->runSnippet('!ecMessagesCount',[
                        'thread'=> 'resource-'~$id
                        ])}
                        <span class="card-offer-stars__reviews"><a href="{$id | url}#reviews" class="card-offer-stars__reviews-color">{$rCount} {$_modx->runSnippet('!plural',['n'=>$rCount])}</a></span>
                    </div>
                    {var $otherCount = $_modx->runSnippet('!count',[
                        'parents' => $parent,
                        'depth' =>0,
                        ])-1}
                    {if $otherCount}
                    <div class="open-card open-card_get-other-cards arrow" data-mod-parent-id="{$parent}">
                        <div class="arrow-text arrow-block">Ещё {$otherCount} {$_modx->runSnippet('!bid',[
                        'n'=> $otherCount,
                        'word1' => 'тариф',
                        'word2' => 'тарифа',
                        'word5' => 'тарифов',
                        ])}
                        <span class="arrow-left"></span><span class="arrow-right"></span>
                        </div>
                        
                    </div>
                    {/if}
                </div>
            </div>
        </div>
        <div class="col-12 col-md-9 col-lg-10">
            <div class="row mb-2 card-offer">
                <div class="col-auto card-offer__name"><a href="{$id | url}">{$pagetitle}</a></div>
                <div class="col-auto card-offer__bank"><a href="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'uri', 'top'=>1]}">{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>1]}</a></div>
            </div>
            <div class="row">
                {if $_pls["tv.summ_range"]}
                <div class="col-6 col-md-4 col-lg-3 mb-2">
                    <div class="card-offer-title">Сумма до</div>
                    <div class="card-offer-value card-offer-value--color">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.summ_range"],'get_max'=>1]) | number : 0 : '.' : ' '} руб.</div>
                </div>
                {/if}
                {if $_pls["tv.age_range"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Возраст от</div>
                    <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.age_range"]]) | decl:'года|лет':true}</div>
                </div>
                {/if}
                {if $_pls["tv.time_range"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Срок до</div>
                    <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"],'get_max'=>1]) | decl:'дня|дней':true}</div>
                </div>
                {/if}
                {if $_pls["tv.rate"]!}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Процент в день</div>
                    <div class="card-offer-value">{$_pls["tv.rate"]}%</div>
                </div>
                {/if}
                <div class="col col-md-6 col-lg-3 mb-2">
                    {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top'=>1]}
                        <a href="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top'=>1]}" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-card">Оформить займ</a>
                    {else}
                        {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'link_to_site', 'top'=>1]}
                            <a href="https://{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'link_to_site', 'top'=>1]}" onclick="yaCounter70630705.reachGoal('link'); return true;" class="btn btn-card">Оформить займ</a>
                        {/if}
                    {/if}
                </div>
            </div>
            <div class="row mt-lg-2 mt-md-0 mt-2">
                {if $_pls["tv.probability_of_approval"] >= 0 and $_pls["tv.probability_of_approval"] <= 50}
                    <div class="col-md-6 col-lg-6">
                        <div class="card-offer-text">Процент одобрения заявок по статистике сайта
                        </div>
                        <div class="card-offer-approval"> {*другие цвета: --color-yellow и --color-green *}
                            <div class="card-offer-approval__progress card-offer-approval__progress--color-red" style="width: {$_pls["tv.probability_of_approval"]}%;"></div>
                            <div class="card-offer-approval__progress-value" style="margin-left: {$_pls["tv.probability_of_approval"]}%;">{$_pls["tv.probability_of_approval"]}%</div>
                        </div>
                    </div>
                {elseif $_pls["tv.probability_of_approval"] >= 51 and $_pls["tv.probability_of_approval"] <= 79}
                    <div class="col-md-6 col-lg-6">
                        <div class="card-offer-text">Процент одобрения заявок по статистике сайта
                        </div>
                        <div class="card-offer-approval"> {*другие цвета: --color-yellow и --color-green *}
                            <div class="card-offer-approval__progress card-offer-approval__progress--color-yellow" style="width: {$_pls["tv.probability_of_approval"]}%;"></div>
                            <div class="card-offer-approval__progress-value" style="margin-left: {$_pls["tv.probability_of_approval"]}%;">{$_pls["tv.probability_of_approval"]}%</div>
                        </div>
                    </div>
                {else}
                    <div class="col-md-6 col-lg-6">
                        <div class="card-offer-text">Процент одобрения заявок по статистике сайта
                        </div>
                        <div class="card-offer-approval"> {*другие цвета: --color-yellow и --color-green *}
                            <div class="card-offer-approval__progress card-offer-approval__progress--color-green" style="width: {$_pls["tv.probability_of_approval"]}%;"></div>
                            <div class="card-offer-approval__progress-value" style="margin-left: {$_pls["tv.probability_of_approval"]}%;">{$_pls["tv.probability_of_approval"]}%</div>
                        </div>
                    </div>
                {/if}
                {if $_pls["tv.credit_rating"]}
                <div class="col-md-3 col-lg-3">
                    <div class="card-offer-text-rating">Требуемый кредитный рейтинг {$_pls["tv.credit_rating"]}</div>
                </div>
                {/if}
                <div class="col-md-4 col-lg-3 open open-expand">
                    Развернуть<span class="open-image"></span>
                </div>    
            </div>
        </div>
    </div>
    <div class="card-offer-details" style="display:none;">
        <div class="row card-line">
    
            {if $_pls['tv.card_content']}
                {set $rows = $_pls['tv.card_content']}
                {foreach $rows as $row}
                    {if $row.active == 1}
                        <div class="col-md-6 col-lg-3 mb-2 card-offer-row">
                            <div class="card-offer-title card-offer-title--add">{$row.title}</div>
                            <div class="card-offer-value card-offer-value--add">{$row.text}</div>
                        </div>
                    {/if}
                {/foreach}
            {/if}
            
            <div class="col-12 col-md-6 col-lg-6 mb-2">
                {if $_pls['tv.paysystems']}
                <div class="card-offer-title">Способы получения</div>
                <div class="card-offer-value">
                    {'!listExplodeTV'|snippet:[
                    'id' => $id,
                    'tv' => 'paysystems',
                    'tpl' => 'listTvPaysystems'
                    ]}
                </div>
                {/if}
            </div>
            <div class="col-12 col-md-6 col-lg-6 mb-2">
                {if $_pls['tv.paysystems_voz']}
                <div class="card-offer-title">Способы выплаты</div>
                <div class="card-offer-value">
                    {'!listExplodeTV'|snippet:[
                    'id' => $id,
                    'tv' => 'paysystems_voz',
                    'tpl' => 'listTvPaysystems'
                    ]}
                </div>
                {/if}
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <div class="card-title">Калькулятор</div>
                <div class="card-desc">Узнайте сразу, сколько Вы переплатите в компании</div>
                <div class="calc calc-total">
                    <div class="row mb-4">
                        <div class="col-md-4 col-lg-4">
                            <div class="calc-input">
                                <label class="calc-title">Сумма</label>
                                <input class="calc_summ calc-input-value" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.summ_range"],'get_max'=>1])}">
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-4">
                            <div class="calc-input">
                                <label class="calc-title">Срок</label>
                                <input class="calc_days calc-input-value" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"],'get_max'=>1])}">
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-4">
                            <div class="calc-input">
                                <label class="calc-title">Процент</label>
                                <input class="calc_rate calc-input-value" type="text" value="{$_pls["tv.rate"]}">
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-4 col-lg-4 mb-2 calc-result">
                            <div class="calc-result-title">К возврату</div>
                            <div class="calc-result-value"><span class="calc_return"></span></div>
                        </div>
                        <div class="col-md-4 col-lg-4 mb-2 calc-result">
                            <div class="calc-result-title">Переплата по процентам</div>
                            <div class="calc-result-value"><span class="calc_overpayment"></span></div>
                        </div>
                        <div class="col-md-4 col-lg-4 mb-2 calc-result">
                            <div class="calc-result-title">Переплата в день</div>
                            <div class="calc-result-value"><span class="calc_overpayment_at_day"></span></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col mfo-text-min">*примерный расчет по минимальной ставке без учета комиссий</div>
                        <div class="calc-info"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <div class="card-title">Рейтинг</div>
            </div>
            {if $_pls['tv.rating']}
                {set $rows = $_pls['tv.rating']}
                {foreach $rows as $row}
                    <div class="col-12 col-md-6 col-lg-3 mb-3">
                        <div class="rating">
                            <div class="rating__title">{$row.rtitle}</div>
                            <div class="rating__value">{$row.rtext}/10</div>
                        </div>
                    </div>
                {/foreach}
            {/if}
            <div class="col-12 col-md-6 col-lg-3 mb-3">
                <div class="rating">
                    <a href="{$id | url}" class="btn btn-rating">Подробнее о займе</a>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12 col-md-6 col-lg-6">
                {if $_pls['tv.plus']}
                {set $rows = $_pls['tv.plus']}
                <div class="card-title">Преимущества</div>
                <ul class="plus">
                    {foreach $rows as $row}
                    <li>{$row.plus1}</li>
                    {/foreach}
                </ul>
                {/if}
            </div>
            <div class="col-12 col-md-6 col-lg-6">
                {if $_pls['tv.minus']}
                {set $rows = $_pls['tv.minus']}
                <div class="card-title">Недостатки</div>
                <ul class="minus">
                    {foreach $rows as $row}
                    <li>{$row.minus}</li>
                    {/foreach}
                </ul>
                {/if}
            </div>
        </div>
        <div class="row mt-4">
        {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>1]}
            <div class="col-4 col-md-4 col-lg-4">
                <div class="legal-info">Лицензия {'!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>1]}</div>
            </div>
        {/if}
            <div class="col-4 col-md-4 col-lg-3">
                <div class="legal-info">Обновлено [[+phx:input=`-4 day`:strtotime:date=`%d.%m.%Y`]]</div>
            </div>
            <div class="col-4 col-md-4 col-lg-5">
                <div class="close">
                    Свернуть<span class="close-image"></span>
                </div>
            </div>
        </div>
    </div>
</div>