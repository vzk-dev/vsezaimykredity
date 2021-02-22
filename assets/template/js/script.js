$(document).ready(function () {

    /* select2 init */
    $('.select2input').select2({
        minimumResultsForSearch: -1
    });

    check_approved_number();

    $('.main-search-form').submit(function (e) {
        e.preventDefault();
        var $this = $(this);
        var url = '/microloans';

        var param1 = $this.find('select[name="sposob_polucheniya"]').val();
        url += '?sposob_polucheniya=' + param1;

        var checkedValues = '';
        $this.find('.checkbox:checked').each(function () {
            checkedValues = checkedValues + $(this).val() + ',';
        });
        if (checkedValues != '') {
            url += '&options=' + checkedValues
        }
        document.location.href = url;
    });

    $.ionTabs("#main-best-tabs, #tabs_1, #tabs_2", {
        type: "storage",
        onChange: function (obj) {
            initSliders();
        }
    });

    $('.toper').click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 'fast');
        if ($('*').is('#one-page-scroll')) {
            $.fn.fullpage.moveTo(1);
        }
    });

    $('.mobile_filter_button').click(function (e) {
        e.preventDefault();
        $('.msearch2 .sidebar-block').slideToggle();
    });


    $('.toggle-button').click(function (e) {
        e.preventDefault();
        $(this).find('.hamburger').toggleClass('active');
        var target = $(this).data('toggle');
        $('#' + target).toggleClass('active');
    });

    // Показать весь отзыв
    $(document).on("click", '.review-slider-item__gimme_more', function (e) {
        $(this).next().slideDown();
        $(this).prev().slideUp();
        $(this).slideUp();
    });


    $(document).on("click", '.main-menu.active li.parent > a', function (e) {
        e.preventDefault();
        if ($(this).hasClass('clicked')) {
            location.href = $(this).attr('href');
        } else {
            $(this).addClass('clicked');
            if ($(this).parent().hasClass('parent')) {
                $(this).next().slideDown("slow");
            }
        }
        return false;
    });


    //Поиск
    $('.header .icon.search').click(function (e) {
        e.preventDefault();
        $('.search-form-wrapper').addClass('active');
        $('.search-input').focus();
        $('.header').addClass('swhite');
    });

    $('.search-form-wrapper .search-close').click(function (e) {
        e.preventDefault();
        $('.search-form-wrapper').removeClass('active');
        $('.header').removeClass('swhite');
    });

    $(".search-form").submit(function () { //Обработка отправки
        $(".search-results").load("/search", $(".search-form").serialize()).show(); //Загрузка результатов поиска от страницы search.html и показ контейнера
        return false; //Дополнительная заглушка
    });

    $(".search-form input").keyup(function () { //Живой поиск
        if (this.value.length > 2) { //Пользователь набирает больше 2 символов в строке поиска
            $(".search-results").load("/search", $(".search-form").serialize()).show(); //Загрузка результатов поиска от страницы search.html и показ контейнера
        } else {
            $(".search-results").hide(); //Если набрано меньше 2 символов, скрыть контейнер (CSS display:none;)
        }
    });

    $('.head-search-icon').click(function (e) { 
        e.preventDefault();
        $('.livesearch').toggleClass('active');
    });
    $('.livesearch__close').click(function (e) { 
        e.preventDefault();
        $('.livesearch').toggleClass('active');
    });


    // rangeSlider
    $(".js-slider-container").map(function (el, index) {
        var $slider = $(this);
        var $min_input = $(this).next().find('input').eq(0);
        var $max_input = $(this).next().find('input').eq(1);
        var min_value = parseInt($min_input.val());
        var max_value = parseInt($max_input.val());

        var name = $slider.closest('.filter-slider').find('.js-slider-input').attr('name');

        var sliderInput = $slider.closest('.filter-slider').find('.js-slider-input');

        var values = mSearch2.Hash.get();

        var currentValue;
        // console.log('value',values,name);

        if (values[name]) {
            var tmp = values[name].split(mse2Config['values_delimeter']);
            if (tmp[0].match(/(?!^-)[^0-9\.]/g)) {
                tmp[0] = tmp[0].replace(/(?!^-)[^0-9\.]/g, '');
            }
            if (tmp.length > 1) {
                if (tmp[1].match(/(?!^-)[^0-9\.]/g)) {
                    tmp[1] = tmp[1].replace(/(?!^-)[^0-9\.]/g, '');
                }
            }
            // $slider.val(tmp[0]);
            currentValue = tmp[0];
            $slider.closest('.filter-slider').find('.js-slider-input').val(currentValue);
            // console.log('js-slider-input',tmp[0]);
            // imax.val(tmp.length > 1 ? tmp[1] : tmp[0]);
        }


        if (!currentValue) {
            currentValue = min_value;
        }

        // console.log(currentValue,min_value,max_value);

        $slider.slider({
            min: min_value,
            max: max_value,
            range: "min",
            value: currentValue,
            change: function (event, ui) {
                // console.log('chamge',ui);
                sliderInput.val(ui.value);
                mSearch2.submit();
            },
            create: function (event, ui) {
                // sliderInput.val(currentValue);
                $slider.closest('.filter-slider').find('.filter-slider__value').text(currentValue);
                $slider.append('<div class="filter-slider__min_range">' + min_value + '</div>');
                $slider.append('<div class="filter-slider__max_range">' + max_value + '</div>');
            },
            slide: function (event, ui) {
                sliderInput.val(ui.value);
                $slider.closest('.filter-slider').find('.filter-slider__value').text(ui.value);
            }
        });

        sliderInput.on("change", function () {
            $slider.slider("value", sliderInput.val());
            $slider.closest('.filter-slider').find('.filter-slider__value').text(sliderInput.val());
        });

        sliderInput.on("keyup", function () {
            $slider.closest('.filter-slider').find('.filter-slider__value').text(sliderInput.val());
        });

        // $slider.ionRangeSlider({
        //     skin: "round",
        //     type: "single",
        //     min: min_value,
        //     max: max_value,
        //     from: currentValue,
        //     to: max_value,
        //     step: 100,
        //     grid: false,
        //     force_edges: false,
        //     hide_min_max: false,
        //     hide_from_to: false,
        //     block: false,
        //     onStart: function (data) {
        //         $(data.input).closest('.filter-slider').find('.filter-slider__value').text(data.from_pretty);
        //     },
        //     onChange: function (data) {
        //         $(data.input).closest('.filter-slider').find('.filter-slider__value').text(data.from_pretty);
        //     },
        //     onFinish: function (data) {
        //         console.log(data);
        //         // $min_input.val(data.from);
        //         // $max_input.val(data.to);
        //         // mSearch2.submit();
        //     }
        // });
    });

    $('.filter-reset').click(function (e) {
        e.preventDefault();
        // $(".js-slider-container").map(function (el, index) {
        //     var $slider = $(this);
        //     var $min_input = $(this).next().find('input').eq(0);
        //     var min_value = parseInt($min_input.val());
        //     $slider.slider('value',min_value);
        //     $slider.closest('.filter-slider').find('.filter-slider__value').text(min_value);
        // });

        // setTimeout(function(){
        $('.js-slider-input').val('');
        mSearch2.reset();
        // },500);

    });

    $(document).on('mse2_load', function (e, data) {
        console.log(e, data);
    });

    $('.question-item').click(function (e) {
        e.preventDefault();
        $('.question-item').not(this).removeClass('active').find('.question-item__content').slideUp();
        $(this).addClass('active').find('.question-item__content').slideDown();
    });
    
    function initSliders() {
        $(".swiper-container.default").map(function () {
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
                    1100: {
                        slidesPerView: 3,
                        spaceBetween: 40,
                    },
                    900: {
                        slidesPerView: 3,
                        spaceBetween: 40,
                    },
                    768: {
                        slidesPerView: 2,
                        spaceBetween: 30,
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

    $('#calc_rate, #calc_days, #calc_summ').cleave({
        numeral: true,
        numeralThousandsGroupStyle: 'thousand',
        autoUnmask: true,
        numeralDecimalMark: '.',
        delimiter: ' ',
        numeralPositiveOnly: true
    });
    calcMicro();

    $('#calc_rate, #calc_days, #calc_summ').change(function (e) {
        calcMicro();
    });

    $('.calc_process').click(function (e) {
        e.preventDefault();
        calcMicro();
    });


    $('.same-links').showMore({
        minheight: 70,
        buttontxtmore: "Развернуть <i class='fas fa-angle-down'></i>",
        buttontxtless: "Свернуть <i class='fas fa-angle-up'></i>",
    });


    $('.sidebar-block__closable .sidebar-block__title').click(function (e) { 
        e.preventDefault();
        $(this).toggleClass('active');
        $(this).parent().find('.tags-list').slideToggle();
    });

});


// setFrame height
function resizeIframe(height) {
    if (height > 0) {
        $('.main-filters-frame').map(function (iframe, indexOrKey) {
            this.height = height + "px";
        });
    }
}

$('.ionTabs__tab').addClass('autoflash').append('<div class="flash lighting" style="height: 60px;width: 40px;top: 0px;left: -140px;"></div>');


function calcMicro() {

    var kredit_summ = parseInt($('.calc .calc_summ').val());
    var kredit_days = parseInt($('.calc .calc_days').val());
    var kredit_rate = parseFloat($('.calc .calc_rate').val());

    var overpayment = 0; // переплата по процентам
    var overpayment_at_day = 0; // Переплата в день
    var for_return = 0; // К возврату

    $('.calc-info').text('');

    if (kredit_summ && kredit_days && kredit_rate) {
        overpayment = kredit_summ * kredit_rate * 0.01 * kredit_days;
        overpayment_at_day = kredit_summ * kredit_rate * 0.01;
        for_return = kredit_summ + parseInt(kredit_summ * kredit_rate * 0.01 * kredit_days);
    } else {
        $('.calc-info').text('Заполните все поля!');
    }

    $('.calc_overpayment').text(overpayment);
    $('.calc_overpayment_at_day').text(overpayment_at_day);
    $('.calc_return').text(for_return);
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min; 
}


function check_approved_number(){
    var now = new Date();

    var number = window.localStorage.getItem('approved_number_value');
    if(!number){
        number = getRandomInt(126, 391);
        window.localStorage.setItem('approved_number_value', number);
    }

    var last_update = window.localStorage.getItem('approved_number_last_update');
    if(!last_update){
        last_update = new Date( new Date().getTime() + 1 * 60 * 1 * 1000 );
        window.localStorage.setItem('approved_number_last_update', last_update.getTime());
    }

    var update_next = window.localStorage.getItem('approved_number_update_next');
    if(!update_next){
        update_next = new Date( new Date().getTime() + 7 * 24 * 3600 * 1000 );
        window.localStorage.setItem('approved_number_update_next', update_next.getTime());
    }


    if(now >= last_update){
        last_update = new Date( new Date().getTime() + 1 * 60 * 1 * 1000 );
        window.localStorage.setItem('approved_number_last_update', last_update.getTime());
        number = parseInt(number) + getRandomInt(1,10);
        window.localStorage.setItem('approved_number_value', number);
    }

    if(now >= update_next){
        update_next = new Date( new Date().getTime() + 7 * 24 * 3600 * 1000 );
        window.localStorage.setItem('approved_number_update_next', update_next.getTime());
        number = getRandomInt(126, 391);
        window.localStorage.setItem('approved_number_value', number);
    }

    $('.header-number-info__value').html( number );

}