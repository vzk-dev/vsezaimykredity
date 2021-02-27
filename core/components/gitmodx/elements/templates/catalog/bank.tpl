{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}

<div class="container">
    {'!pdoCrumbs' | snippet : [
        'to' => $_modx->id,
        'showHome' => 1,
        'tpl' => 'bread_tpl',
        'tplWrapper' => 'bread_tplWrapper',
        'tplCurrent' => 'bread_tplCurrent'
    ]}
    <div class="category-bank-inner">
        <div class="category-bank">
            <h1 class="title">{$_modx->resource.pagetitle}</h1>
            {*<div class="category-name-bank">ПАО Сбербанк</div>*}
        </div>
        <picture>
           <source srcset="{$_modx->resource.img}" type="image/webp">
           <img class="b-lazy category-bank-image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_modx->resource.img}" alt="{$_modx->resource.pagetitle}">
        </picture>
        {*<img class="category-bank-image" src="{$_modx->resource.img}" alt="{$_modx->resource.pagetitle}">*}
    </div>
    <div class="row mt-4">
        <div class="col-lg-9">
            <div class="swiper-container bank">
                <div class="swiper-wrapper">
                        {var $count__debit = $_modx->runSnippet('!count',[
                        'parents' => $_modx->resource.id,
                        'depth' => 2,
                        'where' => '{"alias":"debit-cards"}',
                        'hide' => false
                        ])}
                        {if $count__debit}
                        <div class="swiper-slide">
                                {'!pdoResources' | snippet : [
                                    'parents' => $_modx->resource.id,
                                    'resources' => $id,
                                    'depth' => 2,
                                    'limit' => 1,
                                    'where' => '{"alias":"debit-cards"}',
                                    'tpl' => '@INLINE <div class="direction"><a class="direction-value direction-value--bg1" href="{$id | url}">[[+menutitle:default=`[[+pagetitle]]`]]</a></div>',
                                    'tplWrapper' => '@INLINE [[+output]]'
                                ]}
                        </div>
                        {/if}
                        {var $count__credit = $_modx->runSnippet('!count',[
                        'parents' => $_modx->resource.id,
                        'depth' => 2,
                        'where' => '{"alias":"credit-cards"}',
                        'hide' => false
                        ])}
                        {if $count__credit}
                        <div class="swiper-slide">
                                {'!pdoResources' | snippet : [
                                    'parents' => $_modx->resource.id,
                                    'resources' => $id,
                                    'depth' => 2,
                                    'limit' => 1,
                                    'where' => '{"alias":"credit-cards"}',
                                    'tpl' => '@INLINE <div class="direction"><a class="direction-value direction-value--bg2" href="{$id | url}">[[+menutitle:default=`[[+pagetitle]]`]]</a></div>',
                                    'tplWrapper' => '@INLINE [[+output]]'
                                ]}
                        </div>
                        {/if}
                        {var $count__credits = $_modx->runSnippet('!count',[
                        'parents' => $_modx->resource.id,
                        'depth' => 2,
                        'where' => '{"alias":"credits"}',
                        'hide' => false
                        ])}
                        {if $count__credits}
                        <div class="swiper-slide">
                                {'!pdoResources' | snippet : [
                                    'parents' => $_modx->resource.id,
                                    'resources' => $id,
                                    'depth' => 2,
                                    'limit' => 1,
                                    'where' => '{"alias":"credits"}',
                                    'tpl' => '@INLINE <div class="direction"><a class="direction-value direction-value--bg3" href="{$id | url}">[[+menutitle:default=`[[+pagetitle]]`]]</a></div>',
                                    'tplWrapper' => '@INLINE [[+output]]'
                                ]}
                        </div>
                        {/if}
                        {var $count__ipoteka = $_modx->runSnippet('!count',[
                        'parents' => $_modx->resource.id,
                        'depth' => 2,
                        'where' => '{"alias":"ipoteka"}',
                        'hide' => false
                        ])}
                        {if $count__ipoteka}
                        <div class="swiper-slide">
                                {'!pdoResources' | snippet : [
                                    'parents' => $_modx->resource.id,
                                    'resources' => $id,
                                    'depth' => 2,
                                    'limit' => 1,
                                    'where' => '{"alias":"ipoteka"}',
                                    'tpl' => '@INLINE <div class="direction"><a class="direction-value direction-value--bg4" href="{$id | url}">[[+menutitle:default=`[[+pagetitle]]`]]</a></div>',
                                    'tplWrapper' => '@INLINE [[+output]]'
                                ]}
                        </div>
                        {/if}
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div> <!-- /.swiper-container -->
            {*<h2 class="page-title">
                О Сбербанке России
            </h2>*}
            <div id="category-content" class="category-content">
                {'content'|resource}
            </div>

            <h2 class="page-title">Виды банковских услуг</h2>
            <div class="row">
                {include 'bank_uslugi'}
            </div>

            {*{> map-product }}

            {{> reviews-full }*}
            
        </div><!-- /.col-lg-9 -->
        <div class="col-lg-3">
            <div class="reference-info mb-4">
                {'!pdoResources' | snippet : [
                    'parents' => $_modx->resource.id,
                    'tpl' => 'reference_information',
                    'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
                    'limit' => 1
                ]}
            </div>

            {*<div class="news">
                <div class="news-name text-center">Новости</div>
                <div class="news-item">
                <img class="news-image" src="https://placehold.it/114x95" alt="">
                <div class="news-inner">
                    <div class="news-data">22.07.2020</div>
                    <div class="news-title">Зарплата на карту через систему быстрых платежей</div>
                </div>
                </div>

                <div class="news-item">
                <img class="news-image" src="https://placehold.it/114x95" alt="">
                <div class="news-inner">
                    <div class="news-data">22.07.2020</div>
                    <div class="news-title">Зарплата на карту через систему быстрых платежей</div>
                </div>
                </div>

                <div class="news-item">
                <img class="news-image" src="https://placehold.it/114x95" alt="">
                <div class="news-inner">
                    <div class="news-data">22.07.2020</div>
                    <div class="news-title">Зарплата на карту через систему быстрых платежей</div>
                </div>
                </div>
                <div class="more"><a href="#" class="btn btn-more">Все новости<span class="btn-dop"></span></a></div>
            </div>

            <div class="popular-bank">
                <div class="popular-bank-name text-center">Популярные банки</div>
                <div class="popular-bank-inner">
                    <a class="popular-bank-link" href="#">Банк Открытие</a>
                    <a class="popular-bank-link" href="#">Хоум кредит банк</a>
                    <a class="popular-bank-link" href="#">Банк ВТБ</a>
                    <a class="popular-bank-link" href="#">Тинькофф Банк</a>
                    <a class="popular-bank-link" href="#">Газпромбанк</a>
                    <a class="popular-bank-link" href="#">Альфа-банк</a>
                    <a class="popular-bank-link" href="#">Райффайзен банк</a>
                </div>
                <div class="more"><a href="#" class="btn btn-more">Все банки<span class="btn-dop"></span></a></div>
            </div>*}
        </div>
    </div>
</div>

{/block}

{block 'before_footer'}{/block}