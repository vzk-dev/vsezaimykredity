function getScrollDuration(fast) { return fast || $.isMobileDevice ? 0 : 468; }

$.scrollTo = function (options) {

    var o = $.extend({
        container: window,
        x: false,
        y: false,
        duration: getScrollDuration()
    }, options || {});

    if (o.duration > 0) {
        var to = {};
        if (o.x !== false) to.scrollLeft = o.x;
        if (o.y !== false) to.scrollTop = o.y;
        $(o.container == window ? 'html, body' : o.container).animate(to, o.duration, 'easeOutCirc');
        return new Promise(function (resolve) {
            setTimeout(function () {
                resolve(o);
            }, o.duration + 1);
        });
    }

    var to = {
        behavior: 'instant'
    };
    if (o.x !== false) to.left = o.x;
    if (o.y !== false) to.top = o.y;
    o.container.scrollTo(to);
    return Promise.resolve(o);

}

$.scrollProgress = (function () {

    var doc = document.documentElement,
        updateFunc = null,
        endFunc = null,
        progress = 0,
        end = false,
        timeStart = null,
        timeEnd = null;

    return {

        init: function (el, u, e) {
            updateFunc = u;
            endFunc = e;
            $(window).on('scroll.progress', this.update);
            $(window).on('resize.progress', this.update);
            this.update();
        },

        update: $.throttle(250, function () {
            if (timeStart == null) timeStart = Date.now();
            progress = (doc.scrollTop || window.pageYOffset) / ((doc.scrollHeight - window.innerHeight) || 1) * 100;
            if (progress == 0 && doc.scrollHeight == window.innerHeight) progress = 100;
            updateFunc(progress);
            if (progress >= 100 && !end) {
                timeEnd = Date.now();
                end = true;
                if (endFunc) endFunc(timeEnd - timeStart);
            }
        })

    };

})();

$(document).ready(function () {

    var bottom = $('#footer, #comments-vk, #comments').first();

    var getScrollBottom = function () {
        return bottom.length ? bottom.offset().top - 51 : $(document).height();
    };

    var scrollToTop = function (e) {
        //e.stopPropagation();
        $.scrollTo({
            y: 0
        });
        //return false;
    };

    var scrollToBottom = function (e) {
        //e.stopPropagation();
        $.scrollTo({
            y: getScrollBottom()
        });
        //return false;
    };

    var ds = $('<div class="desktop-scroller"><div class="ds-up"><i class="arrow-up"></i></div><div class="ds-down"><i class="arrow-down"></div></i></div>');
    ds.find('.ds-up').click(scrollToTop).after('<div class="scroll-progress"><span>0</span>%</div>');
    ds.find('.ds-down').click(scrollToBottom);
    $('body').append(ds);

    var p = $('.scroll-progress');
    $.scrollProgress.init(window, function (v) {
        p.find('span').text(Math.round(v));
    }, function (t) {
        // _c(t + ' seconds to bottom');
    });

});