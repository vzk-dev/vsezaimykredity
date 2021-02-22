{extends 'template:base'}

{block 'body'}

{block 'after_header'}
	
{/block}
	
<div class="main-page-header">
		<div class="container">
	
		  <div class="row">
			<div class="col-12 col-lg-8">
	
				<h1 class="page-title">{$_modx->resource.longtitle}</h1>
				<div class="main-page-header__description">{$_modx->resource.introtext}</div>
				<div class="msearch-form">
				  <form method="GET" action="/microloans" class="main-search-form">
	
					<div class="row">
					  <div class="col-12 col-md-9">
	
						<div class="row">
						  <div class="col-12 col-sm-6 mb-4">
							<div class="msearch-form__item">
							  <select name="" class="select2input">
								<option>Микрозайм</option>
								{*<option>Кредитные карты</option>
								<option>Дебетовые карты</option>
								<option>Кредит</option> *}
							  </select>
							</div>
						  </div>
						  <div class="col-12 col-sm-6 mb-4">
							<div class="msearch-form__item">
							  <select name="sposob_polucheniya" class="select2input">
							     <option value="2">На карту</option>
								<option value="1">Наличными</option>
								<option value="3">Киви кошелек</option>
								<option value="5">Яндекс Деньги</option>
								<option value="4">На счет</option>
								<option value="6">Система Контакт</option>
								<option value="7">Золотая Корона</option>
							  </select>
							</div>
						  </div>
						</div>
	
						{*<div class="row">
						  <div class="col-12 col-sm-6 mb-3">
							<div class="msearch-form__item">
							  <input class="checkbox" id="sform-check-1" type="checkbox" name="options[]" value="1">
							  <label for="sform-check-1">С плохой кредитной историей</label>
							</div>
						  </div>
						  <div class="col-12 col-sm-6 mb-3">
							<div class="msearch-form__item">
							  <input class="checkbox" id="sform-check-2" type="checkbox" name="options[]" value="4">
							  <label for="sform-check-2">Без процентов</label>
							</div>
						  </div>
						  <div class="col-12 col-sm-6 mb-3">
							<div class="msearch-form__item">
							  <input class="checkbox" id="sform-check-3" type="checkbox" name="options[]" value="3">
							  <label for="sform-check-3">Круглосуточно</label>
							</div>
						  </div>
						  <div class="col-12 col-sm-6 mb-3">
							<div class="msearch-form__item">
							  <input class="checkbox" id="sform-check-4" type="checkbox" name="options[]" value="5">
							  <label for="sform-check-4">До зарплаты</label>
							</div>
						  </div>
						</div>*}
	
					  </div>
					  <div class="col-12 col-md-3">
						  <button type="submit" class="btn fw">Подобрать</button>
					  </div>
					</div>
	
				  </form>
				</div>
	
			</div>
		  </div>
	
		</div>
	  </div>
	
	  <div class="container main-container">
	  
		  <div class="content">
	
			{*<h2>Предложения для {'!city_case'|snippet:['case'=>'Р']}</h2>
	        <p>Убедитесь, что Вам показываются предложения именно для Вашего города. Вы всегда можете выбрать нужный город в шапке. Если не нашли свой город, то напишите нам и мы обязательно его добавим</p>*}
			<div class="main-best section">
	
			  	<div class="ionTabs" id="main-best-tabs" data-name="best">
					<ul class="ionTabs__head">
						<li class="ionTabs__tab" data-target="micro">Микрозаймы</li>
						<li class="ionTabs__tab" data-target="creditcard">Кредитные карты</li>
						<li class="ionTabs__tab" data-target="debet">Дебетовые карты</li>
						<li class="ionTabs__tab" data-target="credit">Кредиты</li>
					</ul>
					<div class="ionTabs__body">
		
					  <div class="ionTabs__item" data-name="micro">

						<iframe class="main-filters-frame" 
								{* onload="resizeIframe(this)" *}
								seamless 
								src="/index/filtr-micro">
						</iframe>
						
					  </div>
					  <div class="ionTabs__item" data-name="creditcard">
							
						<iframe class="main-filters-frame" 
							{* onload="resizeIframe(this)" *}
							seamless 
							src="/index/filtr-kredit-card">
						</iframe>
							
					  </div>
					  <div class="ionTabs__item" data-name="debet">

						<iframe class="main-filters-frame" 
							{* onload="resizeIframe(this)" *}
							seamless 
							src="/index/filtr-debet-card">
						</iframe>

					  </div>
					  <div class="ionTabs__item" data-name="credit">

						<iframe class="main-filters-frame" 
							{* onload="resizeIframe(this)" *}
							seamless 
							src="/index/filtr-kredit">
						</iframe>

					  </div>
			  
					  <div class="ionTabs__preloader"></div>
				  </div>
			  </div>
	
	
			  
	
	
			</div>
	
			<div class="calc section">
			  <div class="row align-items-stretch">
				<div class="col-12 col-lg-8 mb-5 mb-lg-0">
				  <h2 class="mb-5">Калькулятор переплаты по займу</h2>
				  <div class="row">
					<div class="col-12 col-md-4">
					  <div class="calc-input">
						<label>Введите сумму кредита в рублях:</label>
						<input id="calc_summ" class="calc_summ" type="text" value="20000">
					  </div>
					</div>
					<div class="col-12 col-md-4">
					  <div class="calc-input">
						<label>Срок кредита в днях:</label>
						<input id="calc_days" class="calc_days" type="text" value="14">
					  </div>
					</div>
					<div class="col-12 col-md-4">
					  <div class="calc-input">
						<label>Процентная ставка в день:</label>
						<input id="calc_rate" class="calc_rate" type="text" value="0.5">
					  </div>
					</div>
					<div class="col-12 col-lg-4">
					  <button class="btn fw calc_process">Рассчитать</button>
					</div>
					<div class="col-12 col-lg-4">
					  <div class="calc-info"></div>
					</div>
				  </div>
				</div>
				<div class="col-12 col-lg-4">
				  <div class="calc-result">
					<table>
					  <tbody>
						<tr>
						  <td class="calc-result__propertie-title">Переплата по процентам:</td>
						  <td class="calc-result__propertie-value"><span class="calc_overpayment"></span> руб.</td>
						</tr>
						<tr>
						  <td class="calc-result__propertie-title">Переплата в день:</td>
						  <td class="calc-result__propertie-value"><span class="calc_overpayment_at_day"></span> руб.</td>
						</tr>
						<tr>
						  <td class="calc-result__propertie-title">К возврату:</td>
						  <td class="calc-result__propertie-value price-property"><span class="calc_return"></span> руб.</td>
						</tr>
					  </tbody>
					</table>
				  </div>
				</div>
			  </div>
			</div>
	
		  </div>
	
	
	  </div>
	
	  <div class="section questions">
		<div class="container">
			<h2 class="text-center">Частые вопросы посетителей</h2>
			<div class="questions-list">
				{'!pdoResources' | snippet : [
					'tpl' => 'faq-item',
					'limit' => 8,
					'parents' => 10, 
					'includeContent' => 1,
				]}
			</div>
		</div>
	  </div>
	  
	
	  <div class="section recomended">
		<div class="container">
			<h2 class="text-center mb-5">Рейтинг</h2>
	
			<div class="ionTabs" id="tabs_1" data-name="rating-tab">
	
			  <div class="text-center">
				<ul class="ionTabs__head">
					<li class="ionTabs__tab" data-target="Tab_1_1">Микрозаймы</li>
					<li class="ionTabs__tab" data-target="Tab_1_2">Кредитные карты</li>
					<li class="ionTabs__tab" data-target="Tab_1_3">Дебетовые карты</li>
					<li class="ionTabs__tab" data-target="Tab_1_4">Кредиты</li>
				</ul>
			  </div>
	
				<div class="ionTabs__body">
	
					<div class="ionTabs__item" data-name="Tab_1_1">
	
						<div class="slider-container">
						  	<div class="swiper-container default">
								<div class="swiper-wrapper">

									{set $location = ''|getUserLocation}

									{set $leftJoin = [
										'tvssOption_in'=>[
											'class' => 'tvssOption',
											'on' => '`modResource`.`id` = `tvssOption_in`.`resource_id` AND `tvssOption_in`.`tv_id` = 65'
										],
										'tvssOption_ex'=>[
											'class' => 'tvssOption',
											'on' => '`modResource`.`id` = `tvssOption_ex`.`resource_id` AND `tvssOption_ex`.`tv_id` = 66'
										]
									]}

									{set $where = [
										'view_at_rating'=>1,
										[
											'tvssOption_ex.value:!=' => $location.name,
											'OR:tvssOption_ex.value:IS'=>null
										],
										[
											'tvssOption_in.value' => $location.name,
											'OR:tvssOption_in.value:IS'=>null
										]
									]}
									
									{'!pdoResources' | snippet : [
										'tpl' => 'loan-item-min',
										'limit' => 8,
										'parents' => 15, 
										'includeTVs' => $_modx->getChunk('microloans_tvs'),
										'tvPrefix' => 'tv.',
										'sortby' => ['rating_sort'=>'DESC','menuindex'=>'ASC'],
										'is_slider' => 1,
										'where' => $where|toJSON,
										'leftJoin' => $leftJoin|toJSON,
										'groupby'=>'modResource.id',
										'loadModels'=>'tvsuperselect',
									]}
								</div>
								<div class="swiper-pagination"></div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
	
					</div>
					<div class="ionTabs__item" data-name="Tab_1_2">

						<div class="slider-container">
							<div class="swiper-container default">
							  <div class="swiper-wrapper">
								  
								  {'!pdoResources' | snippet : [
									'tpl' => 'loan-item-min',
									'limit' => 8,
									'parents' => 39, 
									'includeTVs' => $_modx->getChunk('credit_cards_tvs'),
									'sortby' => ['rating_sort'=>'DESC','menuindex'=>'ASC'],
									'is_slider' => 1,
									'where' => $where|toJSON,
									'leftJoin' => $leftJoin|toJSON,
									'groupby'=>'modResource.id',
									'loadModels'=>'tvsuperselect',
								  ]}
							  </div>
							  <div class="swiper-pagination"></div>
						  </div>
						  <div class="swiper-button-next"></div>
						  <div class="swiper-button-prev"></div>
					  </div>

					</div>
					<div class="ionTabs__item" data-name="Tab_1_3">
						
						<div class="slider-container">
							<div class="swiper-container default">
								<div class="swiper-wrapper">
									
									{'!pdoResources' | snippet : [
										'tpl' => 'loan-item-min',
										'limit' => 8,
										'parents' => 42, 
										'includeTVs' => $_modx->getChunk('debit_card_tvs'),
										'sortby' => ['rating_sort'=>'DESC','menuindex'=>'ASC'],
										'is_slider' => 1,
										'where' => $where|toJSON,
										'leftJoin' => $leftJoin|toJSON,
										'groupby'=>'modResource.id',
										'loadModels'=>'tvsuperselect',
									]}
								</div>
								<div class="swiper-pagination"></div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
						
					</div>
					<div class="ionTabs__item" data-name="Tab_1_4">
						
						<div class="slider-container">
							<div class="swiper-container default">
								<div class="swiper-wrapper">
									
									{'!pdoResources' | snippet : [
										'tpl' => 'loan-item-min',
										'limit' => 8,
										'parents' => 45, 
										'includeTVs' => $_modx->getChunk('credit_tvs'),
										'sortby' => ['rating_sort'=>'DESC','menuindex'=>'ASC'],
										'is_slider' => 1,
										'where' => $where|toJSON,
										'leftJoin' => $leftJoin|toJSON,
										'groupby'=>'modResource.id',
										'loadModels'=>'tvsuperselect',
									]}
								</div>
								<div class="swiper-pagination"></div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>

					</div>
			
					<div class="ionTabs__preloader"></div>
				</div>
			</div>
			
		</div>
	  </div>
	
	
	  {*<div class="section useful-info">
		<div class="container">
	
			<h2 class="text-center mb-5">Полезная информация</h2>
	
			<div class="ionTabs" id="tabs_2" data-name="Tabs_Group_name">
	
				<div class="text-center">
				  <ul class="ionTabs__head">
					  <li class="ionTabs__tab" data-target="Tab_2_1">Микрозаймы</li>
					  <li class="ionTabs__tab" data-target="Tab_2_2">Кредитные карты</li>
					  <li class="ionTabs__tab" data-target="Tab_2_3">Дебетовые карты</li>
					  <li class="ionTabs__tab" data-target="Tab_2_4">Кредиты</li>
				  </ul>
				</div>
	
				<div class="ionTabs__body">
	
					<div class="ionTabs__item" data-name="Tab_2_1">
						<div class="slider-container">
							<div class="swiper-container default">
	  
							  <div class="swiper-wrapper">
								{'!pdoPage' | snippet : [
									'tpl' => 'news-item-slider',
									'limit' => 8,
									'parents' => 35,
									'includeTVs' => 'img,main_type',
									'where' => ['main_type'=>1],
								]}
							  </div>
							  <div class="swiper-pagination"></div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
					<div class="ionTabs__item" data-name="Tab_2_2">
						<div class="slider-container">
							<div class="swiper-container default">
		
								<div class="swiper-wrapper">
								{'!pdoPage' | snippet : [
									'tpl' => 'news-item-slider',
									'limit' => 8,
									'parents' => 35,
									'includeTVs' => 'img,main_type',
									'where' => ['main_type'=>2],
								]}
								</div>
								<div class="swiper-pagination"></div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
					<div class="ionTabs__item" data-name="Tab_2_3">
						<div class="slider-container">
							<div class="swiper-container default">
		
								<div class="swiper-wrapper">
								{'!pdoPage' | snippet : [
									'tpl' => 'news-item-slider',
									'limit' => 8,
									'parents' => 35,
									'includeTVs' => 'img,main_type',
									'where' => ['main_type'=>3],
								]}
								</div>
								<div class="swiper-pagination"></div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
					<div class="ionTabs__item" data-name="Tab_2_4">
						<div class="slider-container">
							<div class="swiper-container default">
		
								<div class="swiper-wrapper">
								{'!pdoPage' | snippet : [
									'tpl' => 'news-item-slider',
									'limit' => 8,
									'parents' => 35,
									'includeTVs' => 'img,main_type',
									'where' => ['main_type'=>4],
								]}
								</div>
								<div class="swiper-pagination"></div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
			
					<div class="ionTabs__preloader"></div>
				</div>
			</div>
			
		</div>
	  </div>*}
	
	
	  <div class="container bottom-text section">
		{'content'|resource}
	  </div>
	

{block 'before_footer'}
{/block}

{/block}