{if $_modx->resource.credit_usloviya}
    {set $rows = json_decode($_modx->resource.credit_usloviya, true)}
    {foreach $rows as $row}
		{if $row.active == 1}
			<div class="terms">
                <div class="terms-title">{$row.title}</div>
                <div class="terms-value">{$row.text}</div>
            </div>
		{/if}
	{/foreach}
{/if}