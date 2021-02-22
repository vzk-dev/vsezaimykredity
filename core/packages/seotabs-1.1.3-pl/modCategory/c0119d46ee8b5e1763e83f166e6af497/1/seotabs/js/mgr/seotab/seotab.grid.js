SeoTabs.grid.SeoTab = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'seotabs-grid-seotab';
    }
    Ext.applyIf(config, {
        baseParams: {
            action: 'mgr/seotab/getList',
            rid: config.rid,
            sort: 'rank',
            dir: 'ASC',
        },
        autoExpandColumn: 'id',
        save_action: 'mgr/seotab/updateFromGrid',
        enableDragDrop: true,
        multi_select: true,
        ddGroup: 'dd',
        ddAction: 'mgr/seotab/sort',
    });
    SeoTabs.grid.SeoTab.superclass.constructor.call(this, config);
    this.getStore().on('update', this.handleUpdateStore, this);
};
Ext.extend(SeoTabs.grid.SeoTab, SeoTabs.grid.Default, {
    isRefresh: false,
    getListeners: function () {
        return {
            afteredit: {
                fn: function (e) {
                    if (e.field == 'active') {
                        this.isRefresh = true;
                    }
                },
                scope: this
            }
        };
    },
    getFields: function (config) {
        return ['id', 'rid', 'name', 'caption', 'alias', 'image', 'title', 'description', 'keywords', 'field', 'content', 'seo', 'rank', 'enabled', 'active', 'properties', 'actions'];
    },
    getColumns: function (config) {
        return [config.sm, {
            header: _('seotabs_header_id'),
            dataIndex: 'id',
            sortable: true,
            hidden: true,
        }, {
            header: _('seotabs_header_caption'),
            dataIndex: 'caption',
            sortable: true,
            editor: {
                xtype: 'textfield'
            },
        }, {
            header: _('seotabs_header_name'),
            dataIndex: 'name',
            sortable: true,
            editor: {
                xtype: 'textfield'
            },
        }, {
            header: _('seotabs_header_seo'),
            dataIndex: 'seo',
            sortable: true,
            editor: {
                xtype: 'combo-boolean',
                renderer: 'boolean'
            }
        }, {
            header: _('seotabs_header_rank'),
            dataIndex: 'rank',
            sortable: true,
            editor: {
                xtype: 'numberfield'
            },
        }, {
            header: _('seotabs_header_active'),
            dataIndex: 'active',
            sortable: true,
            width: 60,
            editor: {
                xtype: 'combo-boolean',
                renderer: 'boolean'
            }
        }, {
            header: _('seotabs_header_enabled'),
            dataIndex: 'enabled',
            sortable: true,
            width: 60,
            editor: {
                xtype: 'combo-boolean',
                renderer: 'boolean'
            },
        }, {
            header: _('seotabs_header_actions'),
            dataIndex: 'actions',
            renderer: SeoTabs.utils.renderActions,
            width: 60

        }];
    },
    getTopBar: function (config) {
        var tbar = [];
        tbar.push({
            text: '<i class="icon icon-plus"></i> ' + _('seotabs_btn_add_tab'),
            handler: this.addTab,
            cls: 'primary-button',
            scope: this
        });
        tbar.push({
            text: '<i class="fa fa-cogs"></i> ',
            menu: [{
                text: '<i class="fa fa-clone green"></i> ' + _('seotabs_btn_copy_resource_tabs'),
                cls: 'seotabs-cogs',
                handler: this.copyResourceTabs,
                scope: this
            }, {
                text: '<i class="fa fa-power-off blue"></i> ' + _('seotabs_menu_multiple_enable'),
                cls: 'seotabs-cogs',
                handler: this.enableTab,
                scope: this
            }, {
                text: '<i class="fa fa-power-off gray"></i> ' + _('seotabs_menu_multiple_disable'),
                cls: 'seotabs-cogs',
                handler: this.disableTab,
                scope: this
            }, {
                text: '<i class="fa fa-trash-o red"></i> ' + _('seotabs_menu_multiple_remove'),
                cls: 'seotabs-cogs',
                handler: this.removeTab,
                scope: this
            }]
        });
        tbar.push('->', this.getSearchField());

        return tbar;
    },
    actionTab: function (method) {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.Ajax.request({
            url: SeoTabs.config.connector_url,
            params: {
                action: 'mgr/seotab/multiple',
                method: method,
                ids: Ext.util.JSON.encode(ids),
            },
            listeners: {
                success: {
                    fn: function (response) {
                        this.refresh();
                    }, scope: this
                },
                failure: {
                    fn: function (response) {
                        MODx.msg.alert(_('error'), response.message);
                    }, scope: this
                },
            }
        })
    },
    addTab: function (btn, e, row) {
        var record = {
            rid: this.rid || 0,
            seo: 0,
            active: 0,
            enabled: 1,
            content: '',
            title: SeoTabs.config.title_default,
            description: SeoTabs.config.description_default
        };
        var w = Ext.getCmp('seotabs-window-seotab-create');
        if (w) {
            w.close();
        }
        w = MODx.load({
            xtype: 'seotabs-window-seotab-create',
            id: 'seotabs-window-seotab-create',
            record: record,
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        });
        w.fp.getForm().reset();
        w.fp.getForm().setValues(record);
        w.show(e.target);
    },
    copyResourceTabs: function (btn, e, row) {
        var record = {
            target: SeoTabs.config.rid
        };
        var w = Ext.getCmp('seotabs-window-seotab-copy');
        if (w) {
            w.close();
        }
        w = MODx.load({
            xtype: 'seotabs-window-seotab-copy',
            id: 'seotabs-window-seotab-copy',
            record: record,
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        });
        w.fp.getForm().reset();
        w.fp.getForm().setValues(record);
        w.show(e.target);
    },
    updateTab: function (btn, e, row) {
        if (typeof (row) != 'undefined') {
            this.menu.record = row.data;
        }
        var id = this.menu.record.id;
        MODx.Ajax.request({
            url: SeoTabs.config.connector_url,
            params: {
                action: 'mgr/seotab/get',
                id: id
            },
            listeners: {
                success: {
                    fn: function (r) {
                        var w = Ext.getCmp('seotabs-window-seotab-update');
                        if (w) {
                            w.close();
                        }
                        w = MODx.load({
                            xtype: 'seotabs-window-seotab-update',
                            id: 'seotabs-window-seotab-update',
                            record: r.object,
                            listeners: {
                                success: {
                                    fn: function () {
                                        this.refresh();
                                    }, scope: this
                                },
                            }
                        });
                        w.fp.getForm().reset();
                        w.fp.getForm().setValues(r.object);
                        w.show(e.target);
                    }, scope: this
                }
            }
        });
    },
    enableTab: function () {
        this.actionTab('enable');
    },
    disableTab: function () {
        this.actionTab('disable');
    },
    removeTab: function () {
        var ids = this._getSelectedIds();
        Ext.MessageBox.confirm(
            _('seotabs_title_win_remove'),
            ids.length > 1
                ? _('seotabs_confirm.multiple_remove')
                : _('seotabs_confirm_remove'),
            function (val) {
                if (val == 'yes') {
                    this.actionTab('remove');
                }
            }, this
        );
    },
    handleUpdateStore: function (store, record, operation) {
        if (operation == 'commit' && this.isRefresh) {
            this.refresh();
            this.isRefresh = false;
        }
    }
});
Ext.reg('seotabs-grid-seotab', SeoTabs.grid.SeoTab);


