SeoTabs.panel.Tabs = function (config) {
    config = config || {};
    Ext.apply(config, {
        border: false,
        baseCls: 'modx-formpanel',
        cls: 'container',
        items: [{
            html: _('seotabs_page_header_tree_tabs'),
            xtype: 'modx-header'
        },{
            xtype: 'modx-tabs',
            id: 'seotabs-seotab-tabs',
            defaults: {border: true, autoHeight: true},
            stateEvents: ['tabchange'],
            getState: function () {
                return {activeTab: this.items.indexOf(this.getActiveTab())};
            },
            items: [{
                title: _('seotabs_tabs_tab_tree_tabs'),
                defaults: {autoHeight: true},
                items: [{
                    html: '<p>' + _('seotabs_tabs_tree_intro_msg') + '</p>',
                    xtype: 'modx-description'
                }, {
                    xtype: 'seotabs-tree-tabs-resource',
                    cls: 'main-wrapper'
                }]
            }]
        }]
    });
    SeoTabs.panel.Tabs.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.panel.Tabs, MODx.Panel);
Ext.reg('seotabs-panel-tabs', SeoTabs.panel.Tabs);