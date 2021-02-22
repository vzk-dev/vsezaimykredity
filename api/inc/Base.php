<?php
/**
 * Created by PhpStorm.
 * User: Artem
 * Date: 19.03.2019
 * Time: 15:04
 */

class Base
{

	public $modx;
	public $api;
	public $log;

	function __construct(&$modx, &$api)
	{
		$this->modx = $modx;
		$this->api = $api;
	}
}