SeoTabs.window.CreateSeoTab = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        title: config.record.id ? _('seotabs_title_win_update') : _('seotabs_title_win_create'),
        baseParams: {
            action: config.record.id ? 'mgr/seotab/update' : 'mgr/seotab/create'
        }
    });
    SeoTabs.window.CreateSeoTab.superclass.constructor.call(this, config);
    this.on('afterrender', function () {
        this.setup(config);
    }, this);
};
Ext.extend(SeoTabs.window.CreateSeoTab, SeoTabs.window.Default, {
    translitloading: false,
    setup: function (config) {
        if (config.record.seo == 1) {
            this.showFieldAlias(true);
        } else {
            this.showFieldAlias(false);
        }
    },
    getTabs: function (config) {
        return [{
            title: _('seotabs_tab_main_params'),
            itemId: 'main-tab',
            cls: 'seotabs-tab',
            items: this.getMainFields(config)
        }]
    },
    getFields: function (config) {
        return [{
            xtype: 'modx-tabs',
            id: 'seotabs-seotab-tabs',
            defaults: {
                layout: 'form',
                border: true,
                autoHeight: true,
            },
            //stateEvents: ['tabchange'],
            getState: function () {
                return {activeTab: this.items.indexOf(this.getActiveTab())};
            },
            items: this.getTabs(config)
        }];
    },
    getMainFields: function (config) {
        return [{
            xtype: 'hidden',
            name: 'id',
        }, {
            xtype: 'hidden',
            name: 'rid',
        }, {
            xtype: 'seotabs-field',
            fieldLabel: _('seotabs_label_caption'),
            description: '<b>[[+caption]]</b>',
            name: 'caption',
            allowBlank: false,
            anchor: '100%',
            enableKeyEvents: true,
            listeners: {
                keyup: {
                    fn: this.handleChangeCaption, scope: this
                },
                blur: {
                    fn: this.handleChangeCaption, scope: this
                }
            }
        }, {
            xtype: 'label',
            html: _('seotabs_label_caption_help'),
            cls: 'desc-under'
        }, {
            xtype: 'seotabs-field-do',
            fieldLabel: _('seotabs_label_name'),
            description: '<b>[[+name]]</b>',
            triggerClass: 'x-field-combo-btn-language',
            triggerTitle: _('seotabs_btn_translit'),
            name: 'name',
            allowBlank: false,
            anchor: '100%',
            enableKeyEvents: true,
            listeners: {
                keyup: {
                    fn: this.handleChangeFieldUser, scope: this
                },
                blur: {
                    fn: this.handleChangeFieldUser, scope: this
                },
                do: {
                    fn: this.handleTranslit, scope: this
                }
            },
            validator: function (v) {
                return /^[a-zA-Z\_0-9\.\-]*$/.test(v) ? true : _('seotabs_err_valid_name');
            }
        }, {
            xtype: 'label',
            html: _('seotabs_label_name_help'),
            cls: 'desc-under'
        }, {
            xtype: 'seotabs-combo-boolean',
            fieldLabel: _('seotabs_label_seo'),
            description: '<b>[[+seo]]</b>',
            name: 'seo',
            allowBlank: false,
            anchor: '100%',
            listeners: {
                select: {
                    fn: this.handlerChangeSeo,
                    scope: this
                }
            }
        }, {
            xtype: 'label',
            html: _('seotabs_label_seo_help'),
            cls: 'desc-under'
        }, {
            xtype: 'seotabs-field',
            fieldLabel: _('seotabs_label_alias'),
            description: '<b>[[+alias]]</b><br>' + _('seotabs_label_alias_help'),
            name: 'alias',
            allowBlank: true,
            anchor: '100%',
            triggerClass: 'x-field-combo-btn-language',
            triggerTitle: _('seotabs_btn_translit'),
            enableKeyEvents: true,
            listeners: {
                keyup: {
                    fn: this.handleChangeFieldUser, scope: this
                },
                blur: {
                    fn: this.handleChangeFieldUser, scope: this
                },
                do: {
                    fn: this.handleTranslit, scope: this
                }
            },
        }, {
            xtype: 'seotabs-field',
            fieldLabel: _('seotabs_label_title'),
            description: '<b>[[+title]]</b>',
            name: 'title',
            allowBlank: true,
            anchor: '100%',
        }, {
            xtype: 'label',
            html: _('seotabs_label_title_help'),
            cls: 'desc-under'
        }, {
            xtype: 'textarea',
            fieldLabel: _('seotabs_label_description'),
            description: '<b>[[+description]]</b>',
            name: 'description',
            allowBlank: true,
            anchor: '100%'
        }, {
            xtype: 'label',
            html: _('seotabs_label_description_help'),
            cls: 'desc-under'
        }, {
            xtype: 'seotabs-field',
            fieldLabel: _('seotabs_label_field'),
            description: '<b>[[+field]]</b>',
            name: 'field',
            allowBlank: true,
            anchor: '100%',
        }, {
            xtype: 'label',
            html: _('seotabs_label_field_help'),
            cls: 'desc-under'
        }, {
            xtype: Ext.ComponentMgr.types['modx-texteditor'] ? 'modx-texteditor' : 'textarea',
            mimeType: 'text/plain',
            height: 150,
            fieldLabel: _('seotabs_label_content'),
            description: '<b>[[+content]]</b>',
            name: 'content',
            allowBlank: true,
            anchor: '100%',
        }, {
            xtype: 'label',
            html: _('seotabs_label_content_help'),
            cls: 'desc-under'
        }, {
            xtype: 'seotabs-combo-image',
            fieldLabel: _('seotabs_label_image'),
            description: '<b>[[+image]]</b>',
            name: 'image',
            allowBlank: true,
            anchor: '100%',
        }, {
            xtype: 'label',
            html: _('seotabs_label_image_help'),
            cls: 'desc-under'
        }/*, {
            xtype: 'numberfield',
            fieldLabel: _('seotabs_label_rank'),
            description: '<b>[[+rank]]</b>',
            name: 'rank',
            allowBlank: true,
            anchor: '100%',
        }, {
            xtype: 'label',
            html: _('seotabs_label_rank_help'),
            cls: 'desc-under'
        }*/, {
            xtype: 'seotabs-combo-boolean',
            fieldLabel: _('seotabs_label_active'),
            description: '<b>[[+active]]</b>',
            name: 'active',
            allowBlank: false,
            anchor: '100%',
        }, {
            xtype: 'label',
            html: _('seotabs_label_active_help'),
            cls: 'desc-under'
        }, {
            xtype: 'seotabs-combo-boolean',
            fieldLabel: _('seotabs_label_enabled'),
            description: '<b>[[+enabled]]</b>',
            name: 'enabled',
            allowBlank: false,
            anchor: '100%',
        }, {
            xtype: 'label',
            html: _('seotabs_label_enabled_help'),
            cls: 'desc-under'
        }];
    },
    showFieldAlias: function (show) {
        var f = this.fp.getForm(),
            caption = f.findField('caption'),
            alias = f.findField('alias');
        if (show) {
            alias.show();
            alias.allowBlank = false;
            alias.setSize(caption.getSize());
        } else {
            alias.hide();
            alias.allowBlank = true;

        }
        alias.validate();
    },
    handlerChangeSeo: function (combo, records) {
        if (combo.getValue()) {
            this.showFieldAlias(true);
        } else {
            this.showFieldAlias(false);
        }
    },
    handleChangeFieldUser: function (f) {
        f.isUserChange = true;
    },
    handleChangeCaption: function (f) {
        if (!this.record.id) {
            var caption = Ext.util.Format.stripTags(f.getValue());
            this.translit(caption, function (str) {
                var f = this.fp.getForm(),
                    name = f.findField('name'),
                    alias = f.findField('alias');
                if (!name.isUserChange) {
                    name.setValue(str);
                }
                if (!alias.isUserChange) {
                    alias.setValue(str);
                }
            });
        }
    },
    handleTranslit: function (f) {
        var form = this.fp.getForm(),
            caption = Ext.util.Format.stripTags(form.findField('caption').getValue());
        this.translit(caption, function (str) {
            f.setValue(str);
        });
    },
    translit: function (string, cb) {
        if (!this.translitloading) {
            this.translitloading = true;
            MODx.Ajax.request({
                url: MODx.config.connector_url,
                params: {
                    action: 'resource/translit',
                    string: string,
                },
                listeners: {
                    success: {
                        fn: function (r) {
                            if (!Ext.isEmpty(r.object.transliteration)) {
                                if (Ext.isFunction(cb)) {
                                    cb.call(this, r.object.transliteration);
                                }
                            }
                            this.translitloading = false;
                        }, scope: this
                    }
                }
            });
        }
    }
});
Ext.reg('seotabs-window-seotab-create', SeoTabs.window.CreateSeoTab);

