<li class="nav-item">
    <a class="seotab nav-link{if $active?} active{/if}" data-id="{$tab.id}"
       {if $tab.seo?}data-alias="{$tab.alias}"{/if} {if $active && $tab.seo} data-loaded="1"{/if}
       href="#seotab-{$tab.id}">{if $image?}{$image}{/if}{$tab.caption}</a>
</li>