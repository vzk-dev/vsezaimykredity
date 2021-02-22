{extends 'template:base'}

{block 'body'}

<h1 class="news-title">{if $_modx->resource.longtitle} {$_modx->resource.longtitle} {else} {$_modx->resource.pagetitle} {/if}</h1>
<div class="page-info mb-5">

	<div class="row">
		{'!pdoPage' | snippet : [
			'tpl' => 'news-item',
			'limit' => 15,
			'parents' => $_modx->resource.id,
			'includeTVs' => 'img',
		]}
	</div>
			  

	{'content'|resource}

	
</div>

{/block}

