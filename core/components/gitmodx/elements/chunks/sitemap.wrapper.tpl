<?xml version="1.0" encoding="{'modx_charset' | option}"?>
<urlset xmlns="{$schema}">
{$output}
{$_modx->runSnippet('sfSitemap',['tplWrapper'=>'@INLINE {$output}', 'fast'=>1, 'mincount'=>1, 'level'=>0, 'forceXML'=>0])}
</urlset>