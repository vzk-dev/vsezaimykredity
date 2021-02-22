$('#ipoteka_calc_summ_realty_fee, #ipoteka_calc_summ_realty, #ipoteka_calc_time, #credit_calc_summ, #credit_calc_days, #calc_days, #calc_summ, #calc_rate').cleave({
    numeral: true,
    numeralThousandsGroupStyle: 'thousand',
    autoUnmask: true,
    numeralDecimalMark: '.',
    delimiter: ' ',
    numeralPositiveOnly: true
});
calc();

$('#ipoteka_calc_summ_realty_fee, #ipoteka_calc_summ_realty, #ipoteka_calc_time, #credit_calc_summ, #credit_calc_days, #calc_days, #calc_summ, #calc_rate').change(function (e) {
    calc();
});
    
//Калькуляторы на страницах продуктов

function calc() {
    //переменные для ипотеки
    var ipoteka_summ = parseInt($('.ipoteka_calc_summ_realty').val()); //стоимость недвижимости
    var ipoteka_summ_fee = parseInt($('.ipoteka_calc_summ_realty_fee').val()); //первоначальный взнос
    var ipoteka_rate = parseFloat($('.ipoteka_calc_rate').text()); //процентная ставка
    var ipoteka_time = parseInt($('.ipoteka_calc_time').val()); //срок ипотеки
    var ipoteka_summ_total = ipoteka_summ - ipoteka_summ_fee; //сумма ипотеки
    var ipoteka_monthly_rate = ipoteka_rate / 12 / 100; //ежемесячная процентная ставка
    var ipoteka_general_rate = Math.pow(1 + ipoteka_monthly_rate, ipoteka_time); //общая ставка

    //переменные для кредитов
    var credit_summ = parseInt($('.credit_calc_summ').val()); //сумма кредита
    var credit_days = parseInt($('.credit_calc_days').val()); //срок кредита в месяцах
    var credit_time = parseFloat($('.credit_calc_rate').text()); //процентная ставка
    var credit_persent_month = (credit_time / 12 / 100); //ежемесячная процентная ставка
    var credit_coefficients = (credit_persent_month * Math.pow(1 + credit_persent_month, credit_days)) / (Math.pow(1 + credit_persent_month, credit_days) - 1); //коэффициент аннуитета

    //переменные для мфо
    var kredit_summ = parseInt($('.calc_summ').val());
    var kredit_days = parseInt($('.calc_days').val());
    var kredit_rate = parseFloat($('.calc_rate').text());
    var overpayment = 0; // переплата по процентам
    var overpayment_at_day = 0; // Переплата в день
    var for_return = 0; // К возврату
    var kredit_rate_const = parseFloat($('.calc_rate_const').text()); //страница мфо
    
    $('.calc-info').text('');

    if (ipoteka_summ_total && ipoteka_monthly_rate && ipoteka_general_rate && ipoteka_time) {
        ipoteka_monthly_payment = Math.ceil(ipoteka_summ_total * ipoteka_monthly_rate * ipoteka_general_rate / (ipoteka_general_rate - 1) * 100) / 100; //ежемесячный платеж
        ipoteka_overpayment = Math.round(ipoteka_monthly_payment * ipoteka_time - ipoteka_summ_total); //переплата
        ipoteka_total = ipoteka_summ_total + ipoteka_overpayment; //Общая сумма

        $('.ipoteka_total').text(new Intl.NumberFormat().format(ipoteka_total) + ' руб.');
        $('.ipoteka_overpayment').text(new Intl.NumberFormat().format(ipoteka_overpayment) + ' руб.');
        $('.ipoteka_monthly_payment').text(new Intl.NumberFormat().format(ipoteka_monthly_payment) + ' руб.');
    }
    else if (credit_summ && credit_days && credit_coefficients) {
        credit_calc_monthly_payment = Math.ceil(credit_summ * credit_coefficients * 100) / 100; //ежемесячный платеж
        credit_calc_overpayment = Math.ceil(credit_days * credit_calc_monthly_payment - credit_summ);
        credit_calc_total = credit_summ + credit_calc_overpayment;
        
        $('.credit_calc_total').text(new Intl.NumberFormat().format(credit_calc_total) + ' руб.');
        $('.credit_calc_overpayment').text(new Intl.NumberFormat().format(credit_calc_overpayment) + ' руб.');
        $('.credit_calc_monthly_payment').text(new Intl.NumberFormat().format(credit_calc_monthly_payment) + ' руб.');
    }
    //это для страницы, например /mfo/credit7
    else if (kredit_summ && kredit_days && kredit_rate_const) {
        overpayment = Math.floor(kredit_summ * kredit_rate_const * 0.01 * kredit_days * 100) / 100;
        overpayment_at_day = Math.floor(kredit_summ * kredit_rate_const * 0.01 * 100) / 100;
        for_return = kredit_summ + parseInt(kredit_summ * kredit_rate_const * 0.01 * kredit_days);

        $('.calc_overpayment').text(new Intl.NumberFormat().format(overpayment) + ' руб.');
        $('.calc_overpayment_at_day').text(new Intl.NumberFormat().format(overpayment_at_day) + ' руб.');
        $('.calc_return').text(new Intl.NumberFormat().format(for_return) + ' руб.');
    }
    else if (kredit_summ && kredit_days && kredit_rate) {
        overpayment = Math.floor(kredit_summ * kredit_rate * 0.01 * kredit_days * 100) / 100;
        overpayment_at_day = Math.floor(kredit_summ * kredit_rate * 0.01 * 100) / 100;
        for_return = kredit_summ + parseInt(kredit_summ * kredit_rate * 0.01 * kredit_days);

        $('.calc_overpayment').text(new Intl.NumberFormat().format(overpayment) + ' руб.');
        $('.calc_overpayment_at_day').text(new Intl.NumberFormat().format(overpayment_at_day) + ' руб.');
        $('.calc_return').text(new Intl.NumberFormat().format(for_return) + ' руб.');
    }
    else {
        for_return = kredit_summ;
        
        $('.calc_overpayment').text(new Intl.NumberFormat().format(overpayment) + ' руб.');
        $('.calc_overpayment_at_day').text(new Intl.NumberFormat().format(overpayment_at_day) + ' руб.');
        $('.calc_return').text(new Intl.NumberFormat().format(for_return) + ' руб.');
    }

}

