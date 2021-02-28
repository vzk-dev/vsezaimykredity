$('#ipoteka_calc_summ_realty_fee, #ipoteka_calc_summ_realty, #ipoteka_calc_time, #credit_calc_summ, #credit_calc_days, #calc_days, #calc_summ, #calc_rate').cleave({
    numeral: true,
    numeralThousandsGroupStyle: 'thousand',
    autoUnmask: true,
    numeralDecimalMark: '.',
    delimiter: ' ',
    numeralPositiveOnly: true
});

var $el_need_cleave = $('.credit_calc_summ , .credit_calc_days , .credit_calc_rate, .calc_summ , .calc_days , .calc_rate');

$el_need_cleave.each(function(indx, element){
    new Cleave(element, {
        numeral: true,
        numeralThousandsGroupStyle: 'thousand',
        numeralDecimalMark: '.',
        numeralPositiveOnly: true,
        delimiter: ' '
    });
});

$(document).on('mse2_load', function (e, data) {
    $('.calc_summ').change();
});

calc();

$('#ipoteka_calc_summ_realty_fee, #ipoteka_calc_summ_realty, #ipoteka_calc_time, #credit_calc_summ, #credit_calc_days, #calc_days, #calc_summ, #calc_rate').change(function (e) {
    calc();
});
    
//Калькуляторы на страницах продуктов
function getValue(selector, options) {
    options = options?options:{text:false, float:false};
    var $el = $(selector);
    if ($el.length === 0) return false;
    var realValue = (options.text)?$el.text():$el.val(),
        trimValue = realValue.replace(/\s/g, '');
    return (options.float)?parseFloat(trimValue):parseInt(trimValue);
}
var options__text = {text:true, float: true};
var options__float = {text:false, float: true};

function setValue(selector, value, options) {
    options = options?options:{text:false, postfix:false};
    var $el = $(selector);
    if ($el.length === 0) return false;
    var formatValue = new Intl.NumberFormat().format(value);
    if (options.postfix) formatValue += options.postfix;
    if (options.text) {
        $el.text(formatValue);
    } else {
        $el.val(formatValue);
    }
    return true;
}
var options__rubls = {text:true, postfix:' руб.'};

