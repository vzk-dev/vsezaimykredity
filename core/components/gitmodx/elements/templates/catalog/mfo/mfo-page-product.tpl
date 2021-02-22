{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}

<div class="container-main">
    
        {'!pdoCrumbs' | snippet : [
            'to' => $_modx->id,
            'showHome' => 1,
            'tpl' => 'bread_tpl',
            'tplWrapper' => 'bread_tplWrapper',
            'tplCurrent' => 'bread_tplCurrent'
        ]}
        
        <div class="product-title">
            <h1 class="product-name">{$_modx->resource.parent | resource: 'pagetitle'} ({$_modx->resource.pagetitle})</h1>
            <img class="product-image__logo" src="{$_modx->resource.parent | resource: 'img'}" alt="{$_modx->resource.parent | resource: 'pagetitle'}">
        </div>
        <div class="row">
            <div class="col col-md-12 col-lg-12">
                <div class="row">
                    <div class="col-6 col-sm-6 col-md-2 col-lg-2 mb-2">
                        <div class="product-item">Ставка от</div>
                        <div class="product-value"><span class="calc_rate">{$_modx->resource.rate}</span>%</div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-4 col-lg-3 mb-2">
                        <div class="product-item">Сумма</div>
                        <div class="product-value">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.summ_range]) | number : 0 : '.' : ' '}-{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.summ_range,'get_max'=>1]) | number : 0 : '.' : ' '} <i class="product-icon__rub"></i></div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-3 col-lg-2 mb-2">
                        <div class="product-item">Срок</div>
                        <div class="product-value">{$_modx->resource.time_range} дней</div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-3 col-lg-2 mb-2">
                        <div class="product-item">Возраст</div>
                        <div class="product-value">{$_modx->resource.age_range} лет</div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-3 mb-2">
                        <div class="col product-btn">
                            
                            {if $_modx->resource.parent | resource: 'referal_link'}
                                <a class="btn btn-offer btn-offer-mobile" href="{$_modx->resource.parent | resource: 'referal_link'}" rel="nofollow" target="_blank">Оформить займ</a>
                                {*<span class="product-bid product-bid-mobile"></span> <span class="product-bid-mobile">{$_modx->runSnippet('!bid',['n'=>'.product-bid'])}</span>*}
                            {else}
                                <a class="btn btn-offer btn-offer-mobile" href="https://{$_modx->resource.parent | resource: 'link_to_site'}" rel="nofollow" target="_blank">Оформить займ</a>
                                {*<span class="product-bid product-bid-mobile"></span>*}
                            {/if}
                        </div>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col">
                        {set $rows = json_decode($_modx->resource.label, true)}
                        {foreach $rows as $row}
                            <div class="product-bun">{$row.labeltext}</div>
                        {/foreach}
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col">
                        <a class="product-all" href="{$_modx->resource.parent | url}">Все предложения МФО</a>
                    </div>
                </div>
            </div>
        </div>
        <h2 class="page-title">Калькулятор переплаты</h2>
        <div class="calc">
            <div class="row mb-4">
                <div class="col-md-6 col-lg-6">
                    <div class="calc-input">
                        <label class="calc-title">Сумма займа</label>
                        <input id="calc_summ" class="calc_summ calc-input-value" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.summ_range])}">
                        <!--input type="range" min="{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.summ_range])}" max="{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.summ_range,'get_max'=>1])}"-->
                        <div class="calc-range">
                            <div class="min-range">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.summ_range]) | number : 0 : '.' : ' '} руб.</div>
                            <div class="max-range">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.summ_range,'get_max'=>1]) | number : 0 : '.' : ' '} руб.</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="calc-input">
                        <label class="calc-title">Срок займа</label>
                        <input id="calc_days" class="calc_days calc-input-value" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.time_range])}">
                        <div class="calc-range">
                            <div class="min-range">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.time_range]) | number : 0 : '.' : ' ' | decl:'день|дня|дней':true}</div>
                            <div class="max-range">{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.time_range,'get_max'=>1]) | number : 0 : '.' : ' ' | decl:'день|дня|дней':true}</div>
                        </div>
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
        <h2 class="page-title">Подробные условия</h2>
        
        <div class="tabs">
            <div class="tabs__nav">
                <button class="tabs__nav-btn" type="button" data-tab="#tab_1_{$_modx->resource.id}">Условия</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_2_{$_modx->resource.id}">Выдача и погашение</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_3_{$_modx->resource.id}">Требования</button>
            </div>
            <div class="tabs__content">
                <div class="tabs__item" id="tab_1_{$_modx->resource.id}">
                    {include 'mfo_usloviya'}
                </div>
    
                <div class="tabs__item" id="tab_2_{$_modx->resource.id}">
                    {include 'paysystems_content'}
                </div>
    
                <div class="tabs__item" id="tab_3_{$_modx->resource.id}">
                    {include 'demands'}
                </div>
            </div>
        </div>
        


