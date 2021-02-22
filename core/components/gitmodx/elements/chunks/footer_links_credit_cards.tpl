<div class="row footer__programm">
    {set $rows = 641 | resource : "footer_links_credit_cards" | fromJSON}
    {foreach $rows as  $row}
        <div class="col-6 col-md-4 col-lg-3 mb-2">
            <div class="f_links footer__row">
                <div class="footer__title">{$row.title}</div>
                {set $links = json_decode($row.links, true)}
                <div class="footer__link">
                    {foreach $links as $link}
                        <a class="footer__link-name" href="{$link.link | url}">{$link.text}</a>
                    {/foreach}
                </div>
            </div>
        </div>
    {/foreach}
</div>