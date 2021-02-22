{if $_modx->resource.credit_cards_trebovaniya}
    {set $rows = json_decode($_modx->resource.credit_cards_trebovaniya, true)}
    {foreach $rows as $row}
		{if $row.active == 1}
			<div class="terms">
                <div class="terms-title">{$row.title}</div>
                <div class="terms-value">{$row.text}</div>
            </div>
		{/if}
	{/foreach}
{/if}