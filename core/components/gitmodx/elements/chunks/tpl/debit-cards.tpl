<div class="card-offer-bg mt-4">
    <div class="row">
        <div class="col-12 col-md-3 col-lg-2">
            {if $_pls["tv.img"]}
                <div class="card-offer__image">
                    <img class="" src="{$_pls["tv.img"]}" alt="{$pagetitle}">
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
                <div class="col-auto card-offer__bank">{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'pagetitle', 'top'=>2]}</div>
            </div>
            <div class="row">
                {if $_pls["tv.debit_balance"]}
                <div class="col-6 col-md-4 col-lg-3 mb-2">
                    <div class="card-offer-title">Процент на остаток</div>
                        <div class="card-offer-value card-offer-value--color">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_balance"],'get_max'=>1])}%</div>
                </div>
                {/if}
                {if $_pls["tv.debit_cacheback"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Кэшбэк</div>
                        <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_cacheback"],'get_max'=>1])}%</div>
                </div>
                {elseif $_pls["tv.debit_mili"]}
                    <div class="col-6 col-md-3 col-lg-2 mb-2">
                        <div class="card-offer-title">Мили</div>
                            <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_mili"],'get_max'=>1]) | decl:'миля|миль':true}</div>
                    </div>
                {elseif $_pls["tv.debit_bonus"]}
                    <div class="col-6 col-md-3 col-lg-2 mb-2">
                        <div class="card-offer-title">Бонусы</div>
                            <div class="card-offer-value">до {$_pls["tv.debit_bonus"]}%</div>
                    </div>
                    {else}
                    {if $_pls["tv.debit_ball"]}
                        <div class="col-6 col-md-3 col-lg-2 mb-2">
                            <div class="card-offer-title">Баллы</div>
                            <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_ball"],'get_max'=>1]) | decl:'балл|баллов':true}</div>
                        </div>
                    {/if}
                {/if}
                {if $_pls["tv.debit_age"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Возраст</div>
                    <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_age"],'get_min'=>0]) | decl:'года|лет':true}</div>
                </div>
                {/if}
                {if $_pls["tv.debit_opening"]}
                <div class="col-6 col-md-3 col-lg-2 mb-2">
                    <div class="card-offer-title">Открытие</div>
                    <div class="card-offer-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_pls["tv.debit_opening"],'get_min'=>0])} руб.</div>
                </div>
                {/if}
                <div class="col-12 col-md-6 col-lg-3 mb-2 credits-offet-button">
                {if $_pls["tv.referal_link"]}
                    <a href="{$_pls['tv.referal_link']}" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-card">Оформить карту</a>
                {else}
                    {if $_pls["tv.link_to_site"]}
                        <a href="https://{$_pls['tv.link_to_site']}" onclick="yaCounter70630705.reachGoal('link'); return true;" class="btn btn-card">Оформить карту</a>
                    {/if}
                {/if}
                </div>
            </div>
            <div class="row mt-lg-2 mt-md-0 mt-2">
                {*Лейблочки*}
                {if $_pls["tv.label"]}
                <div class="col-lg-9 mb-4">
                    <div class="col-12">
                        {set $rows = $_pls['tv.label']}
                        {foreach $rows as $row}
                            <div class="product-bun">{$row.labeltext}</div>
                        {/foreach}
                    </div>
                </div>
                {/if}
                <div class="col-md-3 col-lg-3 open open-expand">
                    Развернуть<span class="open-image"></span>
                </div>       
            </div>
        </div>
    </div>
    <div class="card-offer-details" style="display:none;">
        <div class="row">
            {if $_pls['tv.debit_cards_content']}
                {set $rows = $_pls['tv.debit_cards_content']}
                {foreach $rows as $row}
                    {if $row.active == 1}
                        <div class="col-md-6 col-lg-3 mb-2 card-offer-row">
                            <div class="card-offer-title card-offer-title--add">{$row.title}</div>
                            <div class="card-offer-value card-offer-value--add">{$row.text}</div>
                        </div>
                    {/if}
                {/foreach}
            {/if}
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
                    <a href="{$id | url}" class="btn btn-rating">Подробнее о карте</a>
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
            <div class="col-4 col-md-4 col-lg-3">
                <div class="legal-info">Лицензия №{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'license', 'top'=>2]}</div>
            </div>
        {/if}
            <div class="col-4 col-md-4 col-lg-3">
                <div class="legal-info">Обновлено {$editedon  | date : 'd.m.Y'}</div>
            </div>
            <div class="col-4 col-md-4 col-lg-6">
                <div class="close">
                    Свернуть<span class="close-image"></span>
                </div>
            </div>
        </div>
    </div>
</div>