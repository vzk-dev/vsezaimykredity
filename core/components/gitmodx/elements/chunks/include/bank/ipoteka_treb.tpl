{if $_modx->resource.ipoteka_treb}
    {set $rows = json_decode($_modx->resource.ipoteka_treb, true)}
    {foreach $rows as $row}
		{if $row.active == 1}
			<div class="terms">
                <div class="terms-title">{$row.title}</div>
                <div class="terms-value">{$row.text}</div>
            </div>
		{/if}
	{/foreach}
{/if}