<div class="ground arrange-repay pt-5 pb-4">
    <div class="container-main">
        <div class="row">
            <div class="col-12 col-md-6 mb-4">
                <div class="product-services-category product-services-category--arrange">
                    <div class="product-services-title">Как оформить займ?</div>
                    <div class="product-services-list">
                        <ol>
                            <li>Создать или войти в личный кабинет на сайте <a href="{$_modx->resource.parent | resource: 'referal_link'}" class="product-services-link" target="_blank" rel="nofollow">{$_modx->resource.parent | resource: 'pagetitle'}</a> </li>
                            <li>Заполнить анкету</li>
                            <li>Пройти процедуру идентификации</li>
                            <li>Дождаться положительного решения</li>
                            <li>Заключить договор</li>
                            <li>Получить необходимую сумму займа</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 mb-4">
                <div class="product-services-category product-services-category--repay">
                    <div class="product-services-title">Как погасить займ?</div>
                    <div class="product-services-list">
                        <ol>
                            <li>Уточнить сумму платежа в личном кабинете {$_modx->resource.parent | resource: 'pagetitle'}</li>
                            <li>Выбрать удобный способ оплаты из доступных</li>
                            <li>Перечислить средтсва на счет {$_modx->resource.parent | resource: 'pagetitle'}</li>
                        </ol>
                        <span class="product-info-note">* При необходимости продлить срок выплаты займа.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<section>
        <div class="container-main">
            <div id="reviews"></div>
    		{$_modx->runSnippet('!ecMessages',[
    			'tpl'=>'tpl.ecMessages.RowCustom',
    			'toPlaceholder'=>'reviewList'
    		])}
    		{if $_modx->getPlaceholder('reviewList')}
    			<div  class="title-reviews" >
                    <h3 class="page-title-reviews">Отзывы о МФО {$_modx->resource.parent | resource: 'pagetitle'} ({$_modx->resource.pagetitle})</h3>
                    {*<a href="#" class="btn btn-offer__reviews">Оставить отзыв</a>*}
                </div>
    			{$_modx->getPlaceholder('reviewList')}
    		{/if}
    	
    		{*<div class="h2">Оставить отзыв</div>
    		{$_modx->runSnippet('!ecForm',[
    			'tplForm'=>'tpl.ecFormCustom',
    			'tplSuccess'=> 'tpl.ecForm.SuccessCustom'
    		])*}
        </div>
    </section>
<section>
    <div class="container-main">
		<h2 class="page-title">Рекомендуем по еще</h2>
        {'!pdoPage' | snippet : [
            'groupby'=>'modResource.parent',
            'parents' => 0,
    		'resources' => '-' ~ $_modx->resource.parent,
    		'tpl' => 'mfo_rec',
    		'limit' => 10,
            'includeTVs' => $_modx->getChunk('microloans_tvs'),
    		'sortby' => 'RAND()',
    		'where' => '{"template":"5"}',
    	]}
    </div>
</section>
	
{/block}
{block 'before_footer'}{/block}