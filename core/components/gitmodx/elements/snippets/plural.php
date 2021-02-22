<?php
$n = (isset($n))? $n: 10;
$word1 = (isset($word1))? $word1: 'отзыв';
$word2 = (isset($word2))? $word2: 'отзыва';
$word5 = (isset($word5))? $word5: 'отзывов';
$plural = $n%10==1&&$n%100!=11?$word1:($n%10>=2&&$n%10<=4&&($n%100<10||$n%100>=20)?$word2:$word5);
return $plural;
?>