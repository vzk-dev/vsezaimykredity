SeoFilter.grid.Rules = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'seofilter-grid-rules';
    }
    Ext.applyIf(config, {
        url: SeoFilter.config.connector_url,
        fields: this.getFields(config),
        columns: this.getColumns(config),
        tbar: this.getTopBar(config),
        sm: new Ext.grid.CheckboxSelectionModel(),
        baseParams: {
            action: 'mgr/rule/getlist'
        },
        stateful: true,
        stateId: config.id,
        listeners: {
            rowDblClick: function (grid, rowIndex, e) {
                var row = grid.store.getAt(rowIndex);
                this.updateRule(grid, e, row);
            }
        },
        viewConfig: {
            forceFit: true,
            enableRowBody: true,
            autoFill: true,
            showPreview: true,
            scrollOffset: 0,
            getRowClass: function (rec) {
                return !rec.data.active
                    ? 'seofilter-grid-row-disabled'
                    : '';
            }
        },
        paging: true,
        remoteSort: true,
        autoHeight: true,
    });
    SeoFilter.grid.Rules.superclass.constructor.call(this, config);

    // Clear selection on grid refresh
    this.store.on('load', function () {
        if (this._getSelectedIds().length) {
            this.getSelectionModel().clearSelections();
        }
    }, this);
};
Ext.extend(SeoFilter.grid.Rules, MODx.grid.Grid, {
    windows: {},

    getMenu: function (grid, rowIndex) {
        var ids = this._getSelectedIds();

        var row = grid.getStore().getAt(rowIndex);
        var menu = SeoFilter.utils.getMenu(row.data['actions'], this, ids);

        this.addContextMenuItem(menu);
    },

    createRule: function (btn, e) {
        var w = MODx.load({
            xtype: 'seofilter-rule-window-create',
            id: Ext.id(),
            listeners: {
                success: {
                    fn: function (res) {
                        if(res.a.result.object.total_message) {
                            MODx.msg.alert(_('seofilter_info'), res.a.result.object.total_message);
                        }
                        this.refresh();
                        Ext.getCmp('seofilter-grid-urls').refresh();
                    }, scope: this
                }
            }
        });
        w.reset();
        w.setValues({active: true, base: true,recount:true, count_where: SeoFilter.config.defaultWhere || ''});
        w.show(e.target);
    },

    updateRule: function (btn, e, row) {
        if (typeof(row) != 'undefined') {
            this.menu.record = row.data;
        }
        else if (!this.menu.record) {
            return false;
        }
        var id = this.menu.record.id;

        MODx.Ajax.request({
            url: this.config.url,
            params: {
                action: 'mgr/rule/get',
                id: id
            },
            listeners: {
                success: {
                    fn: function (r) {
                        // if(this.windows.updateRule) {
                        //     this.windows.updateRule.close();
                        //     this.windows.updateRule.destroy();
                        // }
                        this.windows.updateRule = MODx.load({
                            xtype: 'seofilter-rule-window-update',
                            id: Ext.id(),
                            record: r,
                            listeners: {
                                success: {
                                    fn: function (res) {
                                        if(res.a.result.object.total_message) {
                                            MODx.msg.alert(_('seofilter_info'), res.a.result.object.total_message);
                                        }
                                        this.refresh();
                                        Ext.getCmp('seofilter-grid-urls').refresh();
                                    }, scope: this
                                }
                            }
                        });

                        this.windows.updateRule.reset();
                        this.windows.updateRule.setValues(r.object);
                        this.windows.updateRule.show(e.target);
                    }, scope: this
                }
            }
        });
    },

    removeRule: function () {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.msg.confirm({
            title: ids.length > 1
                ? _('seofilter_rules_remove')
                : _('seofilter_rule_remove'),
            text: ids.length > 1
                ? _('seofilter_rules_remove_confirm')
                : _('seofilter_rule_remove_confirm'),
            url: this.config.url,
            params: {
                action: 'mgr/rule/remove',
                ids: Ext.util.JSON.encode(ids),
            },
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                        Ext.getCmp('seofilter-grid-urls').refresh();
                    }, scope: this
                }
            }
        });
        return true;
    },

    disableRule: function () {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.Ajax.request({
            url: this.config.url,
            params: {
                action: 'mgr/rule/disable',
                ids: Ext.util.JSON.encode(ids),
            },
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        })
    },

    enableRule: function () {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.Ajax.request({
            url: this.config.url,
            params: {
                action: 'mgr/rule/enable',
                ids: Ext.util.JSON.encode(ids),
            },
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        })
    },

    reCounting: function (btn,e) {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.Ajax.request({
            url: this.config.url,
            params: {
                action: 'mgr/rule/recount',
                ids: Ext.util.JSON.encode(ids),
            },
            listeners: {
                success: {
                    fn: function (res) {
                        if(res.message) {
                            MODx.msg.alert(_('seofilter_info'), res.message);
                        }
                        this.refresh();
                        Ext.getCmp('seofilter-grid-urls').refresh();
                    }, scope: this
                }
            }
        })
    },

    duplicateRule: function (btn,e) {
        var r = this.menu.record;
        var w = MODx.load({
            // id: 'seofilter-window-copy-rule',
            id: Ext.id(),
            xtype: 'seofilter-window-copy-rule',
            listeners: {
                success: {
                    fn: function (res) {
                        if(res.a.result.object.total_message) {
                            MODx.msg.alert(_('seofilter_info'), res.a.result.object.total_message);
                        }
                        this.refresh();
                        Ext.getCmp('seofilter-grid-urls').refresh();
                    }, scope: this
                }
            }
        });
        var f = w.fp.getForm();
        f.reset();
        f.setValues({id: r.id, name: _('seofilter_copy')+r.name});
        w.show(e.target);
    },

    getFields: function () {
        return ['id', 'name', 'title', 'base', 'page', 'pages','url', 'active', 'count','rank','fields_where', 'fields', 'actions','link_tpl','pagetitle','editedon', 'seo_id','properties','introtexts','keywords','tpl','length'];
    },

    getColumns: function () {
        return [{
            header: _('seofilter_rule_id'),
            dataIndex: 'id',
            sortable: true,
            width: 50
        }, {
            header: _('seofilter_rule_name'),
            dataIndex: 'name',
            sortable: true,
            width: 125,
        }, {
            header: _('seofilter_rule_page'),
            dataIndex: 'page',
            renderer: SeoFilter.utils.renderResource,
            sortable: true,
            width: 100,
        }, {
            header: _('seofilter_rule_url'),
            dataIndex: 'url',
            sortable: true,
            width: 125,
        }, {
            header: _('seofilter_rule_link_tpl'),
            dataIndex: 'link_tpl',
            sortable: true,
            width: 100,
        }, {
            header: _('seofilter_rule_title'),
            dataIndex: 'title',
            sortable: true,
            width: 100,
        }, {
            header: _('seofilter_rule_editedon'),
            dataIndex: 'editedon',
            sortable: true,
            renderer: SeoFilter.utils.formatDate,
            width: 75,
        }, {
            header: _('seofilter_rule_base'),
            dataIndex: 'base',
            sortable: true,
            renderer: SeoFilter.utils.renderBoolean,
            width: 50,
        // }, {
        //     header: _('seofilter_rule_active'),
        //     dataIndex: 'active',
        //     renderer: SeoFilter.utils.renderBoolean,
        //     sortable: true,
        //     width: 50,
        }, {
            header: _('seofilter_rule_rank'),
            dataIndex: 'rank',
            sortable: true,
            width: 50,
        }, {
            header: _('seofilter_rule_fields_where'),
            dataIndex: 'fields_where',
            sortable: true,
            width: 50,
        }, {
            header: _('seofilter_grid_actions'),
            dataIndex: 'actions',
            renderer: SeoFilter.utils.renderActions,
            sortable: true,
            width: 75,
            id: 'actions'
        }];
    },

    getTopBar: function () {
        return [{
            text: '<i class="icon icon-plus"></i>&nbsp;' + _('seofilter_rule_create'),
            handler: this.createRule,
            scope: this
        },{
            xtype: 'seofilter-combo-resource'
            ,id: 'tbar-seofilter-combo-resource'
            ,width: 200
            ,addall: true
            ,emptyText: _('seofilter_filter_resource')
            ,listeners: {
                select: {fn: this.filterByResource, scope:this}
            }
            ,baseParams: {
                action: 'mgr/system/getlist',
                combo: true,
                rules: true
            }
        },{
            xtype: 'button'
            ,id: 'seofilter-filters-clearres'
            ,text: '<i class="icon icon-times"></i>'
            ,listeners: {
                click: {fn: this.clearFilter, scope: this}
            }
        }, '->', {
            xtype: 'seofilter-field-search',
            width: 250,
            listeners: {
                search: {
                    fn: function (field) {
                        this._doSearch(field);
                    }, scope: this
                },
                clear: {
                    fn: function (field) {
                        field.setValue('');
                        this._clearSearch();
                    }, scope: this
                },
            }
        }];
    },

    filterByResource: function(cb) {
        this.getStore().baseParams['page'] = cb.value;
        this.getBottomToolbar().changePage(1);
        this.refresh();
    },

    clearFilter: function(btn,e) {
        var s = this.getStore();
        s.baseParams['page'] = '';
        Ext.getCmp('tbar-seofilter-combo-resource').setValue('');
        this.getBottomToolbar().changePage(1);
        this.refresh();
    },



    onClick: function (e) {
        var elem = e.getTarget();
        if (elem.nodeName == 'BUTTON') {
            var row = this.getSelectionModel().getSelected();
            if (typeof(row) != 'undefined') {
                var action = elem.getAttribute('action');
                if (action == 'showMenu') {
                    var ri = this.getStore().find('id', row.id);
                    return this._showMenu(this, ri, e);
                }
                else if (typeof this[action] === 'function') {
                    this.menu.record = row.data;
                    return this[action](this, e);
                }
            }
        }
        return this.processEvent('click', e);
    },

    _getSelectedIds: function () {
        var ids = [];
        var selected = this.getSelectionModel().getSelections();

        for (var i in selected) {
            if (!selected.hasOwnProperty(i)) {
                continue;
            }
            ids.push(selected[i]['id']);
        }

        return ids;
    },

    _doSearch: function (tf) {
        this.getStore().baseParams.query = tf.getValue();
        this.getBottomToolbar().changePage(1);
    },

    _clearSearch: function () {
        this.getStore().baseParams.query = '';
        this.getBottomToolbar().changePage(1);
    },
});
Ext.reg('seofilter-grid-rules', SeoFilter.grid.Rules);

