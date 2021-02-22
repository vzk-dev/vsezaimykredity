{if $is_slider}
<div class="swiper-slide">
{/if}
    <div class="offer">
        <a href="{$id | url}" class="offer__link">
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}
                <picture>
                    <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1]}" type="image/webp" />
                    <img class="b-lazy best-offers__link-image best-offers__link-image-logo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>1] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                </picture>
            {/if}
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}
                <picture>
                    <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}" type="image/webp" />
                    <img class="b-lazy best-offers__link-image best-offers__link-image-logo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                </picture>
            {/if}
            <h3 class="offer__title">{$pagetitle}</h3>
        </a>

        <div class="offer-property">
            {*Данные для МФО*}
            {if $_pls["tv.summ_range"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Сумма до:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.summ_range"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {if $_pls["tv.rate"]!}
            <div class="offer-property-row">
                <div class="offer-property__title">Процент:</div>
                <div class="offer-property__value">{$_pls["tv.rate"]}%</div>
            </div>
            {/if}
            {if $_pls["tv.time_range"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Срок до:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.time_range"],'get_max'=>1]) | decl:'дня|дней':true}</div>
            </div>
            {/if}
            {if $_pls["tv.age_range"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Возраст от:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.age_range"],'get_min'=>0]) | decl:'года|лет':true}</div>
            </div>
            {/if}
            
            {*Данные для кредита*}
            {if $_pls["tv.credit_summ"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Сумма до:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_summ"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {if $_pls["tv.credit_percent"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Процент:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_percent"],'get_min'=>0])}%</div>
            </div>
            {/if}
            {if $_pls["tv.credit_time"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Срок до:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_time"],'get_max'=>1]) | decl:'дня|дней':true}</div>
            </div>
            {/if}
            {if $_pls["tv.credit_age"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Возраст от:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
            </div>
            {/if}
            
            {*Данные для ипотеки*}
            {if $_pls["tv.ipoteka_summ"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Сумма до:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_summ"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {if $_pls["tv.ipoteka_percent"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Процент:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_percent"],'get_min'=>0])}%</div>
            </div>
            {/if}
            {if $_pls["tv.ipoteka_time"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Срок до:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_time"],'get_max'=>1]) | decl:'дня|дней':true}</div>
            </div>
            {/if}
            {if $_pls["tv.ipoteka_age"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Возраст от:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
            </div>
            {/if}
        </div>
        
        
        {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top'=>1]}
            <a href="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'referal_link', 'top'=>1]}" target="_blank" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-offer">Оформить</a>
        {elseif $_pls["tv.referal_link"]}
            <a href="{$_pls["tv.referal_link"]}" target="_blank" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-offer">Оформить</a>
        {elseif $_pls["tv.link_to_site"]}
            <a href="//{$_pls["tv.link_to_site"]}" target="_blank" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-offer">Оформить</a>
        {else}
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'link_to_site', 'top'=>1]}
                <a href="//{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'link_to_site', 'top'=>1]}" target="_blank" onclick="yaCounter70630705.reachGoal('link'); return true;" class="btn btn-card">Оформить</a>
            {/if}
        {/if}
        
        
        
    </div>
{if $is_slider}
</div>
{/if}
