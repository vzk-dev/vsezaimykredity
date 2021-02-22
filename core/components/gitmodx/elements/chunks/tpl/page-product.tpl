<div class="row product-mobile">
            <div class="col col-md-8 col-lg-9">
                <div class="product-info">
                    <div class="product-name">{'!pdoField' | snippet : [ 'id' => $_modx->resource.id, 'field' => 'pagetitle', 'top'=>2]}</div>
                    {if '!pdoField' | snippet : [ 'id' => $_modx->resource.id, 'field' => 'license', 'top'=>2]}
                        <div class="product-lic">лиц.№{'!pdoField' | snippet : [ 'id' => $_modx->resource.id, 'field' => 'license', 'top'=>2]}</div>
                    {/if}
                    <div class="product-stars">
                        {$_modx->runSnippet('!ecThreadRating',[
                            'thread'=>'resource-'~$id
                        ])}
        
                        {var $rCount = $_modx->runSnippet('!ecMessagesCount',[
                            'thread'=> 'resource-'~$id
                        ])}
    
                        <span class="product-reviews">({$rCount} {$_modx->runSnippet('!plural',['n'=>$rCount])})</span>
                        
                    </div>
                </div>
                <div class="row mb-4 mt-4">
                    {*Кредитные карты возраст*}
                    {if $_pls["tv.age_credit_cards_range"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Возраст</div>
                        <div class="product-value">от {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.age_credit_cards_range,'get_min'=>0]) | decl:'года|лет':true}</div>
                    </div>
                    {/if}
                    {*Кредитные карты лимит*}
                    {if $_pls["tv.limit_range"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Кредитный лимит</div>
                        <div class="product-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.limit_range,'get_max'=>1]) | number : 0 : '.' : ' '} <i class="product-icon__rub"></i></div>
                    </div>
                    {/if}
                    {*Кредитные карты льготный период*}
                    {if $_pls["tv.grace_period"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Льготный период</div>
                        <div class="product-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.grace_period,'get_max'=>1]) | decl:'дня|дней':true}</div>
                    </div>
                    {/if}
                    {*Кредитные карты процентная ставка*}
                    {if $_pls["tv.persent_range"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Процентная ставка</div>
                        <div class="product-value">от {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.persent_range])}%</div>
                    </div>
                    {/if}
                    {*Дебетовые карты открытие*}
                    {if $_pls["tv.debit_opening"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Открытие</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.debit_opening,'get_min'=>0])} <i class="product-icon__rub"></i></div>
                    </div>
                    {/if}
                    {*Дебетовые карты возраст*}
                    {if $_pls["tv.debit_age"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Возраст</div>
                        <div class="product-value">от {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.debit_age,'get_min'=>0]) | decl:'года|лет':true}</div>
                    </div>
                    {/if}
                    {*Дебетовые карты кэшбэк, баллы, мили*}
                    {if $_pls["tv.debit_cacheback"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Кэшбэк</div>
                        <div class="product-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.debit_cacheback,'get_max'=>1])}%</div>
                    </div>
                    {elseif $_pls["tv.debit_mili"]}
                        <div class="col-6 col-lg-3 mb-2">
                            <div class="product-item">Мили</div>
                            <div class="product-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.debit_mili,'get_max'=>1])} миль</div>
                        </div>
                    {elseif $_pls["tv.debit_bonus"]}
                        <div class="col-6 col-lg-3 mb-2">
                            <div class="product-item">Бонусы</div>
                            <div class="product-value">до {$_pls["tv.debit_bonus"]}%</div>
                        </div>
                        {else}
                        {if $_pls["tv.debit_ball"]}
                            <div class="col-6 col-lg-3 mb-2">
                                <div class="product-item">Баллы</div>
                                <div class="product-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.debit_ball,'get_max'=>1]) | decl:'балл|баллов':true}</div>
                            </div>
                        {/if}
                    {/if}
                    {*Дебетовые карты процент на остаток*}
                    {if $_pls["tv.debit_balance"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Процент на остаток</div>
                        <div class="product-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.debit_balance,'get_max'=>1])}%</div>
                    </div>
                    {else}
                        {*Дебетовые карты документы*}
                        {if $_pls["tv.debit_documents"]}
                        <div class="col-6 col-lg-3 mb-2">
                            <div class="product-item">Документы</div>
                            <div class="product-value">{$_pls["tv.debit_documents"]}</div>
                        </div>
                        {/if}
                    {/if}
                    {*Кредит ставка*}
                    {if $_pls["tv.credit_percent"]}
                    <div class="col-6 col-sm-6 col-md-3 col-lg-3 mb-2">
                        <div class="product-item">Ставка от</div>
                        <div class="product-value"><span class="credit_calc_rate">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.credit_percent,'get_min'=>0])}</span>%</div>
                    </div>
                    {/if}
                    {*Кредит сумма*}
                    {if $_pls["tv.credit_summ"]}
                    <div class="col-6 col-sm-6 col-md-3 col-lg-3 mb-2">
                        <div class="product-item">Сумма до</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.credit_summ,'get_max'=>1]) | number : 0 : '.' : ' '} <i class="product-icon__rub"></i></div>
                    </div>
                    {/if}
                    {*Кредит срок*}
                    {if $_pls["tv.credit_time"]}
                    <div class="col-6 col-sm-6 col-md-3 col-lg-3 mb-2">
                        <div class="product-item">Срок до</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.credit_time,'get_max'=>1])} месяцев</div>
                    </div>
                    {/if}
                    {*Кредит возраст*}
                    {if $_pls["tv.credit_age"]}
                    <div class="col-6 col-sm-6 col-md-3 col-lg-3 mb-2">
                        <div class="product-item">Возраст от</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.credit_age,'get_min'=>0]) | decl:'года|лет':true}</div>
                    </div>
                    {/if}
                    {*Ипотека ставка*}
                    {if $_pls["tv.ipoteka_percent"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Ставка от</div>
                        <div class="product-value"><span class="ipoteka_calc_rate">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.ipoteka_percent,'get_min'=>0])}</span>%</div>
                    </div>
                    {/if}
                    {*Ипотека срок*}
                    {if $_pls["tv.ipoteka_time"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Срок до</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.ipoteka_time,'get_max'=>1])} месяцев</div>
                    </div>
                    {/if}
                    {*Ипотека возраст*}
                    {if $_pls["tv.ipoteka_age"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Возраст от</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.ipoteka_age,'get_min'=>0]) | decl:'года|лет':true}</div>
                    </div>
                    {/if}
                    {*Сумма сумма*}
                    {if $_pls["tv.ipoteka_summ"]}
                    <div class="col-6 col-lg-3 mb-2">
                        <div class="product-item">Сумма до</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.ipoteka_summ,'get_max'=>1]) | number : 0 : '.' : ' '} <i class="product-icon__rub"></i></div>
                    </div>
                    {/if}
                </div>
                {*Лейблочки*}
                {if $_pls["tv.label"]}
                <div class="row mb-4">
                    <div class="col-12">
                        {set $rows = json_decode($_modx->resource.label, true)}
                        {foreach $rows as $row}
                            <div class="product-bun">{$row.labeltext}</div>
                        {/foreach}
                    </div>
                </div>
                {/if}
                <div class="row mb-4">
                    {if $_modx->resource.template == 12}
                        <div class="col-5">
                            <a class="product-all" href="{$_modx->resource.parent | url}"><span class="product-back"></span>Все кредитные карты банка</a>
                        </div>
                    {/if}
                    {if $_modx->resource.template == 13}
                        <div class="col-5">
                            <a class="product-all" href="{$_modx->resource.parent | url}"><span class="product-back"></span>Все дебетовые карты банка</a>
                        </div>
                    {/if}
                    {if $_modx->resource.template == 16}
                        <div class="col-5">
                            <a class="product-all" href="{$_modx->resource.parent | url}"><span class="product-back"></span>Все кредиты банка</a>
                        </div>
                    {/if}
                    {if $_modx->resource.template == 21}
                        <div class="col-5">
                            <a class="product-all" href="{$_modx->resource.parent | url}"><span class="product-back"></span>Все ипотечные продукты банка</a>
                        </div>
                    {/if}
                </div>
            </div>
            {if $_modx->resource.template in [12,13]}
                <div class="col col-md-4 col-lg-3">
                    <div class="product-karta">
                        <picture>
                            <source srcset="{$_modx->resource.img}" type="image/webp" />
                            <img class="b-lazy product-image-karta" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_modx->resource.img}" alt="{$_modx->resource.longtitle}" />
                        </picture>
                        <div class="product-name-karta">{$_modx->resource.longtitle}</div>
                        {if $_modx->resource.referal_link}
                            <a class="btn btn-offer btn-offer-mobile" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" href="{$_modx->resource.referal_link}" target="_blank" rel="nofollow">Оформить карту</a>
                        {else}
                            {if $_modx->resource.link_to_site}
                                <a class="btn btn-offer btn-offer-mobile" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" href="https://{$_modx->resource.link_to_site}" target="_blank" rel="nofollow">Оформить карту</a>
                            {/if}
                        {/if}
                    </div>
                </div>
            {/if}
        </div>