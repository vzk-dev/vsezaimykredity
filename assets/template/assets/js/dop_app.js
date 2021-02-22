$(document).ready(function () {
    
    $('.header__search').click(function (e) { 
        e.preventDefault();
        $('.livesearch').toggleClass('active');
    });
    $('.livesearch__close').click(function (e) { 
        e.preventDefault();
        $('.livesearch').toggleClass('active');
    });
    
    $(".arrow").click(function (e) {
        e.preventDefault();
        $(this).toggleClass("open-arrow");
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
    
    $('.f_links.footer__row').showMore({
        minheight: 160,
        buttontxtmore: "<i class='fas fa-ellipsis-h'></i>",
        buttontxtless: "<i class='fas fa-ellipsis-h'></i>",
    });
    
    
    
    
    
});




//Развернуть/Свернуть
$(document).on("click", ".close, .open-expand", function (e) {
    e.preventDefault(); 
    $(this).closest(".card-offer-bg").find(".card-offer-details").slideToggle(); 
    $(this).closest(".credits-offer-bg").find(".card-offer-details").slideToggle(); 
}); 


/*function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min; 
}*/

/*Рандомный счетчик для чисел
check_approved_number();
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

    $('.product-bid').html( number );
}
*/


/*Подсчет в кнопку загрузить еще*/
$(function(){
  function getCountPagesForLoad() {
    var 
      total = parseInt($('#mse2_total').text()),
      pageNo = parseInt($('.mse2_pagination .page-item.active > .page-link').text()),
      resultOnPage = 10, // количество элементов на странице по умолчанию
      output = '';
    //console.log('total = ' + total); // всего результатов
    //console.log('pageNo = ' + pageNo); // текущая страница
    if ((pageNo) * resultOnPage < total && (pageNo + 1) * resultOnPage >= total) {
      output = total - pageNo * resultOnPage;    
    } else if ((pageNo + 1) * resultOnPage < total) {
      output = resultOnPage;
    }
    return output;
  } 
  $('.btn_more').text('Загрузить ещё ' + getCountPagesForLoad()); 
  $(document).on('mse2_load', function() {
    $('.btn_more').text('Загрузить ещё ' + getCountPagesForLoad()); 
  });
});

/*Табуляция*/
let tabsBtn   = document.querySelectorAll(".tabs__nav-btn");
let tabsItems = document.querySelectorAll(".tabs__item");

tabsBtn.forEach(onTabClick);

function onTabClick(item) {
    item.addEventListener("click", function() {
        let currentBtn = item;
        let tabId = currentBtn.getAttribute("data-tab");
        let currentTab = document.querySelector(tabId);

        if( ! currentBtn.classList.contains('active') ) {
            tabsBtn.forEach(function(item) {
                item.classList.remove('active');
            });
    
            tabsItems.forEach(function(item) {
                item.classList.remove('active');
            });
    
            currentBtn.classList.add('active');
            currentTab.classList.add('active');
        }
        else {
            
        }
        
    });
    document.querySelector('.tabs__nav-btn').click();
}

function findGetParameter(parameterName) {
    var result = null,
        tmp = [];
    var items = location.search.substr(1).split("&");
    for (var index = 0; index < items.length; index++) {
        tmp = items[index].split("=");
        if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
    }
    return result;
}

$(function(){
    
    $(document).on("click", ".open-card_get-other-cards", function (e) {
        e.preventDefault(); 
        var parentId = $(this).data('mod-parent-id');
        var $current_button = $(this);
        var req_params = {
            action: "filter",
            limit: 100,
            parents: parentId,
            pageId: parentId,
            key: mse2Config.key,
            groupby: "modResource.id",
            tpl: 1,
            clear_cache: 1,
            depth: 0
          };
         
        if (findGetParameter('time')) req_params.time = req_params.time_range = findGetParameter('time');
        if (findGetParameter('age')) req_params.age_range = findGetParameter('age');
        if (findGetParameter('summ')) req_params.summ_range = findGetParameter('summ');
            
        $.post(
          mse2Config.actionUrl,
          req_params,
            function loadDopCards(data)
            {
                data = JSON.parse(data);
                console.log(data);
                $('.card-offer-bg[data-mod-parent-id="'+parentId+'"]').append('<div class="card-offer-bg_others">'+data.data.results+'</div>');
                
                $('.calc_summ').change();
                $current_button.removeClass('open-card_get-other-cards').addClass('open-card_hide-other-cards');
            }
        );
    }); 
    
    $(document).on("click", ".open-card_hide-other-cards", function (e) {
        $(this).closest('.card-offer-bg').find('.card-offer-bg_others').hide();
        $(this).removeClass('open-card_hide-other-cards').addClass('open-card_show-other-cards');
    });
    
    $(document).on("click", ".open-card_show-other-cards", function (e) {
        $(this).closest('.card-offer-bg').find('.card-offer-bg_others').show();
        $(this).removeClass('open-card_show-other-cards').addClass('open-card_hide-other-cards');
    });
});
         