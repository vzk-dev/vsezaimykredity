        <tr>
            
            {if $_pls["tv.img"]}
            <td>
                <div class="company-table-rating">
                    <div class="company-table-logo">
                        <a href="{$id | url}">
                        <picture>
                            <source srcset="{$_pls["tv.img"]}" type="image/webp" />
                            <img class="b-lazy product-image__logo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$_pls["tv.img"] | phpthumbon : "w=250"}" alt="{$pagetitle}" />
                        </picture>
                        </a>
                    </div>
                    {*<div class="company-table-stars">
                        <img class="company-table-stars__image" src="assets/img/star.png" alt="">
                        <img class="company-table-stars__image" src="assets/img/star.png" alt="">
                        <img class="company-table-stars__image" src="assets/img/star.png" alt="">
                        <img class="company-table-stars__image" src="assets/img/star.png" alt="">
                        <img class="company-table-stars__image" src="assets/img/star.png" alt="">
                    </div>*}
                </div>
            </td>
            {/if}
            
            {if $_pls["tv.license"]}
            <td>
                <div class="company-table-inner">
                    <div class="company-table-name"><a class="company-table-name__title" href="{$id | url}">{$pagetitle}</a></div>
                        {if $_modx->resource.id== '794' OR $_modx->resource.parent == '794'}
                            <div class="company-table-lic">Лицензия {$_pls["tv.license"]}</div>
                        {/if}
                        {if $_modx->resource.id== '641' OR $_modx->resource.parent == '641'}
                            <div class="company-table-lic">Лицензия ЦБ РФ №{$_pls["tv.license"]}</div>
                        {/if}
                </div>
            </td>
            {/if}
            
            {if $_pls["tv.phone"]}
            <td>
                <div class="company-table-contact">
                    <div class="company-table-phone">
                        <a class="company-table-phone__color" href="tel:{$_pls["tv.phone"] | tel}">{$_pls["tv.phone"]}</a>
                    </div>
                    {if $_pls["tv.address"]}
                        <div class="company-table-address">{$_pls["tv.address"]}</div>
                    {/if}
                </div>
            </td>
            {/if}
            
            {if $_pls["tv.time"]}
             <td data-label="Часы работы">
                <div class="company-table-time-work">{$_pls["tv.time"]}</div>
            </td>
            {/if}

           
            {if $_pls['tv.services_bank']}
             <td data-label="Услуги">
                 <div class="company-table-services">
                    {'!listExplodeTV'|snippet:[
                        'id' => $id,
                        'tv' => 'services_bank',
                        'tpl' => 'listTvServicesBank'
                    ]}
                </div>
                </td>
            {/if}
            {if $_modx->resource.template in [30]}
                {if $_pls["tv.referal_link"]}
                    <td><a href="{$_pls["tv.referal_link"]}" onclick="yaCounter70630705.reachGoal('{$_pls["tv.target"]}'); return true;" class="btn btn-card">Оформить</a></td>
                {else}
                    {if $_pls["tv.link_to_site"]}
                        <td><a href="https://{$_pls["tv.link_to_site"]}" onclick="yaCounter70630705.reachGoal('link'); return true;" class="btn btn-card">Оформить</a></td>
                    {/if}
                {/if}
            {/if}

        </tr>
    