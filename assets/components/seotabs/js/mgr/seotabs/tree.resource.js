SeoTabs.tree.TabsResource = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        url: SeoTabs.config.connector_url,
        title: '',
        anchor: '100%',
        autoHeight: true,
        rootVisible: false,
        expandFirst: true,
        enableDD: false,
        action: 'mgr/seotab/resource/getnodes',
        tbarCfg: {id: this.id ? this.id + '-tbar' : 'seotabs-tree-resource-tbar'},
        baseParams: {
            action: 'mgr/seotab/resource/getnodes',
            currentResource: 0,
            currentAction: 0,
            class_key: this.class_key || 'modResource',
        },
    });
    SeoTabs.tree.TabsResource.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.tree.TabsResource, MODx.tree.Tree, {
    _showContextMenu: function (n, e) {
        n.select();
        this.cm.activeNode = n;
        this.cm.removeAll();
        var m = [];
        m.push({
            text: '<i class="x-menu-item-icon icon icon-eye"></i> ' + _('resource_view'),
            handler: function () {
                this.resourceView(this.cm.activeNode.attributes.pk);
            }
        });
        this.addContextMenuItem(m);
        this.cm.showAt(e.xy);
        e.stopEvent();
    },
    resourceView: function (id) {
        window.open('/manager/?a=resource/update&id=' + id, '_blank');
    }
});
Ext.reg('seotabs-tree-tabs-resource', SeoTabs.tree.TabsResource);