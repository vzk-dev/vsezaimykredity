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
        </div>

        {'!pdoResources' | snippet : [
			'parents'=> 641,
			'tpl' => 'page-product',
			'resources' => $_modx->resource.id,
			'includeTVs' => $_modx->getChunk('debit_card_tvs'),
		]}
		
		<div class="tabs">
            <div class="tabs__nav">
                <button class="tabs__nav-btn" type="button" data-tab="#tab_1_{$_modx->resource.id}">Кэшбэк</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_2_{$_modx->resource.id}">Условия</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_3_{$_modx->resource.id}">Снятие наличных</button>
                <button class="tabs__nav-btn" type="button" data-tab="#tab_4_{$_modx->resource.id}">Лимиты</button>
            </div>
            <div class="tabs__content">
                <div class="tabs__item" id="tab_1_{$_modx->resource.id}">
                    {include 'debit_cards_cach'}
                </div>
    
                <div class="tabs__item" id="tab_2_{$_modx->resource.id}">
                    {include 'debit_cards_usloviya'}
                </div>
    
                <div class="tabs__item" id="tab_3_{$_modx->resource.id}">
                    {include 'debit_cards_nal'}
                </div>
                
                <div class="tabs__item" id="tab_4_{$_modx->resource.id}">
                    {include 'debit_cards_limit'}
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
            <h2 class="page-title">Лучшие дебетовые карты месяца</h2>
        </div>
        <div class="best-offers">
            <div class="best-offers-image">
                <img src="assets/img/hand.png" alt="">
            </div>
            {'!pdoResources' | snippet : [
            	'parents'=> 641,
            	'tpl' => 'best_cards',
            	'limit' => 3,
            	'includeTVs' => $_modx->getChunk('debit_card_tvs'),
            	'sortby' => 'RAND()',
            	'where' => '{"template":"13", "referal_link:LIKE":"%https%"}'
            ]}
        </div>
    </div>
</div>

{/block}

{block 'before_footer'}{/block}