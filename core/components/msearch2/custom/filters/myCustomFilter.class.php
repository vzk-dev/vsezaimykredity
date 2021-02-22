<?php

class myCustomFilter extends mse2FiltersHandler {

    // Здесь можно переопределить методы родительского класса, или создать собственные
    /**
	 * Retrieves values from Template Variables table
	 *
	 * @param array $tvs Names of tvs
	 * @param array $ids Ids of needed resources
	 *
	 * @return array Array with tvs values as keys and resources ids as values
	 */
	public function getTvdoubleValues(array $tvs, array $ids) {


		// хак для двойных филтров
		$split_filter = [
			'summ_ot' => 'summ',
			'age_ot' => 'age',
			'time_do' => 'time',
		];

        // $this->modx->log(modX::LOG_LEVEL_ERROR, "!!!!!!!!!!!!!!!!!!!! ".print_r($tvs,1));

		$filters = array();
		$q = $this->modx->newQuery('modResource', array('modResource.id:IN' => $ids));
		$q->leftJoin('modTemplateVarTemplate', 'TemplateVarTemplate',
			'TemplateVarTemplate.tmplvarid IN (SELECT id FROM ' . $this->modx->getTableName('modTemplateVar') . ' WHERE name IN ("' . implode('","', $tvs) . '") )
			AND modResource.template = TemplateVarTemplate.templateid'
		);
		$q->leftJoin('modTemplateVar', 'TemplateVar', 'TemplateVarTemplate.tmplvarid = TemplateVar.id');
		$q->leftJoin('modTemplateVarResource', 'TemplateVarResource', 'TemplateVarResource.tmplvarid = TemplateVar.id AND TemplateVarResource.contentid = modResource.id');
		$q->select('TemplateVar.name, TemplateVarResource.contentid as id, TemplateVarResource.value, TemplateVar.type, TemplateVar.default_text');
		$tstart = microtime(true);
		if ($q->prepare() && $q->stmt->execute()) {
			$this->modx->queryTime += microtime(true) - $tstart;
			$this->modx->executedQueries++;
			while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)) {


				if (empty($row['id'])) {
					continue;
				}
				elseif (is_null($row['value']) || trim($row['value']) == '') {
					$row['value'] = $row['default_text'];
				}
				if ($row['type'] == 'tag' || $row['type'] == 'autotag') {
					$row['value'] = str_replace(',', '||', $row['value']);
				}
				$tmp = strpos($row['value'], '||') !== false
					? explode('||', $row['value'])
					: array($row['value']);
				foreach ($tmp as $v) {
					$v = str_replace('"', '&quot;', trim($v));
					if ($v == '') {
						continue;
					}

					// хак для двойных филтров
					if(!array_key_exists($row['name'],$split_filter)){
						$name = strtolower($row['name']);
						
					}else{
						$name = strtolower($split_filter[$row['name']]);
					}

					if (isset($filters[$name][$v])) {
						$filters[$name][$v][$row['id']] = $row['id'];
					}
					else {
						$filters[$name][$v] = array($row['id'] => $row['id']);
					}
				}
			}
		}
		else {
			// $this->modx->log(modX::LOG_LEVEL_ERROR, "[mSearch2] Error on get filter params.\nQuery: ".$q->toSQL()."\nResponse: ".print_r($q->stmt->errorInfo(),1));
		}

		// $this->modx->log(modX::LOG_LEVEL_ERROR, "???????????? ".print_r($filters,1));

		return $filters;
	}

	/**
	 * Filters numbers. Values must be between min and max number
	 *
	 * @param array $requested Filtered ids of resources
	 * @param array $values Filter data with min and max number
	 * @param array $ids Ids of currently active resources
	 *
	 * @return array
	 */
	public function filterNumbers(array $requested, array $values, array $ids) {
		$matched = array();

		// $this->modx->log(modX::LOG_LEVEL_ERROR, "requested ".print_r($requested,1));
		// $this->modx->log(modX::LOG_LEVEL_ERROR, "values ".print_r($values,1));

		$values_list['min'] = [];
		$values_list['max'] = [];
		foreach ($values as $key => $value) {
			$min_max = explode('-',$key);
			$v = array_values($value)[0];
			$values_list['min'][$min_max[0]][$v] = $v;
			$values_list['max'][$min_max[1]][$v] = $v;
		}
		
		// $this->modx->log(modX::LOG_LEVEL_ERROR, "values_list @@@@@@@@@@@@@ ".print_r($values_list,1));

		$values_list_min = array_keys($values_list['min']);
		$values_list_max = array_keys($values_list['max']);

		$minLimit = floor(min($values_list_min));
		$maxLimit= floor(max($values_list_max));


		$min = floor(min($requested));
		$max = ceil(max($requested));


		// $this->modx->log(modX::LOG_LEVEL_ERROR, "min ".print_r($min,1));
		// $this->modx->log(modX::LOG_LEVEL_ERROR, "max ".print_r($max,1));

		// $this->modx->log(modX::LOG_LEVEL_ERROR, "minLimit !!!!!!!!!!!!!!!! ".print_r($minLimit,1));
		// $this->modx->log(modX::LOG_LEVEL_ERROR, "maxLimit !!!!!!!!!!!!!!!! ".print_r($maxLimit,1));

		if($requested[0]){
			if($min >= $minLimit AND $min <= $maxLimit){
				
				$tmp = array_flip($ids);
				foreach ($values as $number => $resources) {

					$min_max = explode('-',$number);

					// $this->modx->log(modX::LOG_LEVEL_ERROR, "min_max!!!!!!!!!!!!!!!! ".print_r($min_max,1));
					$min_value = $min_max[0];
					$max_value = $min_max[1];

					if ($min_value <= $min AND $max_value >= $min) {
						foreach ($resources as $id) {
							if (isset($tmp[$id])) {
								$matched[] = $id;
							}
						}
					}
				}
				

				

			}
		}else{
			$tmp = array_flip($ids);
			// $this->modx->log(modX::LOG_LEVEL_ERROR, ' !$requested[0]) '.print_r($requested[0],1));
			foreach ($values as $number => $resources) {
				foreach ($resources as $id) {
					if (isset($tmp[$id])) {
						$matched[] = $id;
					}
				}
			}
		}

		// $this->modx->log(modX::LOG_LEVEL_ERROR, "number tmp_matched ".print_r($matched,1));

		return $matched;
	}

	/**
	 * Returns array with rounded minimum and maximum value
	 *
	 * @param array $values
	 * @param string $name
	 *
	 * @return array
	 */
	public function buildNumbersFilter(array $values, $name = '') {
		
		
		foreach ($values as $key => $value) {
			$min_max = explode('-',$key);
			$v = array_values($value)[0];
			$temp_values[$min_max[0]][$v] = $v;
			$temp_values[$min_max[1]][$v] = $v;
		}

		if ($filters = $this->buildDecimalFilterAlt($temp_values, $name)) {
			// $this->modx->log(modX::LOG_LEVEL_ERROR, "########### ".print_r($filters,1));

			$filters[0]['value'] = floor($filters[0]['value']);
			$filters[1]['value'] = ceil($filters[1]['value']);
		}

		return $filters;
	}

	/**
	 * Prepares values for filter
	 * Returns array with minimum and maximum value
	 *
	 * @param array $values
	 * @param string $name
	 *
	 * @return array Prepared values
	 */
	public function buildDecimalFilterAlt(array $values, $name = '') {
		$tmp = array_keys($values);
		if (empty($values) || (count($tmp) < 2 && empty($this->config['showEmptyFilters']))) {
			return array();
		}

		sort($tmp);
		if (count($values) >= 2) {
			$min = array_shift($tmp);
			$max = array_pop($tmp);
		}
		else {
			$min = $max = $tmp[0];
		}

		return array(
			array(
				'title' => $this->modx->lexicon('mse2_filter_number_min'),
				'value' => $min,
				'type' => 'number',
				'resources' => null,
				'name' => $name,
			),
			array(
				'title' => $this->modx->lexicon('mse2_filter_number_max'),
				'value' => $max,
				'type' => 'number',
				'resources' => null,
				'name' => $name,
			)
		);
	}

}