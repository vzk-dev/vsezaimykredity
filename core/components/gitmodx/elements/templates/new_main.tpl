{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}


<section class="first">
    <div class="container">
        <div class="text-center">
            <h1 class="page-title">Сервис финансовых продуктов</h1>
            <div class="page-desc">Все предложения банков и МФО на одном сайте</div>
        </div>
        {*<div class="slogan">
            <div class="s1">
                <div class="s11">
                    <div class="s12 s12--color01">01</div>
                </div>
                <div class="s13">Найди</div>
                <div class="s14"><img src="assets/img/slogan_search.png" alt=""></div>
            </div>
            <div class="s1">
                <div class="s11">
                    <div class="s12 s12--color02">02</div>
                </div>
                <div class="s13">Выбери</div>
                <div class="s14"><img src="assets/img/slogan_choice.png" alt=""></div>
            </div>
            <div class="s1">
                <div class="s11">
                    <div class="s12 s12--color03">03</div>
                </div>
                <div class="s13">Получи</div>
                <div class="s14"><img src="assets/img/slogan_money.png" alt=""></div>
            </div>
        </div> <!-- /.slogan -->*}
        <div class="row">
            {set $rows = json_decode($_modx->resource.main_links_collection, true)}
			{foreach $rows as  $row}
			<div class="col-12 col-sm-6 col-lg-3 mb-5">
				<div class="home-cat home-cat{$row.count}">
				    <div class="home-title">
                        <div class="home-title__name">
                            <a class="home-title__link" href="{$row.title_link | url}">{$row.title}</a>
                        </div>
                        <img src="{$row.img}" alt="" class="home-title__image">
                    </div>
					{set $links = json_decode($row.links, true)}
					{foreach $links as $link}
						<a class="home-cat__link" href="{$link.link | url}">{$link.text}</a>
					{/foreach}
                </div>
			</div>
			{/foreach}
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</section>
<!-- МФО -->
<section class="ground">
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Займы</h2>
        </div>
        <div class="ionTabs" id="tabs_1" data-name="Tabs_mfo">
            <ul class="ionTabs__head">
                {set $rows = json_decode($_modx->resource.mfo_slider, true)}
			    {foreach $rows as  $row}
                    <li class="ionTabs__tab" data-target="Tab_1_{$row.slider_tab_id}">{$row.slider_title}</li>
                {/foreach}
            </ul>
            <div class="ionTabs__body">
                {foreach $rows as  $row}
                    <div class="ionTabs__item" data-name="Tab_1_{$row.slider_tab_id}">
                        <div class="slider-container">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    {'!pdoResources' | snippet : [
            	    					'tpl' => 'home_slider',
            	    					'limit' => 16,
            	    					'parents' => 794,
            	    					'resources' => $row.slider_mfo,
            	    					'sortby' => ['manual_sort'=>'DESC','referal_link'=>'DESC','menuindex'=>'ASC'],
            	    					'is_slider' => 1,
            	    					'includeTVs' => $_modx->getChunk('microloans_tvs'),
            	    				]}
                                </div>
                                <!--/.swiper-wrapper-->
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>
                            <!--/.swiper-container-->
                            <div class="more"><a href="{$row.slider_links | url}" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
                        </div>
                        <!--/.slider-container-->
                    </div>
                {/foreach}
                <div class="ionTabs__preloader"></div>
            </div>
        </div>
    </div>
</section>
<!-- Кредитные карты -->
<section>
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Кредитные карты</h2>
        </div>
        <div class="ionTabs" id="tabs_2" data-name="Tabs_credit_cards">
            <ul class="ionTabs__head">
                {set $rows = json_decode($_modx->resource.credit_cards_slider, true)}
			    {foreach $rows as  $row}
                    <li class="ionTabs__tab" data-target="Tab_1_{$row.slider_tab_id}">{$row.slider_title}</li>
                {/foreach}
            </ul>
            <div class="ionTabs__body">
                {foreach $rows as  $row}
                    <div class="ionTabs__item" data-name="Tab_1_{$row.slider_tab_id}">
                        <div class="slider-container">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    {'!pdoResources' | snippet : [
            	    					'tpl' => 'home_slider_cards',
            	    					'limit' => 16,
            	    					'parents' => 641,
            	    					'resources' => $row.slider_mfo,
            	    					'sortby' => ['manual_sort'=>'DESC','referal_link'=>'DESC','menuindex'=>'ASC'],
            	    					'is_slider' => 1,
            	    					'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
            	    				]}
                                </div>
                                <!--/.swiper-wrapper-->
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>
                            <!--/.swiper-container-->
                            <div class="more"><a href="{$row.slider_links | url}" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
                        </div>
                        <!--/.slider-container-->
                    </div>
                {/foreach}
                <div class="ionTabs__preloader"></div>
            </div>
        </div>
    </div> <!-- /.container -->
