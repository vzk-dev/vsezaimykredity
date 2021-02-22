<?php
if(empty($_SESSION['cbr_time_update']) || strtotime($_SESSION['cbr_time_update']) < strtotime('-1 hours')){
    $xml = simplexml_load_string(file_get_contents("https://www.cbr.ru/scripts/XML_daily.asp"));
    $json = json_encode($xml);
    $array = json_decode($json);
    if(empty($input)){
        $input = 0;
    }
    $input = $input;
    $eur = 0;
    $usd = 0;
    foreach($array->Valute as $v){
        if(strtolower($v->CharCode) == "eur"){
            $eur = $v->Value;
        }
        if(strtolower($v->CharCode) == "usd"){
            $usd = $v->Value;
        }
    }
    $_SESSION['cbr_eur'] = $eur;
    $_SESSION['cbr_usd'] = $usd;
    $_SESSION['cbr_time_update'] = time();
}else{
    $eur = $_SESSION['cbr_eur'];
    $usd = $_SESSION['cbr_usd'];
}
if(strtolower($cur_input) == "rub"){
    if(strtolower($cur_output) == "eur"){
        return $input/$eur;
    }
    if(strtolower($cur_output) == "usd"){
        return $input/$usd;
    }
}
if(strtolower($cur_input) == "eur"){
    if(strtolower($cur_output) == "rub"){
        return $input*$eur;
    }
    if(strtolower($cur_output) == "usd"){
        return $input*($eur/$usd);
    }
}
if(strtolower($cur_input) == "usd"){
    if(strtolower($cur_output) == "rub"){
        return $input*$usd;
    }
    if(strtolower($cur_output) == "eur"){
        return $input/($eur/$usd);
    }
}
if(strtolower($cur_output) == "rubinusd"){
    return $usd;
}
if(strtolower($cur_output) == "rubineur"){
    return $eur;
}
return "getCurRate"; //Если что-то пошло не так