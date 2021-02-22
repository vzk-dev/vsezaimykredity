<footer class="footer">
    <div class="container">
        <div class="footer__logo">
            <a class="logo" href="/">
                <img class="logo__image" src="/assets/template/assets/img/vzk_footer.png" alt="">
            </a>
        </div>
        {if $_modx->resource.template in[6,20,30,31,5]}
            {include 'footer_links_mfo'}
        {/if}
        {if $_modx->resource.template in[32,29,11,12]}
            {include 'footer_links_credit_cards'}
        {/if}
        <div class="row mt-4 line">
            <div class="col-12 col-md-3 mb-4">
                <div class="footer__coperight">
                    © {'' | date : 'Y'} – Мгновенный поиск, сравнение и онлайн-оформление займов, карт и кредитов
                </div>
            </div>
            <div class="col-12 col-md-6">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-5 mb-4">
                        {'!pdoMenu' | snippet : [
                            'parents' => 24,
                            'level' => 1,
                            'tplOuter' => '@INLINE <div class="footer-menu">{$wrapper}</div>',
                            'tpl' => '@INLINE <a class="footer-menu__link" href="{$link}" {$attributes}>{$menutitle}</a>'
                        ]}
                    </div>
                    <div class="col-12 col-md-6 mb-4">
                        {'!pdoMenu' | snippet : [
                            'parents' => 28,
                            'level' => 1,
                            'tplOuter' => '@INLINE <div class="footer-menu">{$wrapper}</div>',
                            'tpl' => '@INLINE <a class="footer-menu__link" href="{$link}" {$attributes}>{$menutitle}</a>'
                        ]}
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3 mb-4">
                <div class="site-support">
                    <div class="site-support__title">Поодержка</div>
                    <div class="site-support__email">support@vsezaimykredity.com</div>
                    <div class="site-support__caption">Есть вопрос по выбору микрозайма, займа под залог или другого финансового продукта? Пишите!</div>
                </div>
            </div>
        </div>

        <p>Предложение не является офертой. Конечные условия уточняйте при прямом общении с кредиторами. Содержание информационных статей основано на субъективном мнении редакции нашего сайта. Мы не несем ответственность за полноту и достоверность содержащейся в них информации. Сайт не принадлежит финансовой организации и на нем не оказываются финансовые услуги.</p>
        <p>Финансовые услуги будут оказываться непосредственно организациями, имеющими разрешение Центрального Банка Российской Федерации. Сайт является составным произведением и представляет собой в том числе каталог товарных знаков (знаков обслуживания), опубликованных в открытых реестрах ФИПС (Роспатент). Исключительное право на товарные знаки (знаки обслуживания) принадлежат их правообладателям.</p>
        {if $_modx->resource.template in [30,20,31,5,6]}
        <p><b>Пример расчета</b><br>Займ в размере 12 000 рублей выдан на 30 дней с пролонгацией. В году 365 дней, по договору ставка составляет 1% в день (годовая ставка, соответственно будет равна 365%). Сумма процентов за год составляет 43 800 руб. (12 000*365% = 43 800), за 1 день 120 руб. (43 800/365 = 120), за 30 дней соответственно 3 600 руб. (120*30 = 3600). Общая сумма платежа составляет 15 600 руб. (12 000 руб. основной долг + 3 600 руб. проценты). <b>ПСК (полная стоимость кредита) в процентах составляет 365% годовых. </b></p>
        {/if}
    </div>
</footer>
