<div class="container">

        {'!pdoCrumbs' | snippet : [
			'to' => $_modx->id,
			'showHome' => 1,
			'tpl' => 'bread_tpl',
			'tplWrapper' => 'bread_tplWrapper',
			'tplCurrent' => 'bread_tplCurrent'
		]}
		