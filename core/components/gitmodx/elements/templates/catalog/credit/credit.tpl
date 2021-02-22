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
            <h1 class="product-name">{$_modx->resource.longtitle}</h1>
            <picture>
                <source srcset="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}" type="image/webp" />
                <img class="b-lazy product-image__logo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>2]}" alt="{$_modx->resource.pagetitle} в {'!pdoField' | snippet : [ 'id' => $_modx->resource.id, 'field' => 'pagetitle', 'top'=>2]}е" />
            </picture>
        </div>

        {'!pdoResources' | snippet : [
			'parents'=> 641,
			'tpl' => 'page-product',
			'resources' => $_modx->resource.id,
			'includeTVs' => $_modx->getChunk('credit_tvs'),
		]}
		
		<h2 class="page-title">Расчет кредита</h2>
        <div class="calc">
            <div class="row mb-5">
                <div class="col-md-6 col-lg-6">
                    <div class="calc-input">
                        <label class="calc-title">Сумма кредита</label>
                        <input id="credit_calc_summ" class="calc-input-value credit_calc_summ" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.credit_summ])}">
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="calc-input">
                        <label class="calc-title">Срок</label>
                        <input id="credit_calc_days" class="calc-input-value credit_calc_days" type="text" value="{$_modx->runSnippet('!get_range_value', ['value'=>$_modx->resource.credit_time])}">
                    </div>
                </div>
            </div>
            <div class="row">
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
            <div class="more">
                {if $_modx->resource.referal_link}
                    <a class="btn btn-offer btn-offer-mobile" href="{$_modx->resource.referal_link}" rel="nofollow" target="_blank">Оформить кредит</a>
                {else}
                    <a class="btn btn-offer btn-offer-mobile" href="https://{$_modx->resource.link_to_site}" rel="nofollow" target="_blank">Оформить кредит</a>
                {/if}
            </div>
        </div>
        
        <div class="tabs">
            <div class="tabs__nav">
                <button class="tabs__nav-btn" type="button" data-tab="#tab_1_{$_modx->resource.id}">Условия</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_2_{$_modx->resource.id}">Требования</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_3_{$_modx->resource.id}">Документы</button>
            </div>
            <div class="tabs__content">
                <div class="tabs__item" id="tab_1_{$_modx->resource.id}">
                    {include 'credit_usloviya'}
                </div>
    
                <div class="tabs__item" id="tab_2_{$_modx->resource.id}">
                    {include 'credit_treb'}
                </div>
    
                <div class="tabs__item" id="tab_3_{$_modx->resource.id}">
                    {include 'credit_dok'}
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
                    <h3 class="page-title-reviews">Отзывы о кредите {$_modx->resource.pagetitle}</h3>
                    <a href="#" class="btn btn-offer__reviews">Оставить отзыв</a>
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
    
    <div class="ground">
    <div class="container-main">
        <div class="text-center">
            <h2 class="page-title">Лучшие кредиты месяца</h2>
        </div>
        <div class="best-offers">
            <div class="best-offers-image">
                <img src="assets/template/assets/img/hand.png" alt="">
            </div>
            {'!pdoResources' | snippet : [
            	'parents'=> 641,
            	'tpl' => 'best_cards',
            	'limit' => 3,
            	'includeTVs' => $_modx->getChunk('credit_tvs'),
            	'sortby' => 'RAND()',
            	'where' => '{"template":"16", "referal_link:LIKE":"%https%"}'
            ]}
        </div>
    </div>
</div>

{/block}

{block 'before_footer'}{/block}