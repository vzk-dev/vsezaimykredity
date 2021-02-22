{extends 'template:base'}

{block 'after_header'}
{/block}

{block 'body'}

<div class="site-container">
	<div class="container-main mb-3">
	
		{'!pdoCrumbs' | snippet : [
			'to' => $_modx->id,
			'showHome' => 1,
			'tpl' => 'bread_tpl',
			'tplWrapper' => 'bread_tplWrapper',
			'tplCurrent' => 'bread_tplCurrent'
		]}

        <h1 class="page-title">{$_modx->resource.pagetitle}</h1>

        {'content'|resource}

        {'!pdoPage' | snippet : [
            'parents'=> 0,
            'resources' => $_modx->resource.recomended,
            'tpl' => 'akcii',
            'limit' => 3,
            'includeTVs' => $_modx->getChunk('microloans_tvs'),
            'toPlaceholder' => 'recomended'
        ]}

        {if $_modx->getPlaceholder('recomended')}
                {$_modx->getPlaceholder('recomended')}
        {/if}

    </div>	

</div>
	
{/block}

{block 'before_footer'}
{/block}