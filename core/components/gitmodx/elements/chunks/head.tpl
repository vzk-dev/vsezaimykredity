<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300;400;500;700&display=swap" rel="stylesheet">
{if $_modx->resource.template in[18]}
<link rel="stylesheet" href="/assets/template/assets/js/ion.tabs-1.0.2/css/ion.tabs.css">
{/if}
{if $_modx->resource.template in[18,25]}
<link rel="stylesheet" href="/assets/template/assets/js/swiper-master/dist/css/swiper.min.css">
{/if}
{*<link rel="stylesheet" href="/assets/template/assets/js/ion.rangeSlider-master/css/ion.rangeSlider.min.css" />*}
<link rel="stylesheet" href="/assets/template/assets/css/style.min.css">
<link rel="stylesheet" href="/assets/template/assets/css/custom.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
{if $_modx->resource.searchable == 1}
	<meta name="robots" content="index, follow">
{else}
	<meta name="robots" content="noindex, nofollow">
{/if}
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<base href="{'site_url' | config}">
<title>{if $_modx->resource.seo_title} {$_modx->resource.seo_title} | {$_modx->config.site_name}{else} {$st_title} | {$_modx->config.site_name}{/if}</title>
<meta name="description" content="{if $_modx->resource.seo_description}{$_modx->resource.seo_description}{else}{$st_desc}{/if}">

{*if 'sf.description' | placeholder}
		{var $pageseodescription = 'sf.description' | placeholder}
	{else}
		{if $_modx->resource.seo_description}
			{var $pageseodescription = $_modx->resource.seo_description}
		{/if}
	{/if}
	<meta name="description" content="{$pageseodescription}" />*}
    
	{*<title>{if 'sf.title' | placeholder}
			{var $pageseotitle = 'sf.title' | placeholder}
			{'sf.title' | placeholder} | {$_modx->config.site_name}
		{else}
			{if $_modx->resource.seo_title}
				{var $pageseotitle = $_modx->resource.seo_title}
				{$_modx->resource.seo_title} | {$_modx->config.site_name}
			{else}
				{var $pageseotitle = $_modx->resource.pagetitle}
				{$_modx->resource.pagetitle} | {$_modx->config.site_name}
			{/if}
		{/if}</title>*}
	
	<!-- Facebook / Open Graph -->
	<meta property="og:url" content="{$_modx->config.site_url}{$_modx->resource.id|url}{if 'sf.url' | placeholder}/{'sf.url' | placeholder}{/if}" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="{if $st_title}{$st_title} | {$_modx->config.site_name}{else}{$_modx->resource.seo_title} | {$_modx->config.site_name}{/if}" />
	<meta property="og:image" content="{if $_modx->resource.img} [[++site_url]][[*img]] {else} [[++site_url]]assets/template/images/minlogo.png {/if}" />
	<meta property="og:description" content="{if $st_desc}{$st_desc}{else}{$_modx->resource.seo_description}{/if}" />
	<meta property="og:site_name" content="[[++site_name]]" />
	<meta property="og:locale" content="ru_RU" />
	<!-- vk -->
	<meta property="vk:image"  content="{if $_modx->resource.img} [[++site_url]][[*img]] {else} [[++site_url]]assets/template/images/logo.png {/if}" />


	{if $_modx->resource.id == 191}
		<link rel="canonical" href="{$_modx->config.site_url}"/>
	{/if}

</head>