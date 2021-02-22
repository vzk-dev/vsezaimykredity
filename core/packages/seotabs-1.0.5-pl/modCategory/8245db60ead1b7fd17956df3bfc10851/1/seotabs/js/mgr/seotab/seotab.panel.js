SeoTabs.panel.SeoTab = function(config) {
    config = config || {};
    Ext.apply(config,{
        border: false,
        baseCls: 'modx-formpanel',
        cls: 'container',
        items: [{
            html: '<h2>'+_('seotabs_seotab_title')+'</h2>',
            border: false,
            cls: 'modx-page-header'
        }, {
            xtype: 'modx-tabs',
            id: 'seotabs-seotab-tabs',
            defaults: { border: true ,autoHeight: true },
            stateEvents: ['tabchange'],
            getState: function () {
                return {activeTab: this.items.indexOf(this.getActiveTab())};
            },
            items: [{
                title: _('seotabs_tab_seotab'),
                defaults: { autoHeight: true },
                items: [{
                 xtype: 'seotabs-grid-seotab',
                 cls: 'main-wrapper',
                 preventRender: true
                 }]
            }]
        }]
    });
    SeoTabs.panel.SeoTab.superclass.constructor.call(this,config);
};
Ext.extend(SeoTabs.panel.SeoTab,MODx.Panel);
Ext.reg('seotabs-panel-seotab',SeoTabs.panel.SeoTab);