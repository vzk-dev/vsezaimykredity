<?php

if(!$location){
    return $where;
}

$location_filter=[
    [
        'city_not:!='=>$location['id'],
        'city_not:NOT LIKE'=>'%||'.$location['id'].'||%',
        ['city_not:NOT LIKE'=>$location['id'].'||%'],
        ['city_not:NOT LIKE'=>'%||'.$location['id']],
        'OR:city_not:IS'=>null
    ],
    [
        'city'=>$location['id'],
        'OR:city:LIKE'=>'%||'.$location['id'].'||%',
        ['OR:city:LIKE'=>$location['id'].'||%'],
        ['OR:city:LIKE'=>'%||'.$location['id']],
        'OR:city:IS'=>null,
    ]
];


// $location_filter=[
//     [
//         'cityex.value:!='=>$location['name'],
//         'OR:cityex.value:IS'=>null,
//         []
//     ],
//     [
//         'cityin.value'=>$location['name'],
//         'OR:cityin.value:IS'=>null,
//         []
//     ]
// ];

// $location_filter = '(
//     `tvssOptionex`.`value` != \''.$location['name'].'\' OR `tvssOptionex`.`value` IS null
// ) AND(
//     `tvssOptionin`.`value` = \''.$location['name'].'\' OR `tvssOptionin`.`value` IS null
// )';



if( isset($where) ) {
    $return = array_merge($location_filter, $where);
}else{
    $return = $location_filter;
}

return $return;
?>