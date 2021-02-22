<?php
if($value){
    $range = explode('-',$value);

    if(is_array($range)){
        $min = $range[0];
        $max = $range[1];
    }
}

if($get_max){
    return $max;
}else{
    return $min;
}