</section>
<!-- Дебетовые карты -->
<section class="ground">
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Дебетовые карты</h2>
        </div>
        <div class="ionTabs" id="tabs_3" data-name="Tabs_debit_cards">
            <ul class="ionTabs__head">
                {set $rows = json_decode($_modx->resource.debit_cards_slider, true)}
			    {foreach $rows as  $row}
                    <li class="ionTabs__tab" data-target="Tab_1_{$row.slider_tab_id}">{$row.slider_title}</li>
                {/foreach}
            </ul>
            <div class="ionTabs__body">
                {foreach $rows as  $row}
                    <div class="ionTabs__item" data-name="Tab_1_{$row.slider_tab_id}">
                        <div class="slider-container">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    {'!pdoResources' | snippet : [
            	    					'tpl' => 'home_slider_cards',
            	    					'limit' => 16,
            	    					'parents' => 641,
            	    					'resources' => $row.slider_mfo,
            	    					'sortby' => ['manual_sort'=>'DESC','referal_link'=>'DESC','menuindex'=>'ASC'],
            	    					'is_slider' => 1,
            	    					'includeTVs' => $_modx->getChunk('debit_card_tvs'),
            	    				]}
                                </div>
                                <!--/.swiper-wrapper-->
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>
                            <!--/.swiper-container-->
                            <div class="more"><a href="{$row.slider_links | url}" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
                        </div>
                        <!--/.slider-container-->
                    </div>
                {/foreach}
                <div class="ionTabs__preloader"></div>
            </div>
        </div>
    </div> <!-- /.container -->
</section>
<!-- Кредит -->
<section>
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Кредиты</h2>
        </div>
        <div class="ionTabs" id="tabs_4" data-name="Tabs_credit">
            <ul class="ionTabs__head">
                {set $rows = json_decode($_modx->resource.credit_slider, true)}
			    {foreach $rows as  $row}
                    <li class="ionTabs__tab" data-target="Tab_1_{$row.slider_tab_id}">{$row.slider_title}</li>
                {/foreach}
            </ul>
            <div class="ionTabs__body">
                {foreach $rows as  $row}
                    <div class="ionTabs__item" data-name="Tab_1_{$row.slider_tab_id}">
                        <div class="slider-container">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    {'!pdoResources' | snippet : [
            	    					'tpl' => 'home_slider',
            	    					'limit' => 16,
            	    					'parents' => 641,
            	    					'resources' => $row.slider_mfo,
            	    					'sortby' => ['manual_sort'=>'DESC','referal_link'=>'DESC','menuindex'=>'ASC'],
            	    					'is_slider' => 1,
            	    					'includeTVs' => $_modx->getChunk('credit_tvs'),
            	    				]}
                                </div>
                                <!--/.swiper-wrapper-->
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>
                            <!--/.swiper-container-->
                            <div class="more"><a href="{$row.slider_links | url}" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
                        </div>
                        <!--/.slider-container-->
                    </div>
                {/foreach}
                <div class="ionTabs__preloader"></div>
            </div>
        </div>
    </div> <!-- /.container -->
</section>
<!-- Ипотека -->
<section class="ground">
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Ипотека</h2>
        </div>
        <div class="ionTabs" id="tabs_5" data-name="Tabs_ipoteka">
            <ul class="ionTabs__head">
                {set $rows = json_decode($_modx->resource.ipoteka_slider, true)}
			    {foreach $rows as  $row}
                    <li class="ionTabs__tab" data-target="Tab_1_{$row.slider_tab_id}">{$row.slider_title}</li>
                {/foreach}
            </ul>
            <div class="ionTabs__body">
                {foreach $rows as  $row}
                    <div class="ionTabs__item" data-name="Tab_1_{$row.slider_tab_id}">
                        <div class="slider-container">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    {'!pdoResources' | snippet : [
            	    					'tpl' => 'home_slider',
            	    					'limit' => 16,
            	    					'parents' => 641,
            	    					'resources' => $row.slider_mfo,
            	    					'sortby' => ['manual_sort'=>'DESC','referal_link'=>'DESC','menuindex'=>'ASC'],
            	    					'is_slider' => 1,
            	    					'includeTVs' => $_modx->getChunk('ipoteka_tvs'),
            	    				]}
                                </div>
                                <!--/.swiper-wrapper-->
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>
                            <!--/.swiper-container-->
                            <div class="more"><a href="{$row.slider_links | url}" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
                        </div>
                        <!--/.slider-container-->
                    </div>
                {/foreach}
                <div class="ionTabs__preloader"></div>
            </div>
        </div>
    </div> <!-- /.container -->
