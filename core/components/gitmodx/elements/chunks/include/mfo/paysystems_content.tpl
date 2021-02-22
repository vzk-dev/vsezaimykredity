<div style="display:flex; flex-wrap:wrap;">
{if $_modx->resource.paysystems_obtaining}
    <div class="col-12 col-md-6 mb-4">
	    <div class="mfo-usloviya">
		    <div class="mfo-usloviya-title">Способы выдачи</div>
		        <div class="mfo-usloviya-list">
		            <ul class="mfo-usloviya-list-obtaining">
		                {set $rows = json_decode($_modx->resource.paysystems_obtaining, true)}
                        {foreach $rows as $row}
		                    {if $row.nactive == 1}
			                    <li>{$row.ntext}</li>
			                {/if}
			            {/foreach}
		            </ul>
		        </div>
	    </div>
    </div>
{/if}

{if $_modx->resource.paysystems_repayment}
    <div class="col-12 col-md-6 mb-4">
	    <div class="mfo-usloviya">
		    <div class="mfo-usloviya-title">Способы погашения</div>
		        <div class="mfo-usloviya-list">
		            <ul class="mfo-usloviya-list-repayment">
		                {set $rows = json_decode($_modx->resource.paysystems_repayment, true)}
                        {foreach $rows as $row}
		                    {if $row.nactive == 1}
			                    <li>{$row.ntext}</li>
			                {/if}
			            {/foreach}
		            </ul>
		        </div>
	    </div>
    </div>
{/if}
</div>