SeoTabs.window.UpdateSeoTab = function (config) {
    config = config || {};
    Ext.applyIf(config, {});
    SeoTabs.window.UpdateSeoTab.superclass.constructor.call(this, config);
};

Ext.extend(SeoTabs.window.UpdateSeoTab, SeoTabs.window.CreateSeoTab);
Ext.reg('seotabs-window-seotab-update', SeoTabs.window.UpdateSeoTab);

SeoTabs.window.CopyTabs = function (config) {
    config = config || {};
    Ext.apply(config, {
        title: _('seotabs_title_win_copy'),
        saveBtnText: _('seotabs_btn_copy'),
        baseParams: {
            action: 'mgr/seotab/copy'
        }
    });
    SeoTabs.window.CopyTabs.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.window.CopyTabs, SeoTabs.window.Default, {
    getFields: function (config) {
        return [{
            xtype: 'hidden',
            name: 'target'
        }, {
            xtype: 'seotabs-combo-resource',
            fieldLabel: _('seotabs_label_source_resource'),
            name: 'source',
            target: config.record.target,
            msgTarget: 'under',
            anchor: '100%',
            allowBlank: false,

        }, {
            xtype: 'label',
            html: _('seotabs_label_source_resource_help'),
            cls: 'desc-under'
        }]
    }
});
Ext.reg('seotabs-window-seotab-copy', SeoTabs.window.CopyTabs);