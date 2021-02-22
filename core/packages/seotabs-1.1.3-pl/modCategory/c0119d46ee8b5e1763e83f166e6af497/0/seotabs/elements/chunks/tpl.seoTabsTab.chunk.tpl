<li class="nav-item">
    <a class="seotab nav-link{if $active?} active{/if}" data-id="{$tab.id}"
       {if $tab.seo?}data-alias="{$tab.alias}"{/if} data-seo="{$tab.seo}" data-loaded="{$tab.loaded}" href="#seotab-{$tab.id}">{if $image?}{$image}{/if}{$tab.caption}</a>
</li>