function calc() {
    //переменные для ипотеки
    var ipoteka_summ = getValue('.ipoteka_calc_summ_realty'); //стоимость недвижимости
    var ipoteka_summ_fee = getValue('.ipoteka_calc_summ_realty_fee'); //первоначальный взнос
    var ipoteka_rate = getValue('.ipoteka_calc_rate', options__text); //процентная ставка
    var ipoteka_time = getValue('.ipoteka_calc_time'); //срок ипотеки
    var ipoteka_summ_total = ipoteka_summ - ipoteka_summ_fee; //сумма ипотеки
    var ipoteka_monthly_rate = ipoteka_rate / 12 / 100; //ежемесячная процентная ставка
    var ipoteka_general_rate = Math.pow(1 + ipoteka_monthly_rate, ipoteka_time); //общая ставка

    //переменные для кредитов
    var credit_summ = getValue('.credit_calc_summ'); //сумма кредита
    var credit_days = getValue('.credit_calc_days'); //срок кредита в месяцах
    var credit_time = getValue('.credit_calc_rate', options__text); //процентная ставка
    var credit_persent_month = (credit_time / 12 / 100); //ежемесячная процентная ставка
    var credit_coefficients = (credit_persent_month * Math.pow(1 + credit_persent_month, credit_days)) / (Math.pow(1 + credit_persent_month, credit_days) - 1); //коэффициент аннуитета

    //переменные для мфо
    var kredit_summ = getValue('.calc_summ');
    var kredit_days = getValue('.calc_days');
    var kredit_rate = getValue('.calc_rate', options__text);
    var overpayment = 0; // переплата по процентам
    var overpayment_at_day = 0; // Переплата в день
    var for_return = 0; // К возврату
    var kredit_rate_const = getValue('.calc_rate_const', options__text); //страница мфо
    
    $('.calc-info').text('');

    if (ipoteka_summ_total && ipoteka_monthly_rate && ipoteka_general_rate && ipoteka_time) {
        var ipoteka_monthly_payment = Math.ceil(ipoteka_summ_total * ipoteka_monthly_rate * ipoteka_general_rate / (ipoteka_general_rate - 1) * 100) / 100; //ежемесячный платеж
        var ipoteka_overpayment = Math.round(ipoteka_monthly_payment * ipoteka_time - ipoteka_summ_total); //переплата
        var ipoteka_total = ipoteka_summ_total + ipoteka_overpayment; //Общая сумма

        setValue('.ipoteka_total',ipoteka_total,options__rubls);
        setValue('.ipoteka_overpayment',ipoteka_overpayment,options__rubls);
        setValue('.ipoteka_monthly_payment',ipoteka_monthly_payment,options__rubls);
    }
    else if (credit_summ && credit_days && credit_coefficients) {
        var credit_calc_monthly_payment = Math.ceil(credit_summ * credit_coefficients * 100) / 100; //ежемесячный платеж
        var credit_calc_overpayment = Math.ceil(credit_days * credit_calc_monthly_payment - credit_summ);
        var credit_calc_total = credit_summ + credit_calc_overpayment;

        setValue('.credit_calc_total',credit_calc_total,options__rubls);
        setValue('.credit_calc_overpayment',credit_calc_overpayment,options__rubls);
        setValue('.credit_calc_monthly_payment',credit_calc_monthly_payment,options__rubls);
    }
    //это для страницы, например /mfo/credit7
    else if (kredit_summ && kredit_days && kredit_rate_const) {
        overpayment = Math.floor(kredit_summ * kredit_rate_const * 0.01 * kredit_days * 100) / 100;
        overpayment_at_day = Math.floor(kredit_summ * kredit_rate_const * 0.01 * 100) / 100;
        for_return = kredit_summ + parseInt(kredit_summ * kredit_rate_const * 0.01 * kredit_days);

        setValue('.calc_overpayment',overpayment,options__rubls);
        setValue('.calc_overpayment_at_day',overpayment_at_day,options__rubls);
        setValue('.calc_return',for_return,options__rubls);
    }
    else if (kredit_summ && kredit_days && kredit_rate) {
        overpayment = Math.floor(kredit_summ * kredit_rate * 0.01 * kredit_days * 100) / 100;
        overpayment_at_day = Math.floor(kredit_summ * kredit_rate * 0.01 * 100) / 100;
        for_return = kredit_summ + parseInt(kredit_summ * kredit_rate * 0.01 * kredit_days);

        setValue('.calc_overpayment',overpayment,options__rubls);
        setValue('.calc_overpayment_at_day',overpayment_at_day,options__rubls);
        setValue('.calc_return',for_return,options__rubls);
    }
    else {
        for_return = kredit_summ;
        setValue('.calc_overpayment',overpayment,options__rubls);
        setValue('.calc_overpayment_at_day',overpayment_at_day,options__rubls);
        setValue('.calc_return',for_return,options__rubls);
    }

}

//Калькулятор МФО в карточках
function calc_mfo(e) {
    var current_calc = $(e.target).closest('.calc-total')[0];
    //переменные для мфо
    var kredit_summ = getValue($(current_calc).find('.calc_summ'));
    var kredit_days = getValue($(current_calc).find('.calc_days'));
    var kredit_rate = getValue($(current_calc).find('.calc_rate'),options__float);
    var overpayment = 0; // переплата по процентам
    var overpayment_at_day = 0; // Переплата в день
    var for_return = 0; // К возврату

    if (kredit_summ && kredit_days && kredit_rate) {
        overpayment = Math.floor(kredit_summ * kredit_rate * 0.01 * kredit_days * 100) / 100;
        overpayment_at_day = Math.floor(kredit_summ * kredit_rate * 0.01 * 100) / 100;
        for_return = kredit_summ + parseInt(kredit_summ * kredit_rate * 0.01 * kredit_days);

        setValue($(current_calc).find('.calc_overpayment'),overpayment,options__rubls);
        setValue($(current_calc).find('.calc_overpayment_at_day'),overpayment_at_day,options__rubls);
        setValue($(current_calc).find('.calc_return'),for_return,options__rubls);
    }
    else {
        for_return = kredit_summ;

        setValue($(current_calc).find('.calc_overpayment'),overpayment,options__rubls);
        setValue($(current_calc).find('.calc_overpayment_at_day'),overpayment_at_day,options__rubls);
        setValue($(current_calc).find('.calc_return'),for_return,options__rubls);
    }
}

