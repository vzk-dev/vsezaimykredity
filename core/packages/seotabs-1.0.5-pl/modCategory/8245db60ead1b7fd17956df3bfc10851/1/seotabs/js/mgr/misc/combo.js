SeoTabs.combo.ComboBox = function (config) {
    Ext.applyIf(config, {
        hiddenName: config.name || '',
        url: SeoTabs.config.connector_url,
        triggerConfig: {
            tag: 'span',
            cls: 'x-field-combo-btns',
            cn: [
                {
                    tag: 'div',
                    cls: 'x-form-trigger',
                    trigger: ''
                },
                {
                    tag: 'div',
                    cls: 'x-form-trigger x-field-combo-btn-clear',
                    trigger: 'clear',
                }
            ]
        }
    });
    SeoTabs.combo.ComboBox.superclass.constructor.call(this, config);
    this.addEvents('clear');
};
Ext.extend(SeoTabs.combo.ComboBox, MODx.combo.ComboBox, {
    onTriggerClick: function (event, btn) {
        if (this.disabled) return;
        switch (btn.getAttribute('trigger')) {
            case 'clear':
                this.clearValue();
                this.fireEvent('clear', this);
                break;
            default:
                MODx.combo.ComboBox.superclass.onTriggerClick.call(this);
        }
    }
});
Ext.reg('seotabs-combo', SeoTabs.combo.ComboBox);

SeoTabs.field.Field = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        xtype: 'twintrigger',
        msgTarget: 'under',
        triggerAction: 'all',
        onTrigger1Click: this._triggerClear
    });
    SeoTabs.field.Field.superclass.constructor.call(this, config);
    this.addEvents('clear');
};
Ext.extend(SeoTabs.field.Field, Ext.form.TwinTriggerField, {
    initComponent: function () {
        Ext.form.TwinTriggerField.superclass.initComponent.call(this);
        this.triggerConfig = {
            tag: 'span',
            cls: 'x-field-combo-btns one',
            cn: [
                {
                    tag: 'div',
                    cls: 'x-form-trigger x-field-combo-btn-clear'
                }
            ]
        };
    },
    _triggerClear: function () {
        Ext.form.TwinTriggerField.superclass.setValue.call(this, '');
        this.fireEvent('clear', this);
    }
});
Ext.reg('seotabs-field', SeoTabs.field.Field);

SeoTabs.field.FieldDo = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        xtype: 'twintrigger',
        msgTarget: 'under',
        triggerAction: 'all',
        triggerClass: 'x-field-combo-btn-play',
        triggerTitle: '',
        onTrigger1Click: this._triggerDo,
        onTrigger2Click: this._triggerClear
    });
    SeoTabs.field.Field.superclass.constructor.call(this, config);
    this.addEvents('clear', 'do');
};
Ext.extend(SeoTabs.field.FieldDo, SeoTabs.field.Field, {
    initComponent: function () {
        Ext.form.TwinTriggerField.superclass.initComponent.call(this);
        this.triggerConfig = {
            tag: 'span',
            cls: 'x-field-combo-btns',
            cn: [
                {
                    tag: 'div',
                    cls: 'x-form-trigger ' + this.triggerClass,
                    title: this.triggerTitle,
                }, {
                    tag: 'div',
                    cls: 'x-form-trigger x-field-combo-btn-clear',
                    title: '',
                }
            ]
        };
    },
    _triggerDo: function () {
        this.fireEvent('do', this);
    }
});
Ext.reg('seotabs-field-do', SeoTabs.field.FieldDo);


SeoTabs.combo.Redirect = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        store: new Ext.data.SimpleStore({
            fields: ['d', 'v'],
            data: [
                [_('seotabs_redirect_0'), 0],
                [_('seotabs_redirect_1'), 1],
                [_('seotabs_redirect_2'), 2],
                [_('seotabs_redirect_3'), 3],
                [_('seotabs_redirect_4'), 4],
                [_('seotabs_redirect_5'), 5],
                [_('seotabs_redirect_6'), 6],
            ]
        }),
        displayField: 'd',
        valueField: 'v',
        mode: 'local',
        triggerAction: 'all',
        editable: false,
        forceSelection: true,
    });
    SeoTabs.combo.Redirect.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.combo.Redirect, SeoTabs.combo.ComboBox);
Ext.reg('seotabs-combo-redirect', SeoTabs.combo.Redirect);

SeoTabs.combo.Image = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        triggerClass: 'x-form-image-trigger'
    });
    SeoTabs.combo.Image.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.combo.Image, MODx.combo.Browser);
Ext.reg('seotabs-combo-image', SeoTabs.combo.Image);

SeoTabs.combo.Boolean = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        store: new Ext.data.SimpleStore({
            fields: ['d', 'v'],
            data: [
                [_('yes'), 1],
                [_('no'), 0],
            ]
        }),
        displayField: 'd',
        valueField: 'v',
        hiddenName: config.name || '',
        mode: 'local',
        triggerAction: 'all',
        editable: false,
        forceSelection: true,
        listeners: {
            afterrender: function (combo) {
                var val = this.getValue();
                if (val == 'false' || val == false) {
                    val = 0;
                } else if (val == 'true' || val == true) {
                    val = 1;
                }
                this.setValue(val);
            }
        }
    });
    SeoTabs.combo.Boolean.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.combo.Boolean, SeoTabs.combo.ComboBox);
Ext.reg('seotabs-combo-boolean', SeoTabs.combo.Boolean);

