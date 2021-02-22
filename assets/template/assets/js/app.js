$(document).ready(function() {
    $('.select2input').select2({
        minimumResultsForSearch: -1
    });
});

$(document).ready(function() {
    function initSliders() {
        $(".swiper-container.bank").map(function() {
            var $el = $(this);
            var nextButton = $el.parent().find('.swiper-button-next');
            var prevButton = $el.parent().find('.swiper-button-prev');

            new Swiper($(this), {
                slidesPerView: 4,
                spaceBetween: 45,
                loop: true,
                // pagination: {
                //     el: '.swiper-pagination',
                //     clickable: true,
                // },
                navigation: {
                    nextEl: nextButton,
                    prevEl: prevButton,
                },
                breakpoints: {
                    1199: {
                        slidesPerView: 0,
                        spaceBetween: 40,
                    },
                    991: {
                        slidesPerView: 2,
                        spaceBetween: 40,
                    },
                    /*780: {
                        slidesPerView: 2,
                        spaceBetween: 45,
                    },*/
                    667: {
                        slidesPerView: 1,
                        spaceBetween: 20,
                    }
                }
            });

        });
    }

    initSliders();
});

$(document).ready(function() {
    
    function initSliders() {
        $(".swiper-container.banki").map(function() {
            var $el = $(this);
            var nextButton = $el.parent().find('.swiper-button-next');
            var prevButton = $el.parent().find('.swiper-button-prev');

            new Swiper($(this), {
                slidesPerView: 6,
                spaceBetween: 45,
                loop: true,
                // pagination: {
                //     el: '.swiper-pagination',
                //     clickable: true,
                // },
                navigation: {
                    nextEl: nextButton,
                    prevEl: prevButton,
                },
                breakpoints: {
                    1199: {
                        slidesPerView: 4,
                        spaceBetween: 40,
                    },
                    900: {
                        slidesPerView: 3,
                        spaceBetween: 40,
                    },
                    780: {
                        slidesPerView: 3,
                        spaceBetween: 45,
                    },
                    667: {
                        slidesPerView: 1,
                        spaceBetween: 20,
                    }
                }
            });

        });
    }

    initSliders();
});


$('.toggle-button').click(function(e) {
    e.preventDefault();
    $(this).find('.hamburger').toggleClass('active');
    var target = $(this).data('toggle');
    $('#' + target).toggleClass('active');
});

$('.mobile_filter_button').click(function(e) {
    e.preventDefault();
    $('.filtr').slideToggle();
});

$('.mobile-help-info').click(function(e) {
    e.preventDefault();
    $('.mobile-help-info-open').slideToggle();
});

$('#category-content.category-content').showMore({
    minheight: 78,
    buttontxtmore: "Развернуть <span class='open-image'></span>",
    buttontxtless: "Свернуть <span class='close-image'></span>",
});