$(function(){
    $(document).on('change', '.calc_days, .calc_summ, .calc_rate', calc_mfo);
    $('.calc_summ').change();
});


//Калькулятор кредита в карточках
function calc_credit(e) {
    var current_calc = $(e.target).closest('.calc-total')[0];
    //переменные для кредитов
    var credit_summ = getValue($(current_calc).find('.credit_calc_summ')); //сумма кредита
    var credit_days = getValue($(current_calc).find('.credit_calc_days')); //срок кредита в месяцах
    var credit_time = getValue($(current_calc).find('.credit_calc_rate'),options__float); //процентная ставка
    var credit_persent_month = (credit_time / 12 / 100); //ежемесячная процентная ставка
    var credit_coefficients = (credit_persent_month * Math.pow(1 + credit_persent_month, credit_days)) / (Math.pow(1 + credit_persent_month, credit_days) - 1); //коэффициент аннуитета


    if (credit_summ && credit_days && credit_coefficients) {
        var credit_calc_monthly_payment = Math.ceil(credit_summ * credit_coefficients * 100) / 100; //ежемесячный платеж
        var credit_calc_overpayment = Math.ceil(credit_days * credit_calc_monthly_payment - credit_summ);
        var credit_calc_total = credit_summ + credit_calc_overpayment;

        setValue($(current_calc).find('.credit_calc_total'),credit_calc_total,options__rubls);
        setValue($(current_calc).find('.credit_calc_overpayment'),credit_calc_overpayment,options__rubls);
        setValue($(current_calc).find('.credit_calc_monthly_payment'),credit_calc_monthly_payment,options__rubls);

    }
}

$(function(){
    $(document).on('change', '.credit_calc_summ, .credit_calc_days, .credit_calc_rate', calc_credit);
    $('.credit_calc_summ').change();
});


//Калькулятор ипотеки в карточках
function calc_ipoteka(e) {
    var current_calc = $(e.target).closest('.calc-total')[0];
    //переменные для ипотеки
    var ipoteka_summ = getValue($(current_calc).find('.ipoteka_calc_summ')); //стоимость недвижимости
    var ipoteka_summ_fee = getValue($(current_calc).find('.ipoteka_calc_summ_realty_fee')); //первоначальный взнос
    var ipoteka_rate = getValue($(current_calc).find('.ipoteka_calc_rate'),options__float); //процентная ставка
    var ipoteka_time = getValue($(current_calc).find('.ipoteka_calc_time')); //срок ипотеки
    var ipoteka_summ_total = ipoteka_summ - ipoteka_summ_fee; //сумма ипотеки
    var ipoteka_monthly_rate = ipoteka_rate / 12 / 100; //ежемесячная процентная ставка
    var ipoteka_general_rate = Math.pow(1 + ipoteka_monthly_rate, ipoteka_time); //общая ставка

    if (ipoteka_summ_total && ipoteka_monthly_rate && ipoteka_general_rate && ipoteka_time) {
        var ipoteka_monthly_payment = Math.ceil(ipoteka_summ_total * ipoteka_monthly_rate * ipoteka_general_rate / (ipoteka_general_rate - 1) * 100) / 100; //ежемесячный платеж
        var ipoteka_overpayment = Math.round(ipoteka_monthly_payment * ipoteka_time - ipoteka_summ_total); //переплата
        var ipoteka_total = ipoteka_summ_total + ipoteka_overpayment; //Общая сумма

        setValue($(current_calc).find('.ipoteka_total'),ipoteka_total,options__rubls);
        setValue($(current_calc).find('.ipoteka_overpayment'),ipoteka_overpayment,options__rubls);
        setValue($(current_calc).find('.ipoteka_monthly_payment'),ipoteka_monthly_payment,options__rubls);
    }
}

$(function(){
    $(document).on('change', '.ipoteka_calc_summ, .ipoteka_calc_summ_realty_fee, .ipoteka_calc_time', calc_ipoteka);
    $('.ipoteka_calc_summ').change();
});