SeoTabs.combo.Ctx = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        displayField: 'name',
        hiddenName: config.name || 'key',
        valueField: 'key',
        fields: ['name', 'key'],
        pageSize: 20,
        typeAhead: true,
        editable: true,
        minChars: 2,
        forceSelection: true,
        baseParams: {
            combo: true,
            action: 'mgr/system/context/getlist'
        },
        tpl: new Ext.XTemplate('\
            <tpl for=".">\
                <div class="x-combo-list-item">\
                    <span>\
                        <b>{name}</b>\
                        <tpl if="key"> ({key})</tpl>\
                    </span>\
                </div>\
            </tpl>',
            {compiled: true}
        ),
    });
    SeoTabs.combo.Ctx.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.combo.Ctx, SeoTabs.combo.ComboBox);
Ext.reg('seotabs-combo-ctx', SeoTabs.combo.Ctx);

SeoTabs.combo.Resource = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        displayField: 'pagetitle',
        valueField: 'id',
        fields: ['id', 'pagetitle', 'parents', 'context_key', 'context_name'],
        minChars: 2,
        pageSize: 10,
        editable: true,
        baseParams: {
            action: 'mgr/seotab/resource/getList',
            target: config.target || 0,
            combo: true
        },
        tpl: new Ext.XTemplate('\
            <tpl for=".">\
                <div class="x-combo-list-item minishop2-product-list-item" ext:qtip="{pagetitle}">\
                    <tpl if="parents">\
                        <span class="parents">\
                         <nobr><small>{context_name} / </small></nobr>\
                            <tpl for="parents">\
                                <nobr><small>{pagetitle} / </small></nobr>\
                            </tpl>\
                        </span><br/>\
                    </tpl>\
                    <span><small>({id})</small> <b>{pagetitle}</b></span>\
                </div>\
            </tpl>', {compiled: true}
        )
    });
    SeoTabs.combo.Resource.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.combo.Resource, SeoTabs.combo.ComboBox);
Ext.reg('seotabs-combo-resource', SeoTabs.combo.Resource);

SeoTabs.combo.Template = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        displayField: 'templatename',
        hiddenName: config.name || 'template',
        valueField: 'id',
        editable: true,
        minChars: 2,
        forceSelection: true,
        pageSize: 20,
        fields: ['id', 'templatename', 'description', 'category_name'],
        tpl: new Ext.XTemplate('<tpl for="."><div class="x-combo-list-item"><span style="font-weight: bold">{templatename:htmlEncode}</span>'
            , '<tpl if="category_name"> - <span style="font-style:italic">{category_name:htmlEncode}</span></tpl>'
            , '<br />{description:htmlEncode()}</div></tpl>'),
        url: MODx.config.connector_url,
        baseParams: {
            action: 'element/template/getlist',
            combo: 1
        }
    });
    SeoTabs.combo.Template.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.combo.Template, SeoTabs.combo.ComboBox);
Ext.reg('seotabs-combo-template', SeoTabs.combo.Template);

SeoTabs.combo.Clipboard = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        xtype: 'twintrigger',
        allowBlank: false,
        msgTarget: 'under',
        triggerAction: 'all',
        onTrigger1Click: this._triggerCopy
    });
    SeoTabs.combo.AccessToken.superclass.constructor.call(this, config);
};
Ext.extend(SeoTabs.combo.Clipboard, Ext.form.TwinTriggerField, {
    initComponent: function () {
        Ext.form.TwinTriggerField.superclass.initComponent.call(this);
        this.triggerConfig = {
            tag: 'span',
            cls: 'x-field-combo-btns one',
            cn: [
                {
                    tag: 'div',
                    cls: 'x-form-trigger x-field-combo-btn-copy',
                    title: _('msimportexport_copy_to_clipboard')
                }
            ]
        };
    },

    _triggerCopy: function () {
        Clipboard.copy(this.getValue());
        MODx.msg.status({
            title: _('success'),
            message: _('msimportexport_copied_to_clipboard'),
            dontHide: false
        });
    }
});
Ext.reg('seotabs-field-clipboard', SeoTabs.combo.Clipboard);

SeoTabs.combo.Search = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        xtype: 'twintrigger',
        ctCls: 'x-field-search',
        allowBlank: true,
        msgTarget: 'under',
        emptyText: _('search'),
        name: 'query',
        triggerAction: 'all',
        clearBtnCls: 'x-field-combo-btn-clear',
        searchBtnCls: 'x-field-combo-btn-search',
        onTrigger1Click: this._triggerSearch,
        onTrigger2Click: this._triggerClear,
    });
    SeoTabs.combo.Search.superclass.constructor.call(this, config);
    this.on('render', function () {
        this.getEl().addKeyListener(Ext.EventObject.ENTER, function () {
            this._triggerSearch();
        }, this);
    });
    this.addEvents('clear', 'search');
};
Ext.extend(SeoTabs.combo.Search, Ext.form.TwinTriggerField, {

    initComponent: function () {
        Ext.form.TwinTriggerField.superclass.initComponent.call(this);
        this.triggerConfig = {
            tag: 'span',
            cls: 'x-field-combo-btns',
            cn: [
                {tag: 'div', cls: 'x-form-trigger ' + this.searchBtnCls},
                {tag: 'div', cls: 'x-form-trigger ' + this.clearBtnCls}
            ]
        };
    },

    _triggerSearch: function () {
        this.fireEvent('search', this);
    },

    _triggerClear: function () {
        this.fireEvent('clear', this);
    },

});
Ext.reg('seotabs-combo-search', SeoTabs.combo.Search);
