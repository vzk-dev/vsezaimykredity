<div class="row footer__programm">
    {set $rows = 794 | resource : "footer_links_mfo" | fromJSON}
    {foreach $rows as  $row}
        <div class="col-6 col-sm-4 col-lg mb-5">
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