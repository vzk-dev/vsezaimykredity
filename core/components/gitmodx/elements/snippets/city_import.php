<?php


function get_request($url, $params = NULL) {
    $ch = curl_init();
    if ($params !== NULL && !empty($params)){
        $url .= '?';
        foreach($params as $key => $value) {
            $url .= $key . '=' . curl_escape($ch, $value) . '&';
        }
        $url = rtrim($url, '&');
    }
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch,
                CURLOPT_HTTPHEADER,
                array('Accept: application/json',
                      'Authorization: Basic '.base64_encode("2d782456-2262-46ee-9260-bb93b9cd7db1")));
    $result = curl_exec($ch);
    if ($result === false) { $result = curl_error($ch); }
    $json = json_decode($result,1);
    curl_close($ch);
    return $json;
}

function get_plural($word) {
    $base_url = 'https://ws3.morpher.ru';
    $russian_declension = get_request("{$base_url}/russian/declension", ['s' => $word]);
    return $russian_declension;
}

$where = array(
    'type' => 'city',
    'active' => 0,
    'description' => ''
);
$resources = $modx->getCollection('ulLocation',$where);

$output = '<p>Всего ресурсов: '.count($resources).'</p>';

foreach ($resources as $k => $res) {
    $output .= '<p>['.$k.'] => '.$res->get('name').'</p>';
    $city_name = $res->get('name');
    // $output. = json_decode($res->get('description'),1);

   
    $declension = get_plural($city_name);
    if( empty($declension['code']) ){
        $res->set('description', json_encode($declension));
        $res->save();
    }else{
        $output .='ошибка '.$declension['code'].'<br>';
    }
    
}
// print $output;


// $city_object = $modx->getObject('ulLocation', $_SESSION['userlocation.id']);
// $city_name = $city_object->get('name');
// $output = $city_object->get('description');
// $output = json_encode($declension);



return $output;