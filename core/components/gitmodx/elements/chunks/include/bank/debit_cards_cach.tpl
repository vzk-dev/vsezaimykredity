{if $_modx->resource.debit_cards_cach}
    {set $rows = json_decode($_modx->resource.debit_cards_cach, true)}
    {foreach $rows as $row}
		{if $row.active == 1}
			<div class="terms">
                <div class="terms-title">{$row.title}</div>
                <div class="terms-value">{$row.text}</div>
            </div>
		{/if}
	{/foreach}
{/if}