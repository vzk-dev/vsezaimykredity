<div class="card-offer-bg mt-4">
    <div class="row">
        <div class="col-12 col-md-3 col-lg-2">
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}
                <div class="card-offer__image">
                    <picture>
                        <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}" type="image/webp" />
                        <img class="b-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>2] | phpthumbon : "w=250"}" alt="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>2]}"/>
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
                    {*<div class="open open-card">Еще 1<span class="open-image"></span></div>*}
                </div>
            </div>
        </div>
        <div class="col-12 col-md-9 col-lg-10">
            <div class="row mb-2 card-offer">
                <div class="col-auto card-offer__name"><a href="{$id | url}">{$pagetitle}</a></div>
                {*<div class="col-auto card-offer__bank">{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>2]}</div>*}
            </div>
            <div class="row">
                {if $_pls["tv.credit_summ"]}
                <div class="col-6 col-md-4 col-lg-3 mb-2">
                    <div class="card-offer-title">Сумма до</div>
                    <div class="card-offer-value card-offer-value--color">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_summ"],'get_max'=>1]) | number : 0 : '.' : ' '} руб.</div>
                </div>
                {/if}
                {if $_pls["tv.credit_age"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Возраст от</div>
                    <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_age"]]) | decl:'года|лет':true}</div>
                </div>
                {/if}
                {if $_pls["tv.credit_time"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Срок до</div>
                    <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_time"],'get_max'=>1])} мес.</div>
                </div>
                {/if}
                {if $_pls["tv.credit_percent"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Процент</div>
                    <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_percent"],'get_min'=>0])}%</div>
                </div>
                {/if}
                <div class="col col-md-6 col-lg-3 mb-2">
                    {if $_pls["tv.referal_link"]}
                    <a href="{$_pls['tv.referal_link']}" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-card">Оформить кредит</a>
                {else}
                    {if $_pls["tv.link_to_site"]}
                        <a href="https://{$_pls['tv.link_to_site']}" onclick="yaCounter70630705.reachGoal('link'); return true;" class="btn btn-card">Оформить кредит</a>
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
                <div class="col-md-3 col-lg-3 open open-expand">
                    Развернуть<span class="open-image"></span>
                </div>        
            </div>
        </div>
    </div>
    <div class="card-offer-details" style="display:none;">
        <div class="row card-line">
            {if $_pls['tv.credit_content']}
                {set $rows = $_pls['tv.credit_content']}
                {foreach $rows as $row}
                    {if $row.active == 1}
                        <div class="col-md-6 col-lg-4 mb-2 card-offer-row">
                            <div class="card-offer-title card-offer-title--add">{$row.title}</div>
                            <div class="card-offer-value card-offer-value--add">{$row.text}</div>
                        </div>
                    {/if}
                {/foreach}
            {/if}
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
                                <input class="credit_calc_summ calc-input-value" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_summ"],'get_max'=>1])}">
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-4">
                            <div class="calc-input">
                                <label class="calc-title">Срок</label>
                                <input class="credit_calc_days calc-input-value" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_time"],'get_max'=>1])}">
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-4">
                            <div class="calc-input">
                                <label class="calc-title">Процент</label>
                                <input class="credit_calc_rate calc-input-value" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_percent"],'get_min'=>0])}">
                            </div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-4 col-lg-4 mb-2 calc-result">
                            <div class="calc-result-title">Общая сумма</div>
                            <div class="calc-result-value"><span class="credit_calc_total"></span></div>
                        </div>
                        <div class="col-md-4 col-lg-4 mb-2 calc-result">
                            <div class="calc-result-title">Переплата</div>
                            <div class="calc-result-value"><span class="credit_calc_overpayment"></span></div>
                        </div>
                        <div class="col-md-4 col-lg-4 mb-2 calc-result">
                            <div class="calc-result-title">Ежемесячный платеж</div>
                            <div class="calc-result-value"><span class="credit_calc_monthly_payment"></span></div>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col mfo-text-min">*примерный расчет по минимальной ставке без учета комиссий</div>
                        <div class="calc-info"></div>
                    </div>
                </div>
            </div>
        </div>
        
        {*<div class="row mt-4">
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
                    <a href="{$id | url}" class="btn btn-rating">Подробнее о кредите</a>
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
        </div>*}
        
        <div class="row mt-4">
        {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>2]}
            <div class="col-4 col-md-4 col-lg-4">
                <div class="legal-info">Лицензия {'!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>2]}</div>
            </div>
        {/if}
            <div class="col-4 col-md-4 col-lg-3">
                <div class="legal-info">Обновлено {$editedon  | date : 'd.m.Y'}</div>
            </div>
            <div class="col-4 col-md-4 col-lg-5">
                <div class="close">
                    Свернуть<span class="close-image"></span>
                </div>
            </div>
        </div>
    </div>
</div>