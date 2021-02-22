<div class="row mt-4 credits-offer-bg">
    <div class="col-12 col-md-3 col-lg-2">
        {if $_modx->resource.template in [14,32]}
            {if $_pls["tv.img"]}
                <picture>
                    <source srcset="{$_pls["tv.img"]}" type="image/webp" />
                    <img class="b-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_pls["tv.img"] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                </picture>
            {/if}
        {/if}
        {if $_modx->resource.template in [17,22]}
            {if '!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}
                <picture>
                    <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}" type="image/webp" />
                    <img class="b-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2] | phpthumbon : "w=270"}" alt="{$pagetitle}" />
                </picture>
            {/if}
        {/if}
        <div class="credits-offer-name">{$_modx->resource.parent|resource:"pagetitle"}</div>
        <div class="credits-offer-stars">
            {$_modx->runSnippet('!ecThreadRating',[
                'thread'=>'resource-'~$id
            ])}
            
            {var $rCount = $_modx->runSnippet('!ecMessagesCount',[
                'thread'=> 'resource-'~$id
            ])}
            
            <span class="card-offer-stars__reviews">(<a href="{$id | url}#reviews" class="card-offer-stars__reviews-color">{$rCount} {$_modx->runSnippet('!plural',['n'=>$rCount])}</a>)</span>
        </div>
    </div>
    <div class="col-12 col-md-9 col-lg-10">
        <div class="row align-items-center">
            <div class="col-md-5 col-lg-3 mb-md-3 mb-lg-0 credits-offer-mobile">
                <div class="credits-offer-title"><a href="{$id | url}" class="credits-offer__link">
                    {if $_modx->resource.template == 32}Кредитная карта "{$pagetitle}"
                        {elseif $_modx->resource.template == 14}Дебетовая карта "{$pagetitle}"
                        {else}
                        {$pagetitle}
                    {/if}</a>
                </div>
                {if $_pls["tv.credit_percent"]}
                    <div class="credits-offer-value">Ставка {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_percent"],'get_min'=>0])}%</div>
                {/if}
                {if $_pls["tv.ipoteka_percent"]}
                    <div class="credits-offer-value">Ставка {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_percent"],'get_min'=>0])}%</div>
                {/if}
            </div>
            {*Кредитные карты сумма*}
            {if $_pls["tv.limit_range"]}
                <div class="col-md-6 col-lg-3 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Сумма до</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.limit_range"],'get_max'=>1]) | number : 0 : '.' : ' '} руб.</div>
                </div>
            {/if}
            {*Кредитные карты ставка*}
            {if $_pls["tv.persent_range"]}
                <div class="col-md-3 col-lg-2 credits-offer-mobile">
                    <div class="credits-offer-title">Ставка от</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.persent_range"],'get_min'=>0])}%</div>
                </div>
            {/if}
            {*Кредитные карты возраст*}
            {if $_pls["tv.age_credit_cards_range"]}
                <div class="col-md-3 col-lg-2 credits-offer-mobile">
                    <div class="credits-offer-title">Возраст от</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.age_credit_cards_range"]]) | decl:'года|лет':true}</div>
                </div>
            {/if}
            {*Дебетовые карты возраст*}
            {if $_pls["tv.debit_age"]}
                <div class="col-md-3 col-lg-2 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Возраст</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
                </div>
            {/if}
            {*Дебетовые карты кэшбэк, баллы, мили*}
            {if $_pls["tv.debit_cacheback"]}
                <div class="col-md-3 col-lg-2 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Кэшбэк</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_cacheback"],'get_max'=>1])}%</div>
                </div>
                {elseif $_pls["tv.debit_mili"]}
                <div class="col-md-3 col-lg-2 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Мили</div>
                    <div class="credits-offer-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_mili"],'get_max'=>1]) | decl:'мили|миль':true}</div>
                </div>
                {elseif $_pls["tv.debit_bonus"]}
                <div class="col-md-3 col-lg-2 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Бонусы</div>
                    <div class="credits-offer-value">до {$_pls["tv.debit_bonus"]}%</div>
                </div>
                {else}
                {if $_pls["tv.debit_ball"]}
                    <div class="col-md-3 col-lg-2 mb-md-3 mb-lg-0 credits-offer-mobile">
                        <div class="credits-offer-title">Баллы</div>
                        <div class="credits-offer-value">до {$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_ball"],'get_max'=>1]) | decl:'балла|баллов':true}</div>
                    </div>
                {/if}
            {/if}
            {*Дебетовые карты процент на остаток*}
            {if $_pls["tv.debit_balance"]}
                <div class="col-md-4 col-lg-2 credits-offer-mobile">
                    <div class="credits-offer-title">% на остаток</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_balance"],'get_max'=>1])}%</div>
                </div>
            {/if}
            {*Кредит сумма*}
            {if $_pls["tv.credit_summ"]}
                <div class="col-md-4 col-lg-3 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Сумма до</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_summ"],'get_max'=>1]) | number : 0 : '.' : ' '} руб.</div>
                </div>
            {/if}
            {*Кредит возраст*}
            {if $_pls["tv.credit_age"]}
                <div class="col-md-3 col-lg-2 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Возраст от</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
                </div>
            {/if}
            {*Кредит срок*}
            {if $_pls["tv.credit_time"]}
                <div class="col-md-3 col-lg-2 credits-offer-mobile">
                    <div class="credits-offer-title">Срок до</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.credit_time"],'get_max'=>1])} мес.</div>
                </div>
            {/if}
            {*Ипотека сумма*}
            {if $_pls["tv.ipoteka_summ"]}
                <div class="col-md-6 col-lg-3 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Сумма до</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_summ"],'get_max'=>1]) | number : 0 : '.' : ' '} руб.</div>
                </div>
            {/if}
            {*Ипотека возраст*}
            {if $_pls["tv.ipoteka_age"]}
                <div class="col-md-3 col-lg-2 mb-md-3 mb-lg-0 credits-offer-mobile">
                    <div class="credits-offer-title">Возраст от</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
                </div>
            {/if}
            {*Ипотека срок*}
            {if $_pls["tv.ipoteka_time"]}
                <div class="col-md-3 col-lg-2 credits-offer-mobile">
                    <div class="credits-offer-title">Срок до</div>
                    <div class="credits-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.ipoteka_time"],'get_max'=>1])} мес.</div>
                </div>
            {/if}
            {*Кнопки оформить*}
            {if $_pls["tv.referal_link"]}
            <div class="col-md-6 col-lg-2 credits-offer-mobile credits-offet-button">
                <a class="btn btn-table" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" href="{$_pls["tv.referal_link"]}" target="_blank" rel="nofollow">Оформить</a>
                </div>
            {else}
                {if $_pls["tv.link_to_site"]}
                <div class="col-md-6 col-lg-2 credits-offer-mobile credits-offet-button">
                    <a class="btn btn-offer" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" href="https://{$_pls["tv.link_to_site"]}" target="_blank" rel="nofollow">Оформить</a>
                    </div>
                {/if}
            {/if}
        </div>
        
        <div class="row mt-3">
            {if $_pls["tv.label"]}
                <div class="col-md-8 col-lg-10">
                    {set $rows = $_pls["tv.label"]}
                    {foreach $rows as $row}
                        <div class="credits-offer-bun">{$row.labeltext}</div>
                    {/foreach}
                </div>
            {/if}
            {if $_modx->resource.template == 32}
            <div class="col-md-4 col-lg-2 open open-expand">Развернуть<span class="open-image"></span></div>
            {/if}
        </div>
    </div>
    <div class="col card-offer-details" style="display:none;">
        {if $_modx->resource.template == 32}
            <div class="tabs">
                <div class="tabs__nav">
                    <button class="tabs__nav-btn active" type="button" data-tab="#tab_1_{$id}">Условия</button>
                    <button class="tabs__nav-btn" type="button" data-tab="#tab_2_{$id}">Комиссия</button>
                    <button class="tabs__nav-btn" type="button" data-tab="#tab_3_{$id}">Требования</button>
                </div>
                <div class="tabs__content">
                    <div class="tabs__item active" id="tab_1_{$id}">
                        {if $_pls['tv.credit_cards_usloviya']}
                            {set $rows = $_pls['tv.credit_cards_usloviya']}
                            {foreach $rows as $row}
                        		{if $row.active == 1}
                        			<div class="terms">
                                        <div class="terms-title">{$row.title}</div>
                                        <div class="terms-value">{$row.text}</div>
                                    </div>
                        		{/if}
                        	{/foreach}
                        {/if}
                    </div>
        
                    <div class="tabs__item" id="tab_2_{$id}">
                        {if $_pls['tv.credit_cards_kom']}
                            {set $rows = $_pls['tv.credit_cards_kom']}
                            {foreach $rows as $row}
                        		{if $row.active == 1}
                        			<div class="terms">
                                        <div class="terms-title">{$row.title}</div>
                                        <div class="terms-value">{$row.text}</div>
                                    </div>
                        		{/if}
                        	{/foreach}
                        {/if}
                    </div>
        
                    <div class="tabs__item" id="tab_3_{$id}">
                        {if $_pls['tv.credit_cards_trebovaniya']}
                            {set $rows = $_pls['tv.credit_cards_trebovaniya']}
                            {foreach $rows as $row}
                        		{if $row.active == 1}
                        			<div class="terms">
                                        <div class="terms-title">{$row.title}</div>
                                        <div class="terms-value">{$row.text}</div>
                                    </div>
                        		{/if}
                        	{/foreach}
                        {/if}
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>