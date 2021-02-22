<header class="header">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="header-content">
                    <div class="header-logo">
                        <a class="logo" href="/">
                            <img src="/assets/template/assets/img/logo.png" alt="ВЗК">
                        </a>
                    </div>
                    <div class="cource">
                        <div class="cource__inner">
                            <div class="cource__title">UDS<span class="cource__title-cb">ЦБ</span></div>
                            <div class="cource__price">[[!getCurRate?&cur_output=`rubinusd`]]</div>
                        </div>
                        <div class="cource__inner">
                            <div class="cource__title">EUR<span class="cource__title-cb">ЦБ</span></div>
                            <div class="cource__price">[[!getCurRate?&cur_output=`rubineur`]]</div>
                        </div>
                        {*<div class="cource__inner">
                            <div class="cource__title">Нефть</div>
                            <div class="cource__price">81.54</div>
                        </div>*}
                    </div>
                    {'UserLocation.initialize'|snippet}
                    {set $location = ''|getUserLocation}
                    <div class="userlocation userlocation-location-confirm {$location.confirmed?'':'unconfirmed'}">
                        <a class="header__city" href="javascript:" data-fancybox="" data-src="#userlocation-location-popup">
                            {$location.name}
                        </a>
                    </div>
                    <div id="userlocation-location-popup" style="display: none">
                        <div class="h4">Выберите свой населённый пункт</div>
                        {'UserLocation.location'|snippet:[
                        'typeSearch' => 'remote',
                        'tpl' => 'UserLocation.locations'
                        ]}
                    </div>
                    <a href="/search" class="header__search">
                        <img src="/assets/template/assets/img/search.png" alt="" class="header__serch-icon">
                    </a>
                    <div class="livesearch">{$_modx->runSnippet('!mSearchForm',['pageId'=>'183'])}<span class="livesearch__close" title="Закрыть"></span></div>
                    <div class="toggle-button" data-toggle="nav-menu">
                        <div class="hamburger">
                            <span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>