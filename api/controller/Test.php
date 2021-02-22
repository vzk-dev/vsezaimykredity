<?php
/**
 * Created by PhpStorm.
 * User: Artem
 * Date: 19.03.2019
 * Time: 15:02
 */

class Test extends Base
{
	function postTest($data)
	{
		return [
			"data" => $data,
		];
	}

	function postCreate($data)
	{
		$this->api->auth();
		$this->api->log("", "test");
		$resource = $this->modx->getObject("modResource", 1);
		return [
			"data" => [
				"resource"=>$resource->toArray(),
			],
		];
	}

	function getTest($data)
	{

		return [
			"data" => $data,
			"status" => 200,
			//"options"=>["message"=> "getTest",]
		];
	}
}