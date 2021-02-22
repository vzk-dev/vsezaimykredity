Ext.onReady(function () {
    Ext.ComponentMgr.onAvailable("modx-resource-tabs", function () {
        var tabs = this;
        tabs.on("beforerender", function () {
            tabs.add({
                title: _("seotabs"),
                layout: 'form',
                anchor: '100%',
                autoHeight: true,
                cls: 'container',
                items: [{
                    xtype: 'seotabs-grid-seotab',
                    rid: SeoTabs.config.rid,
                    cls: ''
                }]
            });
        });
    });
});