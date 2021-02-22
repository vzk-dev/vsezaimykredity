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
            {*<picture>
                <source srcset="{'!pdoField' | snippet : [ 'id' => $_modx->resource.id, 'field' => 'img', 'top'=>2]}" type="image/webp" />
                <img class="b-lazy product-image__logo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{'!pdoField' | snippet : [ 'id' => $_modx->resource.id, 'field' => 'img', 'top'=>2]}" alt="{$_modx->resource.longtitle}" />
            </picture>
            <img class="product-image__logo" src="{'!pdoField' | snippet : [ 'id' => $_modx->resource.id, 'field' => 'img', 'top'=>2]}" alt="">*}
        </div>

        {'!pdoResources' | snippet : [
			'parents'=> 641,
			'tpl' => 'page-product',
			'resources' => $_modx->resource.id,
			'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
		]}
		
		{*'!seoTabs' | snippet: [
            ]*}
            
            
        <div class="tabs">
            <div class="tabs__nav">
                <button class="tabs__nav-btn" type="button" data-tab="#tab_1_{$_modx->resource.id}">Условия</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_2_{$_modx->resource.id}">Комиссия</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_3_{$_modx->resource.id}">Требования</button>
            </div>
            <div class="tabs__content">
                <div class="tabs__item" id="tab_1_{$_modx->resource.id}">
                    {include 'credit_cards_usloviya'}
                </div>
    
                <div class="tabs__item" id="tab_2_{$_modx->resource.id}">
                    {include 'credit_cards_kom'}
                </div>
    
                <div class="tabs__item" id="tab_3_{$_modx->resource.id}">
                    {include 'credit_cards_trebovaniya'}
                </div>
            </div>
        </div>
		
        {*<div class="ionTabs" id="tabs_9" data-name="Tabs_credit_cards_product">
            <ul class="ionTabs__head ionTabs__head-product">
                <li class="ionTabs__tab" data-target="Tab_9_1">Условия</li>
                <li class="ionTabs__tab" data-target="Tab_9_2">Комиссия</li>
                <li class="ionTabs__tab" data-target="Tab_9_3">Требования</li>
            </ul>
            <div class="ionTabs__body">
                <div class="ionTabs__item ionTabs__item-product" data-name="Tab_9_1">
                    {include 'credit_cards_usloviya'}
                </div>
                <div class="ionTabs__item ionTabs__item-product" data-name="Tab_9_2">
                    {include 'credit_cards_kom'}
                </div>
                <div class="ionTabs__item ionTabs__item-product" data-name="Tab_9_3">
                    {include 'credit_cards_trebovaniya'}
                </div>
                <div class="ionTabs__preloader"></div>
            </div>
        </div>*} <!-- /.ionTabs -->
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
                    <h3 class="page-title-reviews">Отзывы о карте {$_modx->resource.pagetitle}</h3>
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
            <h2 class="page-title">Лучшие кредитные карты месяца</h2>
        </div>
        <div class="best-offers">
            <div class="best-offers-image">
                <img src="assets/template/assets/img/hand.png" alt="">
            </div>
            {'!pdoResources' | snippet : [
            	'parents'=> 641,
            	'tpl' => 'best_cards',
            	'limit' => 3,
            	'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
            	'sortby' => 'RAND()',
            	'where' => '{"template":"12", "referal_link:LIKE":"%https%"}'
            ]}
        </div>
    </div>
</div>

{/block}

{block 'before_footer'}{/block}