</section>
<!-- Лучшие предложения месяца -->
<section>
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Лучшие предложения месяца</h2>
        </div>
        <div class="ionTabs" id="tabs_6" data-name="Tabs_best">
            <ul class="ionTabs__head">
                <li class="ionTabs__tab" data-target="Tab_1_1">Кредитные карты</li>
                <li class="ionTabs__tab" data-target="Tab_2_2">Дебетовые карты</li>
                <li class="ionTabs__tab" data-target="Tab_3_3">Займы</li>
                <li class="ionTabs__tab" data-target="Tab_3_4">Кредиты</li>
                <li class="ionTabs__tab" data-target="Tab_3_5">Ипотеки</li>
            </ul>
            <div class="ionTabs__body">
                <div class="ionTabs__item" data-name="Tab_1_1">
                    <div class="best-offers">
                        <div class="best-offers-image">
                            <img src="assets/template/assets/img/hand.png" alt="">
                        </div>
                        {'!pdoResources' | snippet : [
                        	'parents'=> 641,
                        	'tpl' => 'best_cards'
                        	'resources' => '67,68,181,103',
                        	'limit' => 4,
                        	'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
                        ]}
                    </div>
                </div>
                <div class="ionTabs__item" data-name="Tab_2_2">
                    <div class="best-offers">
                        <div class="best-offers-image">
                            <img src="assets/template/assets/img/hand.png" alt="">
                        </div>
                        {'!pdoResources' | snippet : [
                        	'parents'=> 641,
                        	'tpl' => 'best_cards',
                        	'resources' => '110,69,109,70',
                        	'limit' => 4,
                        	'includeTVs' => $_modx->getChunk('debit_card_tvs'),
                        ]}
                    </div>
                </div>
                <div class="ionTabs__item" data-name="Tab_3_3">
                    <div class="best-offers">
                        <div class="best-offers-image">
                            <img src="assets/template/assets/img/hand.png" alt="">
                        </div>
                        {'!pdoResources' | snippet : [
                        	'parents'=> 794,
                        	'tpl' => 'best_cards',
                        	'resources' => '807,809,800,845',
                        	'limit' => 4,
                        	'includeTVs' => $_modx->getChunk('microloans_tvs'),
                        ]}
                    </div>
                </div>
                <div class="ionTabs__item" data-name="Tab_3_4">
                    <div class="best-offers">
                        <div class="best-offers-image">
                            <img src="assets/template/assets/img/hand.png" alt="">
                        </div>
                        {'!pdoResources' | snippet : [
                        	'parents'=> 641,
                        	'tpl' => 'best_cards',
                        	'resources' => '251,273,153,148',
                        	'limit' => 4,
                        	'includeTVs' => $_modx->getChunk('credit_tvs'),
                        ]}
                    </div>
                </div>
                <div class="ionTabs__item" data-name="Tab_3_5">
                    <div class="best-offers">
                        <div class="best-offers-image">
                            <img src="assets/template/assets/img/hand.png" alt="">
                        </div>
                        {'!pdoResources' | snippet : [
                        	'parents'=> 641,
                        	'tpl' => 'best_cards',
                        	'resources' => '237,259,332,236',
                        	'limit' => 4,
                        	'includeTVs' => $_modx->getChunk('ipoteka_tvs'),
                        ]}
                    </div>
                </div>
                <div class="ionTabs__preloader"></div>
            </div>
        </div>
        <!--/.ionTabs-->
    </div>
    <!--/.container-->
</section>
<!--Banki-->
<section class="ground">
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Популярные банки</h2>
        </div>
        <div class="banki-inner">
            <div class="swiper-container banki">
                <div class="swiper-wrapper">
                    {'!pdoResources' | snippet : [
                	    'limit' => 16,
                	    'parents' => 641,
                	    'resources' => '642,649,658,664,669,675,681,687,693,705',
                	    'is_slider' => 1,
                	    'includeTVs' => 'img',
                	    'tpl' => 'home_slider_bank',
                	    'sortby' => ['menuindex'=>'ASC']
                	]}
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        <!--/.banki-inner-->
        <div class="more"><a href="{641 | url}" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
    </div>
    <!--/.container-->
