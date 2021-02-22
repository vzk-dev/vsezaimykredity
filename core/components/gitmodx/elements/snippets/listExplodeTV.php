<?php

$pdo = $modx->getService('pdoFetch');
$id = $modx->getOption('id', $scriptProperties, $modx->resource->get('id'));
$tv = $modx->getOption('tv', $scriptProperties, false);
$tpl = $modx->getOption('tpl', $scriptProperties, false);

$tvcontent = array();
$query = $modx->newQuery('modTemplateVar',array('name'=>$tv));
$query->select('elements,id');
$query->prepare();
if ($query->prepare() && $query->stmt->execute()) {
  $row = $query->stmt->fetch(PDO::FETCH_ASSOC);
  $elmts = explode('||',$row['elements']);
  foreach ($elmts as $key => $element) {
    $element = explode('==',$element);
    $tvcontent[$element[1]] = $element[0];
  }
  $tvid = $row['id'];
}

$items = array();
$query = $modx->newQuery('modTemplateVarResource', array('contentid' => $id, 'tmplvarid' => $tvid));
$query->select('value');
if($query->prepare() && $query->stmt->execute()) {
  $res = $query->stmt->fetch(PDO::FETCH_ASSOC);
  $items = explode('||', $res['value']);
}

$output = '';
if($tpl){
  foreach ($items as $key => $item) {
    // $modx->setPlaceholder('value', $item);
    // $modx->setPlaceholder('name', $tvcontent[$item]);
    // $output .= $modx->getChunk($tpl);
    $output .= $pdo->getChunk($tpl,['value' => $item,'name'=>$tvcontent[$item]]);
  }
  return $output;
}else{
  foreach ($items as $key => $item) {
    $modx->setPlaceholder('value', $item);
    $modx->setPlaceholder('name', $tvcontent[$item]);
    echo $tvcontent[$item].'=='.$item;
  }
}