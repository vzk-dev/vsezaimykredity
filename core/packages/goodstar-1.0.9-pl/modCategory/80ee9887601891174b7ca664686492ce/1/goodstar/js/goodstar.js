(function (window, document, $, goodStarConfig) {
    var goodStar = goodStar || {};

    goodStar.initialize = function () {
        goodStar.star = $(goodStarConfig.selector);
        goodStar.star.each(function(index, el) {
            var $El = $(el);
            $El.barrating({
                theme: goodStarConfig.theme,
                initialRating: $El.attr('data-current-rating'),
                allowEmpty: false,
                readonly: $El.attr('data-readonly'),

                onSelect: function (value, text,event) {
                    var data = $(event.currentTarget).parents('.br-wrapper').find('.example');

                    $.ajax({
                        method: 'POST',
                        url: goodStarConfig.connectorUrl,
                        data:{
                            thread: data.data('thread'),
                            group: data.data('group'),
                            vote: value
                        },
                        success: function(){
                            $El.barrating('readonly', true);
                        }
                    });
                }
            });
        });

    };


    $(document).ready(function () {
        goodStar.initialize();
    });

    $(document).ajaxComplete(function(){
        goodStar.initialize();
    });

    window.goodStar = goodStar;

})(window, document, jQuery, goodStarConfig);