</section>
{*
<!--Лучшие условия по продуктам в банках России-->
<section>
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Лучшие условия по продуктам в банках России</h2>
        </div>
        <div class="ionTabs" id="tabs_7" data-name="Tabs_best_product">
            <ul class="ionTabs__head">
                <li class="ionTabs__tab" data-target="Tab_7_1">Кредиты</li>
                <li class="ionTabs__tab" data-target="Tab_7_2">Ипотека</li>
                <li class="ionTabs__tab" data-target="Tab_7_3">Кредитные карты</li>
                <li class="ionTabs__tab" data-target="Tab_7_4">Дебетовые карты</li>
            </ul>
            <div class="ionTabs__body">
                <div class="ionTabs__item" data-name="Tab_7_1">
                    <div class="table-wrap">
                        <table>
                            <thead>
                                <tr>
                                    <th>Банк</th>
                                    <th>Сумма</th>
                                    <th>Ставка</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="table__name" data-label="Банк">Банк "Открытие"</td>
                                    <td class="table__value" data-label="Сумма">до 30 млн. руб.</td>
                                    <td class="table__value" data-label="Ставка">от <span class="table_percent">9%</span></td>
                                    <td class="table__value" data-label=""><a class="btn btn-table" href="#">Подробнее</a></td>
                                </tr>
                                <tr>
                                    <td class="table__name" data-label="Банк">Банк "Открытие"</td>
                                    <td class="table__value" data-label="Сумма">до 30 млн. руб.</td>
                                    <td class="table__value" data-label="Ставка">от <span class="table_percent">9%</span></td>
                                    <td class="table__value" data-label=""><a class="btn btn-table" href="#">Подробнее</a></td>
                                </tr>
                                <tr>
                                    <td class="table__name" data-label="Банк">Банк "Открытие"</td>
                                    <td class="table__value" data-label="Сумма">до 30 млн. руб.</td>
                                    <td class="table__value" data-label="Ставка">от <span class="table_percent">9%</span></td>
                                    <td class="table__value" data-label=""><a class="btn btn-table" href="#">Подробнее</a></td>
                                </tr>
                                <tr>
                                    <td class="table__name" data-label="Банк">Банк "Открытие"</td>
                                    <td class="table__value" data-label="Сумма">до 30 млн. руб.</td>
                                    <td class="table__value" data-label="Ставка">от <span class="table_percent">9%</span></td>
                                    <td class="table__value" data-label=""><a class="btn btn-table" href="#">Подробнее</a></td>
                                </tr>
                                <tr>
                                    <td class="table__name" data-label="Банк">Банк "Открытие"</td>
                                    <td class="table__value" data-label="Сумма">до 30 млн. руб.</td>
                                    <td class="table__value" data-label="Ставка">от <span class="table_percent">9%</span></td>
                                    <td class="table__value" data-label=""><a class="btn btn-table" href="#">Подробнее</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="more"><a href="#" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
                </div>
                <!--./ionTabs__item-->
            </div>
        </div>
    </div>
    <!--/.container-->
</section>
<!--Популярные статьи-->
<section class="ground">
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Поплярные статьи</h2>
        </div>
        <div class="statii">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="statii__inner">
                            <a class="statii__link" href="#">
                                <img class="statii__image" src="https://placehold.it/270x140" alt="">
                                <div class="statii__content">
                                    <div class="statii__data">22.07.2020</div>
                                    <div class="statii__title">Запрлата на карту через Систему быстрых платежей</div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!--./swiper-slide-->
                    <div class="swiper-slide">
                        <div class="statii__inner">
                            <a class="statii__link" href="#">
                                <img class="statii__image" src="https://placehold.it/270x140" alt="">
                                <div class="statii__content">
                                    <div class="statii__data">22.07.2020</div>
                                    <div class="statii__title">Запрлата на карту через Систему быстрых платежей</div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!--./swiper-slide-->
                    <div class="swiper-slide">
                        <div class="statii__inner">
                            <a class="statii__link" href="#">
                                <img class="statii__image" src="https://placehold.it/270x140" alt="">
                                <div class="statii__content">
                                    <div class="statii__data">22.07.2020</div>
                                    <div class="statii__title">Запрлата на карту через Систему быстрых платежей</div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!--./swiper-slide-->
                    <div class="swiper-slide">
                        <div class="statii__inner">
                            <a class="statii__link" href="#">
                                <img class="statii__image" src="https://placehold.it/270x140" alt="">
                                <div class="statii__content">
                                    <div class="statii__data">22.07.2020</div>
                                    <div class="statii__title">Запрлата на карту через Систему быстрых платежей</div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!--./swiper-slide-->
                    <div class="swiper-slide">
                        <div class="statii__inner">
                            <a class="statii__link" href="#">
                                <img class="statii__image" src="https://placehold.it/270x140" alt="">
                                <div class="statii__content">
                                    <div class="statii__data">22.07.2020</div>
                                    <div class="statii__title">Запрлата на карту через Систему быстрых платежей</div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!--./swiper-slide-->
                </div>
                <!--/.swiper-wrapper-->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        <!--/.statii-->
        <div class="more"><a href="#" class="btn btn-more">Смотреть все<span class="btn-dop"></span></a></div>
    </div>
    <!--/.container-->
</section>
<!--Раздел с кредитными программами-->*}
<section>
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">Раздел с кредитными программами</h2>
            <div class="page-desc">На нашем сайте вы можете подобрать:</div>
        </div>
        <div class="programm">
            <div class="programm__column">
                <div class="programm__inner programm__inner--mfo">
                    <div class="programm__row">
                        <div class="programm__content">
                            <div class="programm__title">Займы от МФО</div>
                            <div class="programm__text">Самые простые, быстрые и практически безотказные продукты. Вы сможете сделать подбор займа онлайн и сразу подать заявку на его выдачу. Решение придет через несколько минут. Если вы ищите, кто одобрит ссуду при плохой КИ, то это однозначно буду МФО.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="programm__column">
                <div class="programm__inner programm__inner--credit-cards">
                    <div class="programm__row">
                        <div class="programm__content">
                            <div class="programm__title">Кредитные карты</div>
                            <div class="programm__text">Есть максимально выгодные предложения по кредитным картам: с большим льготным периодом до 240 дней, с подключением интересных бонусных программ. Есть карты с бесплатным обслуживанием и обналичиванием.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="programm__column">
                <div class="programm__inner programm__inner--debit-cards">
                    <div class="programm__row">
                        <div class="programm__content">
                            <div class="programm__title">Дебетовые карты</div>
                            <div class="programm__text">Большой ассортимент карт от лучших банков страны. Простые и премиальные, платные и бесплатные, есть платежные средства моментальной выдачи, с кэшбэком, бонусными милями и пр. Вам будет из чего выбирать.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="programm__column">
                <div class="programm__inner programm__inner--credits">
                    <div class="programm__row">
                        <div class="programm__content">
                            <div class="programm__title">Кредиты</div>
                            <div class="programm__text">Размещаются программы всех банков, от самых крупных федеральных до небольших. Вы сможете оформить кредит по низкой процентной ставке, воспользоваться упрощенной программой. Ассортимент большой, предложения есть для всех.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--О нашем сервисе-->
