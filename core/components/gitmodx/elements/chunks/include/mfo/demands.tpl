<div class="trebovaniya">
    {if $_modx->resource.demands}
        {set $rows = json_decode($_modx->resource.demands, true)}
            {foreach $rows as $row}
                <div class="trebovaniya-column">
                    <div class="trebovaniya-tab-cell">
                        {if $row.active == 1}
                            <div class="trebovaniya-tab-title">{$row.title}</div>
                            <div class="trebovaniya-tab-desc">{$row.text}</div>
                        {/if}
                    </div>
                </div>
            {/foreach}
        </div>    
    {/if}
</div>