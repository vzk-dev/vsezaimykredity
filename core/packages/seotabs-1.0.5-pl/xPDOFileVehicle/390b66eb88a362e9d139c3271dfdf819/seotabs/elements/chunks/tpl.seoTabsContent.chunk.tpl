<div role="tabpanel" class="tab-pane{if $active?} active{/if}" id="seotab-{$tab.id}">
    {$tab.content}
    {if $tab.field?}{$res[$tab.field]}{/if}
</div>