<section class="ground">
    <div class="container">
        <div class="text-center">
            <h2 class="page-title">О нашем сервисе</h2>
        </div>
        <div class="services__row pb-5">
            <div class="services-image">
                <img src="assets/template/assets/img/hand.png" alt="">
            </div>
            <div class="services__column">
                <div class="services__column__row">
                    <div class="services__img"><img src="assets/template/assets/img/services_1.png" alt=""></div>
                    <div class="services__title">Всезаймыкредиты - не банк</div>
                    <div class="services__text">Мы не выдаем кредиты и карты. Данный сервис создан чтобы помочь вам найти и сравнить самые выгодные условия по финансовым продуктам банков.</div>
                    {*<div class="services__more"><a href="#" class="services__link">Подробнее о нас</a></div>*}
                </div>
            </div>
            <div class="services__column">
                <div class="services__column__row">
                    <div class="services__img"><img src="assets/template/assets/img/services_2.png" alt=""></div>
                    <div class="services__title">Независимый сервис сравнения</div>
                    <div class="services__text">Мы не принадлежим ни одному банку, полностью свободны и представляем честное мнение для наших посетителей. Наш контент объективен и непредвзят.</div>
                    {*<div class="services__more"><a href="#" class="services__link">Редакционная политика</a></div>*}
                </div>
            </div>
            <div class="services__column">
                <div class="services__column__row">
                    <div class="services__img"><img src="assets/template/assets/img/services_3.png" alt=""></div>
                    <div class="services__title">Бесплатное использование</div>
                    <div class="services__text">Мы не берем с вас денег за свои услуги, вся информация бесплатна. Всезаймыкредиты это рекламно-поддерживаемый сервис с партнерскими ссылками.</div>
                    {*<div class="services__more"> <a href="#" class="services__link">Как мы зарабатываем деньги</a></div>*}
                </div>
            </div>
        </div>
    </div>
</section>


{/block}
{block 'before_footer'}{/block}