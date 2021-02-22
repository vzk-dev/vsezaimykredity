{if $is_slider}
<div class="swiper-slide">
{/if}
    <div class="offer">
        <a href="{$id | url}" class="offer__link">
            {if $_pls["tv.img"]}
                <picture>
                    <source srcset="{$_pls["tv.img"]}" type="image/webp" />
                    <img class="b-lazy best-offers__link-image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_pls["tv.img"] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                </picture>
            {/if}
            <h3 class="offer__title">{$pagetitle}</h3>
        </a>
        <div class="offer-property">
            {if $_pls["tv.limit_range"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Лимит до:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.limit_range"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {if $_pls["tv.grace_period"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Без %:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.grace_period"],'get_max'=>1]) | decl:'дня|дней':true}</div>
            </div>
            {/if}
            {if $_pls["tv.age_credit_cards_range"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Возраст:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.age_credit_cards_range"],'get_min'=>0]) | decl:'года|лет':true}</div>
            </div>
            {/if}
            {if $_pls["tv.persent_range"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Ставка:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.persent_range"],'get_min'=>0])}%</div>
            </div>
            {/if}
            
            {*Дебетовые карты*}
            {if $_pls["tv.debit_opening"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Открытие:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_opening"],'get_max'=>1]) | number : 0 : '.' : ' '} ₽</div>
            </div>
            {/if}
            {if $_pls["tv.debit_age"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Возраст:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
            </div>
            {/if}
            {if $_pls["tv.debit_cacheback"]}
            <div class="offer-property-row">
                <div class="offer-property__title">Кэшбэк:</div>
                <div class="offer-property__value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_cacheback"],'get_max'=>1])}%</div>
            </div>
            {/if}
        </div>

        {if $_pls["tv.referal_link"]}
            <a href="{$_pls["tv.referal_link"]}" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-offer">Оформить</a>
        {else}
            {if $_pls["tv.link_to_site"]}
                <a href="https://{$_pls["tv.link_to_site"]}" onclick="yaCounter70630705.reachGoal('link'); return true;" class="btn btn-card">Оформить</a>
            {/if}
        {/if}
        
    </div>
{if $is_slider}
</div>
{/if}