//Калькулятор МФО в карточках
function calc_mfo(e) {
    var current_calc = $(e.target).closest('.calc-total')[0];
    //переменные для мфо
    var kredit_summ = parseInt($(current_calc).find('.calc_summ').val());
    var kredit_days = parseInt($(current_calc).find('.calc_days').val());
    var kredit_rate = parseFloat($(current_calc).find('.calc_rate').val());
    var overpayment = 0; // переплата по процентам
    var overpayment_at_day = 0; // Переплата в день
    var for_return = 0; // К возврату
    
    if (kredit_summ && kredit_days && kredit_rate) {
        overpayment = Math.floor(kredit_summ * kredit_rate * 0.01 * kredit_days * 100) / 100;
        overpayment_at_day = Math.floor(kredit_summ * kredit_rate * 0.01 * 100) / 100;
        for_return = kredit_summ + parseInt(kredit_summ * kredit_rate * 0.01 * kredit_days);

        $(current_calc).find('.calc_overpayment').text(new Intl.NumberFormat().format(overpayment) + ' руб.');
        $(current_calc).find('.calc_overpayment_at_day').text(new Intl.NumberFormat().format(overpayment_at_day) + ' руб.');
        $(current_calc).find('.calc_return').text(new Intl.NumberFormat().format(for_return) + ' руб.');
    }
    else {
        for_return = kredit_summ;
        
        $(current_calc).find('.calc_overpayment').text(new Intl.NumberFormat().format(overpayment) + ' руб.');
        $(current_calc).find('.calc_overpayment_at_day').text(new Intl.NumberFormat().format(overpayment_at_day) + ' руб.');
        $(current_calc).find('.calc_return').text(new Intl.NumberFormat().format(for_return) + ' руб.');
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
    var credit_summ = parseInt($(current_calc).find('.credit_calc_summ').val()); //сумма кредита
    var credit_days = parseInt($(current_calc).find('.credit_calc_days').val()); //срок кредита в месяцах
    var credit_time = parseFloat($(current_calc).find('.credit_calc_rate').val()); //процентная ставка
    var credit_persent_month = (credit_time / 12 / 100); //ежемесячная процентная ставка
    var credit_coefficients = (credit_persent_month * Math.pow(1 + credit_persent_month, credit_days)) / (Math.pow(1 + credit_persent_month, credit_days) - 1); //коэффициент аннуитета

    if (credit_summ && credit_days && credit_coefficients) {
        credit_calc_monthly_payment = Math.ceil(credit_summ * credit_coefficients * 100) / 100; //ежемесячный платеж
        credit_calc_overpayment = Math.ceil(credit_days * credit_calc_monthly_payment - credit_summ);
        credit_calc_total = credit_summ + credit_calc_overpayment;
        
        $(current_calc).find('.credit_calc_total').text(new Intl.NumberFormat().format(credit_calc_total) + ' руб.');
        $(current_calc).find('.credit_calc_overpayment').text(new Intl.NumberFormat().format(credit_calc_overpayment) + ' руб.');
        $(current_calc).find('.credit_calc_monthly_payment').text(new Intl.NumberFormat().format(credit_calc_monthly_payment) + ' руб.');
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
    var ipoteka_summ = parseInt($(current_calc).find('.ipoteka_calc_summ').val()); //стоимость недвижимости
    var ipoteka_summ_fee = parseInt($(current_calc).find('.ipoteka_calc_summ_realty_fee').val()); //первоначальный взнос
    var ipoteka_rate = parseFloat($(current_calc).find('.ipoteka_calc_rate').val()); //процентная ставка
    var ipoteka_time = parseInt($(current_calc).find('.ipoteka_calc_time').val()); //срок ипотеки
    var ipoteka_summ_total = ipoteka_summ - ipoteka_summ_fee; //сумма ипотеки
    var ipoteka_monthly_rate = ipoteka_rate / 12 / 100; //ежемесячная процентная ставка
    var ipoteka_general_rate = Math.pow(1 + ipoteka_monthly_rate, ipoteka_time); //общая ставка

    if (ipoteka_summ_total && ipoteka_monthly_rate && ipoteka_general_rate && ipoteka_time) {
        ipoteka_monthly_payment = Math.ceil(ipoteka_summ_total * ipoteka_monthly_rate * ipoteka_general_rate / (ipoteka_general_rate - 1) * 100) / 100; //ежемесячный платеж
        ipoteka_overpayment = Math.round(ipoteka_monthly_payment * ipoteka_time - ipoteka_summ_total); //переплата
        ipoteka_total = ipoteka_summ_total + ipoteka_overpayment; //Общая сумма

        $(current_calc).find('.ipoteka_total').text(new Intl.NumberFormat().format(ipoteka_total) + ' руб.');
        $(current_calc).find('.ipoteka_overpayment').text(new Intl.NumberFormat().format(ipoteka_overpayment) + ' руб.');
        $(current_calc).find('.ipoteka_monthly_payment').text(new Intl.NumberFormat().format(ipoteka_monthly_payment) + ' руб.');
    }
}

$(function(){
    $(document).on('change', '.ipoteka_calc_summ, .ipoteka_calc_summ_realty_fee, .ipoteka_calc_time', calc_ipoteka);
    $('.ipoteka_calc_summ').change();
});