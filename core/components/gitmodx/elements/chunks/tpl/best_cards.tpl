<div class="best-offers-inner">
    
        <a href="{$id | url}" class="best-offers__link">
            {if $_modx->resource.template in [18,12,13,14,32]}
                {if $_pls["tv.img"]}
                    <picture>
                        <source srcset="{$_pls["tv.img"]}" type="image/webp" />
                        <img class="b-lazy best-offers__link-image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_pls["tv.img"] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                    </picture>
                    {elseif '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}
                        <picture>
                            <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}" type="image/webp" />
                            <img class="b-lazy best-offers__link-image {if $_modx->resource.template == 18}best-offers__link-image-logo{/if}" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                        </picture>
                    {else}
                    {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}
                        <picture>
                            <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}" type="image/webp" />
                            <img class="b-lazy best-offers__link-image {if $_modx->resource.template == 18}best-offers__link-image-logo{/if}" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                        </picture>
                    {/if}
                {/if}
            {/if}
            {if $_modx->resource.template in [16,17,21,22]}
                {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}
                    <picture>
                        <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}" type="image/webp" />
                        <img class="b-lazy best-offers__link-image best-offers__link-image-logo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                    </picture>
                {/if}
            {/if}
            {*if $_pls["tv.img"]}
                <picture>
                    <source srcset="{$_pls["tv.img"]}" type="image/webp" />
                    <img class="b-lazy best-offers__link-image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_pls["tv.img"] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                </picture>
            {/if*}
            <h3 class="best-offers__title">{$pagetitle}</h3>
        </a>
        <div class="best-offers-property">
            {*МФО сумма*}
            {if $_pls["tv.summ_range"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Сумма до:</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.summ_range"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {*МФО возраст*}
            {if $_pls["tv.age_range"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Возраст от:</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.age_range"]]) | decl:'года|лет':true}</div>
            </div>
            {/if}
            {*МФО процентная ставка*}
            {if $_pls["tv.rate"]!}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Процент:</div>
                <div class="best-offers-property__value">{$_pls["tv.rate"]}%</div>
            </div>
            {/if}
            {*МФО срок*}
            {if $_pls["tv.time_range"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Срок до:</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"],'get_max'=>1]) | decl:'дня|дней':true}</div>
            </div>
            {/if}
            {*Кредитные карты сумма*}
            {if $_pls["tv.limit_range"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Сумма до:</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.limit_range"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {*Кредитные карты процентная ставка*}
            {if $_pls["tv.persent_range"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Процент:</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.persent_range"],'get_min'=>0])}%</div>
            </div>
            {/if}
            {*Кредитные карты возраст*}
            {if $_pls["tv.age_credit_cards_range"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Возраст от:</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.age_credit_cards_range"]]) | decl:'года|лет':true}</div>
            </div>
            {/if}
            {*Дебетовые карты открытие*}
            {if $_pls["tv.debit_opening"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Открытие:</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_opening"],'get_min'=>0])} ₽</div>
            </div>
            {/if}
            {*Дебетовые карты кэшбэк*}
            {if $_pls["tv.debit_cacheback"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Кэшбэк:</div>
                <div class="best-offers-property__value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_cacheback"],'get_max'=>1])}%</div>
            </div>
            {elseif $_pls["tv.debit_mili"]}
                <div class="best-offers-property-row">
                    <div class="best-offers-property__title">Мили:</div>
                    <div class="best-offers-property__value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_mili"],'get_max'=>1])} миль</div>
                </div>
                {else}
                    {if $_pls["tv.debit_ball"]}
                    <div class="best-offers-property-row">
                        <div class="best-offers-property__title">Баллы:</div>
                        <div class="best-offers-property__value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_ball"],'get_max'=>1])} баллов</div>
                    </div>
                    {/if}
            {/if}
            {*Дебетовые карты процент на остаток*}
            {if $_pls["tv.debit_balance"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">% на остаток:</div>
                <div class="best-offers-property__value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_balance"],'get_max'=>1])}%</div>
            </div>
            {/if}
            {*Кредит сумма*}
            {if $_pls["tv.credit_summ"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Сумма до</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_summ"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {*Кредит ставка*}
            {if $_pls["tv.credit_percent"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Ставка от</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_percent"],'get_min'=>0])}%</div>
            </div>
            {/if}
            {*Кредит срок*}
            {if $_pls["tv.credit_time"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Срок до</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_time"],'get_max'=>1])} мес.</div>
            </div>
            {/if}
            {*Кредит возраст*}
            {if $_pls["tv.credit_age"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Возраст от</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
            </div>
            {/if}
            {*Ипотека сумма*}
            {if $_pls["tv.ipoteka_summ"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Сумма до</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_summ"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {*Ипотека ставка*}
            {if $_pls["tv.ipoteka_percent"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Ставка от</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_percent"],'get_min'=>0])}%</div>
            </div>
            {/if}
            {*Ипотека срок*}
            {if $_pls["tv.ipoteka_time"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Срок до</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_time"],'get_max'=>1])} мес.</div>
            </div>
            {/if}
            {*Ипотека возраст*}
            {if $_pls["tv.ipoteka_age"]}
            <div class="best-offers-property-row">
                <div class="best-offers-property__title">Возраст от</div>
                <div class="best-offers-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
            </div>
            {/if}
        </div>
        <div class="best-offers-info">
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'phone', 'top'=>2]}
                <div class="best-offers-info__value"><a class="best-offers-info__link" href="tel:{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'phone', 'top'=>2]|tel}">{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'phone', 'top'=>2]}</a></div>
            {/if}
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'phone', 'top'=>1]}
                <div class="best-offers-info__value"><a class="best-offers-info__link" href="tel:{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'phone', 'top'=>1]|tel}">{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'phone', 'top'=>1]}</a></div>
            {/if}
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>2]}
                <div><a class="best-offers-info__link" href="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'uri', 'top'=>2]}">{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>2]}</a></div>
            {/if}
        </div>
        
        <div class="best-offers-info">
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>2]}
                <div class="best-offers-info__value">Лицензия №{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>2]}</div>
            {/if}
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>1]}
                <div>Лицензия №{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>1]}</div>
            {/if}
            {*<div>34 543 заявок</div>*}
        </div>
        
        <div class="offer-btn">
            {if $_pls["tv.referal_link"]}
            <a href="{$_pls["tv.referal_link"]}" class="btn btn-offer__arrange">Оформить</a>
            {else}
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top'=>1]}
                <a class="btn btn-offer__arrange" href="tel:{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top'=>1]}">Оформить</a>
            {/if}
            {/if}
            <a href="{$id | url}" class="btn btn-offer__more">Подробнее</a>
        </div>
    </div>