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
        <h1 class="product-name">{$_modx->resource.pagetitle}</h1>
        <picture>
            <source srcset="{$_modx->resource.img}" type="image/webp" />
            <img class="b-lazy product-image__logo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_modx->resource.img | phpthumbon : "w=250"}" alt="{$_modx->resource.pagetitle}" />
        </picture>
    </div>
    <div class="row">
        <div class="col col-md-12 col-lg-10">
            <div class="mobile-help-info">Справочная информация</div>
            <div class="row mobile-help-info-open">
                <div class="col-12 col-md-4 col-lg-3 mb-2">
                    <div class="mfo-info">Регистрационный номер</div>
                    <div class="mfo-value">{$_modx->resource.svid}</div>
                </div>
                <div class="col-12 col-md-4 col-lg-3 mb-2">
                    <div class="mfo-info">Номер лицензии</div>
                    <div class="mfo-value">{$_modx->resource.license}</div>
                </div>
                <div class="col-12 col-md-4 col-lg-3 mb-2">
                    <div class="mfo-info">ОГРН:</div>
                    <div class="mfo-value">{$_modx->resource.ogrn}</div>
                </div>
                <div class="col-12 col-md-4 col-lg-3 mb-2">
                    <div class="mfo-info">ИНН:</div>
                    <div class="mfo-value">{$_modx->resource.inn}</div>
                </div>
                <div class="col-12 col-md-4 col-lg-3 mb-2">
                    <div class="mfo-item">Сайт</div>
                    <div class="mfo-value">
                    {if $_modx->resource.referal_link}
                        <a href="{$_modx->resource.referal_link}" rel="nofollow" target="_blank">{$_modx->resource.link_to_site}</a>
                    {else}
                        <a href="https://{$_modx->resource.link_to_site}" rel="nofollow" target="_blank">{$_modx->resource.link_to_site}</a>
                    {/if}
                    </div>
                </div>
                <div class="col-12 col-md-4 col-lg-3 mb-2">
                    <div class="mfo-item">График рассмотрения заявок</div>
                    <div class="mfo-value">{$_modx->resource.time}</div>
                </div>
                <div class="col-12 col-md-4 col-lg-3 mb-2">
                    <div class="mfo-item">Телефон</div>
                    <div class="mfo-value"><a href="tel:{$_modx->resource.phone|tel}">{$_modx->resource.phone}</a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div id="category-content" class="category-content">
                {'content'|resource}
                {*<div class="open">Читать полностью <span class="open-image"></span></div>*}
            </div>
        </div>
    </div>
    <h2 class="page-title">Посчитать переплату</h2>
    <div class="calc">
        <div class="row mb-4">
            <div class="col-md-6 col-lg-6">
                <div class="calc-input">
                    <label class="calc-title">Сумма займа</label>
                    <input id="calc_summ" class="calc_summ calc-input-value" type="text" value="12000">
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="calc-input">
                    <label class="calc-title">Срок займа</label>
                    <input id="calc_days" class="calc_days calc-input-value" type="text" value="12">
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
            <div class="col mfo-text-min">*примерный расчет по <span class="calc_rate_const">1</span>% ставке без учета комиссий</div>
        </div>
        <div class="more">
            {if $_modx->resource.referal_link}
                <a class="btn btn-offer btn-offer-mobile" href="{$_modx->resource.referal_link}" rel="nofollow" target="_blank">Оформить займ</a>
            {else}
                <a class="btn btn-offer btn-offer-mobile" href="https://{$_modx->resource.link_to_site}" rel="nofollow" target="_blank">Оформить займ</a>
            {/if}
        </div>
    </div>
    <h2 class="page-title">Все займы в {$_modx->resource.pagetitle}</h2>
    <div class="mfo-category-table-wrap">
        <table class="mfo-category-table-all">
            <thead>
                <tr>
                    <th>Сумма</th>
                    <th>Ставка в день</th>
                    <th>Срок</th>
                    <th>Возраст</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                {'!pdoResources' | snippet : [
                    'parents' => $_modx->resource.id,
                	'tpl' => 'table_mfo_v1',
                	'depth' => 0,
                	'includeTVs' => $_modx->getChunk('microloans_tvs'),
                	'limit' => 0,
                ]}
            </tbody>
        </table>
    </div>
</div>

<section class="ground">
    <div class="container-main">
        <h2 class="page-title">Популярные займы других МФО</h2>
        {'!pdoResources' | snippet : [
            'groupby'=>'modResource.parent',
    		'parents'=> 0,
    		'resources' => '-' ~ $id,
    		'tpl' => 'mfo_rec',
    		'limit' => 10,
    		'includeTVs' => $_modx->getChunk('microloans_tvs'),
    		'sortby' => 'RAND()',
    		'where'=> '{"template":"5"}'
    	]}
        <div class="more"><a href="{15|url}" class="btn btn-more">Все займы<span class="btn-dop"></span></a></div>
    </div>
</section>

{*<section>
    <div class="container-main">
        <h2 class="page-title">Онлайн-заявка на займ</h2>
        <form action="">
            <div class="form-body">
                <div class="row">
                    <div class="col-md-6 col-lg-6 mb-3">
                        <label for="" class="form-name">ФИО*</label>
                        <input type="text" placeholder="Фамилия Имя Отчетство" class="form-value">
                    </div>
                    <div class="col-md-6 col-lg-6 mb-3">
                        <label for="" class="form-name">Мобильный телефон*</label>
                        <input type="tel" placeholder="+7 (___) ___-__-__" class="form-value">
                    </div>
                    <div class="col-md-6 col-lg-6 mb-3">
                        <label for="" class="form-name">Желаемая сумма займа*</label>
                        <input type="number" placeholder="Сумма" class="form-value">
                    </div>
                    <div class="col-md-6 col-lg-6 mb-3">
                        <label for="" class="form-name">Адрес проживания*</label>
                        <input type="text" placeholder="Введите адрес" class="form-value">
                    </div>
                    <div class="col-md-6 col-lg-6 mb-3">
                        <label for="" class="form-name">Дата рождения*</label>
                        <input type="date" placeholder="дд.мм.гггг" class="form-value">
                    </div>
                    <div class="col-md-6 col-lg-6 mb-3">
                        <label for="" class="form-name">Электронная почта*</label>
                        <input type="email" placeholder="Введите Ваш email, например youremail@mail.ru" class="form-value">
                    </div>
                    <div class="col-md-6 col-lg-6 mb-3">
                        <label for="" class="form-name">Наличие автомобиля*</label>
                        <select name="" id="">
                            <option value="">Да</option>
                            <option value="">Нет</option>
                        </select>
                    </div>
                    <div class="col-md-6 col-lg-6 mb-3">
                        <div class="form-lic">
                            <input type="checkbox" class=""><span>Согласен на <a href="#" class="form-sogl-link">обработку персональных данных</a> и получение ракламных материалов на email</span></div>
                    </div>
                    <div class="col">
                        <div class="more"><input type="submit" class="btn btn-offer" value="Получить деньги"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

<div class="ground">
    <div class="container-main">
        отзывы
    </div>
</div>

<div class="map">
    <div class="container-main">
        карта
    </div>
</div>*}

{/block}

{block 'before_footer'}{/block}