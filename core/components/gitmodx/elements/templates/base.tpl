{var $fixfenom=""}{$fixfenom}
<!DOCTYPE HTML>
<html lang="ru-RU">
{block 'head'}
	{include 'head'}
{/block}
<body id="page-{$_modx->resource.id}" class="{if $_modx->resource.id == $_modx->config.site_start}main-page{else}page-sub{/if}">

	{block 'header'}
		{include 'header'}
	{/block}
	
	{block 'nav'}
		{include 'nav'}
	{/block}
	
	{block 'after_header'}
		{include 'after_header'}
	{/block}

	{block 'body'}
		{if $_modx->resource.pagetitle?}
			<h1>{$_modx->resource.pagetitle}</h1>
		{/if}
		{$_modx->resource.content}
	{/block}


	{block 'before_footer'}
		{include 'before_footer'}
	{/block}

	{block 'footer'}
		{include 'footer'}
	{/block}


{include 'scripts'}

{block 'after_footer'}
{/block}

{if !("dev" | placeholder)}

{else}
	{$_modx->getInfo()}
{/if}
</body>
</html>
