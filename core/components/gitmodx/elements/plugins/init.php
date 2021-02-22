<?php

/*SET CUSTOM_DEV in placeholder*/
$modx->setPlaceholders(array(
	'dev' => (defined(CUSTOM_DEV) && CUSTOM_DEV!==NULL)?CUSTOM_DEV:false,
));