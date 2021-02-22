{if !$link_only}
<div class="col-12 col-sm-6 col-md-4">
{/if}
    {*<a href="{$id|url}" class="list-item">
        {if $_pls['tv.img']}
            <img loading="lazy" src="{$_pls["tv.img"] | phpthumbon : "w=300"}">
        {/if}
        <div class="statii__content">
            <div class="statii__title">
                {if $longtitle} {$longtitle} {else} {$pagetitle} {/if}
            </div>
            <div class="statii__data">
                {$publishedon | date : 'd.m.Y'}
            </div>
        </div>
    </a>*}
    <div class="news__inner">
        <a class="news__link" href="{$id|url}">
            <img class="news__image" src="{$_pls["tv.img"] | phpthumbon : "w=300"}" alt="{if $longtitle} {$longtitle} {else} {$pagetitle} {/if}">
            <div class="news__content">
                <div class="news__data">{$publishedon | date : 'd.m.Y'}</div>
                <div class="news__title">{if $longtitle} {$longtitle} {else} {$pagetitle} {/if}</div>
            </div>
        </a>
    </div>
{if !$link_only}
</div>
{/if}