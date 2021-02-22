function SeoTabs(options) {
    this.options = {
        meta: {},
        tabTrigger: '.seotab',
        ajax: 0,
        clsActive: 'active',
        clsLoading: 'loading',
    };
    $.extend(true, this.options, options);
    this.setup();
}

SeoTabs.prototype.setup = function () {
    this.isJoinMeta = false;
    this.currentTab = null;
    var startMeta = this.options.meta[this.options.startActiveTabId];
    if (startMeta && startMeta.title) {
        this.isJoinMeta = true;
    }
    this.bindEvents();
};

SeoTabs.prototype.bindEvents = function () {
    var self = this;
    $(this.options.tabTrigger).on('click', function (e) {
        e.preventDefault();
        if (self.loading) return;
        self.currentTab = $(this);
        if (!self.currentTab.data('loaded')) {
            var ids = [self.currentTab.data('id')];
            if (self.options.ajax && !self.isSeoTab(self.currentTab)) {
                ids = $.merge(ids, self.getSimpleTabIds());
            }
            self.load(ids);
        } else {
            self.setMeta();
        }
        self.currentTab.tab('show');
    });
    if (this.hasSupportHistory()) {
        $(window).bind('popstate', function (e) {
            self.popState(window.history.state);
        })
    }
};

SeoTabs.prototype.switchToTab = function (id) {
    var tab = $(this.options.tabTrigger + '[data-id="' + id + '"]').eq(0);
    if (!tab.length) return;
    this.currentTab = tab;
    this.currentTab.tab('show');
};

SeoTabs.prototype.load = function (ids, callback) {
    var self = this,
        params = {
            ids: ids,
            rid: this.options.rid,
            action: 'seotab/get'
        };
    this.beforeLoad();
    $.ajax({
        dataType: 'json',
        type: 'POST',
        cache: false,
        url: this.options.url,
        data: params,
        success: function (r) {
            if (r.success) {
                var currentTabId =self.currentTab.data('id');
                $.each(r.object, function (id, tab) {
                    if (currentTabId == id) {
                        self.setMeta(tab.meta);
                    }
                    $('#seotab-' + id).html(tab.content);
                });
            } else {
                console.error(r.message);
            }
        },
        complete: function (r) {
            self.afterLoad();
            if (callback && $.isFunction(callback)) {
                callback.call(this, r, params);
            }
        },
        error: function (r) {
            console.error('error', r);
        }
    });
};

SeoTabs.prototype.setMeta = function (meta) {
    var id = this.currentTab.data('id'),
        alias = this.currentTab.data('alias');
    if (!id) return;
    if (typeof meta !== 'undefined') {
        this.options.meta[id] = meta;
    }
    meta = this.options.meta[id] || {};
    this.setHistory({id: id, alias: alias, meta: meta});
    this.updatePageMeta(meta)
};

SeoTabs.prototype.updatePageMeta = function (meta) {
    var self = this;
    $.each(meta, function (key, val) {
        switch (key) {
            case 'description':
                $('meta[name="description"]').attr('content', val);
                break;
            case 'title':
                self.setMetaTitle(val);
                break;
            default:
                $(key).html(val);
        }
    });
};

SeoTabs.prototype.setMetaTitle = function (title) {
    var separator = this.options.replaceseparator || ' - ';
    if (parseInt(this.options.replacebefore)) {
        var arrTitle = $('title').text().split(separator);
        if (arrTitle.length > 1) {
            if (!this.isJoinMeta) {
                if (title) {
                    arrTitle.unshift(title);
                    this.isJoinMeta = true;
                }
            } else {
                if (arrTitle[1].toString() === title) {
                    arrTitle.shift();
                    this.isJoinMeta = false;
                } else if (title) {
                    arrTitle[0] = title;
                } else {
                    arrTitle.shift();
                    this.isJoinMeta = false;
                }
            }
        } else if (title) {
            arrTitle.unshift(title);
            this.isJoinMeta = true;
        }
        title = arrTitle.join(separator);
    }
    $('title').html(title);
};

SeoTabs.prototype.beforeLoad = function () {
    this.loading = true;
    this.currentTab.addClass(this.options.clsLoading);
    this.getContentElement().addClass(this.options.clsLoading);

};

SeoTabs.prototype.afterLoad = function () {
    this.loading = false;
    if (this.options.ajax == 1) {
        var self = this,
            isSeoCurrentTab = this.isSeoTab(this.currentTab),
            tabs = $(this.options.tabTrigger);
        tabs.each(function () {
            var tab = $(this);
            if (isSeoCurrentTab) {
                if (tab.attr('href') != self.currentTab.attr('href')) {
                    self.resetTab(tab);
                }
            } else {
                if (self.isSeoTab(tab)) {
                    self.resetTab(tab);
                } else {
                    tab.data('loaded', 1);
                }
            }
        });
    }
    this.currentTab
        .data('loaded', 1)
        .removeClass(this.options.clsLoading);
    this.getContentElement().removeClass(this.options.clsLoading);
};
SeoTabs.prototype.getSimpleTabIds = function () {
    var ids = [],
        tabs = $(this.options.tabTrigger + '[data-seo="0"]');
    tabs.each(function () {
        var tab = $(this);
        ids.push(tab.data('id'));
    });
    return ids;
}
SeoTabs.prototype.resetTab = function (tab) {
    tab.data('loaded', 0);
    $(tab.attr('href')).html('');
};
SeoTabs.prototype.isSeoTab = function (tab) {
    return tab.data('seo') ? true : false;
};
SeoTabs.prototype.getContentElement = function () {
    return $(this.currentTab.attr('href'));
};

SeoTabs.prototype.popState = function (state) {
    if (!state || $.isEmptyObject(state)) return;
    this.switchToTab(state.id);
    this.updatePageMeta(state.meta);
};

SeoTabs.prototype.setHistory = function (data) {
    var url = this.options.pageUrl,
        hasSlash = this.hasEndUrlSlash(url),
        extension = this.getUrlExtension(url);
    if (data.alias) {
        if (extension) {
            var aliases = url.split('/'),
                lastAlias = aliases[aliases.length - 1];
            aliases.pop();
            url = aliases.join('/') + '/' + data.alias + '/' + lastAlias;
        } else {
            if (!hasSlash) {
                url += '/';
            }
            url += data.alias + '/';
            if (
                this.options.redirect != 2 ||
                this.options.redirect == 0 && !hasSlash
            ) {
                url = url.slice(0, -1);
            }
        }
    }

    url += window.location.search;
    url += window.location.hash;

    if (url == window.location.hash) return;
    if (this.hasSupportHistory()) {
        window.history.pushState({SeoTab: url, id: data.id, meta: data.meta}, '', url);
    } else {
        window.location.hash = url;
    }
};

SeoTabs.prototype.hasEndUrlSlash = function (url) {
    return url.slice(-1) == '/' ? true : false;
};

SeoTabs.prototype.getUrlExtension = function (url) {
    return /[.]/.exec(url);
};

SeoTabs.prototype.hasSupportHistory = function () {
    return (window.history && history.pushState) ? true : false;
};
