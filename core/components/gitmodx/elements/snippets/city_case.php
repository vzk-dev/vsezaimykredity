<?php
if ($UserLocation = $modx->getService('userlocation.UserLocation', '', MODX_CORE_PATH.'components/userlocation/model/')) {
    $UserLocation->initialize($modx->context->key, $scriptProperties);
}

$location = $UserLocation->getLocation();
if ($UserLocation->checkLocation($location)) {
    $locations = $UserLocation->processLocation($location);
}else{
    return '';
}


$city_object = $modx->getObject('ulLocation', $locations['id']);
$city_name = $city_object->get('name');
$description_raw = $city_object->get('description');

if( $description_raw!='' AND $city_name != ''){
    if( $description = json_decode($description_raw,1) ){
        if(!$case OR $case == "И"){
            return $city_name;
        }

        if(!empty($description[$case])){
            return $description[$case];
        }
    }
}


return '';