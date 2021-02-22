{if $_modx->resource.fiz_lic}
    <div class="col col-md-6 mb-4">
	    <div class="bank-services-category bank-services-category--bg">
		    <div class="bank-services-title">Для физических лиц</div>
		        <div class="back-services-list">
		            <ul class="back-services-list-fiz">
		                {set $rows = json_decode($_modx->resource.fiz_lic, true)}
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

{if $_modx->resource.ur_lic}
    <div class="col col-md-6 mb-4">
	    <div class="bank-services-category bank-services-category--bg-purple">
		    <div class="bank-services-title">Для физических лиц</div>
		        <div class="back-services-list">
		            <ul class="back-services-list-ur">
		                {set $rows = json_decode($_modx->resource.ur_lic, true)}
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
