<?php

class Api
{
	private $login = 'site';
	private $pass = 'tae9Eek2';
	public $onlyAjax = true;
	public $modx;
	private $logPath = '';
	private $controllerPath = '';
	public $dateLog;
	public $loging = true;
	public $ctx = null;
	public $reqData = [];
	public $reqGet = [];
	public $object = null;
	public $method = null;
	public $action = null;
	public $response = [
		"object" => null,
		"action" => null,
		"method" => null,
		"message" => null,
		"data" => null,
		"success" => true,
		"status" => null
	];


	function __construct(&$modx)
	{
		$this->modx = $modx;
		$this->logPath = dirname(dirname(__FILE__)) . "/logs/";
		$this->controllerPath = dirname(dirname(__FILE__)) . "/controller/";
	}

	function init($config = [])
	{

		$this->loging = isset($config["loging"]) ? $config["loging"] : false;
		$this->onlyAjax = isset($config["onlyAjax"]) ? $config["onlyAjax"] : false;

		$this->log("system", "=====================================================");
		$this->log("system", "Api: Init Start");

		$alias = $this->modx->context->getOption('request_param_alias', 'q');

		$isAjax = !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest';

		if ($this->onlyAjax && !$isAjax) {
			$this->response([], 500, ["message" => "ERROR: onlyAjax"]);
		}

		if (!isset($_REQUEST[$alias])) {
			$this->response([], 500, ["message" => "Error"]);
		}

		$request = $_REQUEST[$alias];
		$tmp = explode('/', $request);

		if (count($tmp) != 2) {
			$this->response([], 404);
		}


		$this->object = trim($tmp[0]);
		$this->action = trim($tmp[1]);

		$this->log("system", "Api: GET object = " . $this->object);
		$this->log("system", "Api: GET action = " . $this->action);

		$this->ctx = !empty($_REQUEST['ctx']) ? (string)$_REQUEST['ctx'] : 'web';

		$this->log("system", "Api: GET ctx = " . $this->ctx);

		if ($this->ctx != 'web') {
			$this->modx->switchContext($this->ctx);
		}

		$rawData = file_get_contents("php://input");

		$this->log("system", "Api: GET rawData = " . $rawData);

		if (!empty($rawData)) {
			$this->reqData = json_decode($rawData, 1);
			$this->log("system", "Api: GET rawData = " . print_r($this->reqData, 1));
		}

		if (!empty($_GET)) {
			$tempGet = $_GET;
			unset($tempGet['q']);
			$this->reqGet = $tempGet;
			$this->log("system", "Api: GET reqGet = " . print_r($this->reqGet, 1));
			unset($tempGet);
		}

		$this->method = $_SERVER['REQUEST_METHOD'];

		$this->log("system", "Api: GET method = " . $this->method);

		$this->setResponse([], 200);
		$this->runAction();
		$this->log("system", "Api: Init END");
		return true;
	}

	function auth()
	{

		$user = $_SERVER['PHP_AUTH_USER'];
		$pass = $_SERVER['PHP_AUTH_PW'];

		$validated = ($this->login == $user) && ($this->pass == $pass);

		/* Если нужна авторизация */
		if (!$validated) {
			$this->response([], 401, [
				'headers' => [
					'WWW-Authenticate' => 'Basic realm="My Realm"',
				],
				"message"=>"Unauthorized",
			]);
		}

		return true;
	}

	function runAction()
	{
		$this->log("system", "Api: runAction Start");
		if ($this->object && $this->action) {

			$object = ucfirst($this->object);
			$action = ucfirst($this->action);
			$method = strtolower($this->method);

			$this->log("system", "Api: GET Object = " . $action);
			$this->log("system", "Api: GET Action = " . $action);

			if (file_exists($this->controllerPath . $object . '.php')) {

				require_once($this->controllerPath . $object . '.php');

				$data = $method == "get" ? $this->reqGet : $this->reqData;

				$objClass = new $object($this->modx, $this);

				if (method_exists($objClass, $method . $action)) {

					$this->log("system", "Api: Start method $object->" . $method . $action);

					$response = $objClass->{$method . $action}($data);

					$this->log("system", "Api: GET response from method $object->" . $method . $action . " " . print_r($response, 1));

					$data = isset($response['data']) ? $response['data'] : [];
					$options = isset($response['options']) ? $response['options'] : [];
					$status = isset($response['status']) ? $response['status'] : 200;

					$this->response($data, $status, $options);

				} else {
					$this->log("system", "Api: ERROR: method not exists $object->" . $method . $action);
					$this->response([], 500, ["message" => "ERROR: method not exists $object->" . $method . $action]);
				}
			} else {
				$this->log("system", "Api: ERROR: file not exists" . $this->controllerPath . $object . '.php');
			}

		} else {
			$this->response([], 500, ["message" => "ERROR: object or method is empty"]);
		}
		$this->log("system", "Api: runAction END");
	}

	function setResponse($dataResponse, $status, $options = [])
	{
		$this->response["object"] = $this->object;
		$this->response["action"] = $this->action;
		$this->response["method"] = $this->method;
		$this->response["data"] = $dataResponse;
		$this->response["ctx"] = $this->ctx;
		$this->response["status"] = $status;

		foreach ($options as $k => $v) {
			$this->response[$k] = $v;
		}
	}

	function response($dataResponse, $status, $options = [])
	{

		$header = [
			'Accept' => 'application/json; charset=utf-8',
			'Content-Type' => 'application/json; charset=utf-8',
		];

		if (isset($options['headers']) && count($options['headers'])) {
			$header = [];
			foreach ($options["headers"] as $k => $v) {
				$header[$k] = $v;
			}
			unset($options["headers"]);
		}


		$this->setResponse($dataResponse, $status, $options);

		@session_write_close();
		foreach ($header as $k => $v) {
			header($k . ": " . $v);
		}
		http_response_code($status);
		exit(json_encode($this->response));
	}

	function log($action, $txt)
	{
		if ($this->loging) {
			if ($action == "") {
				$object = ucfirst($this->object);
				$action = ucfirst($this->action);
				$method = strtolower($this->method);
				$action = $object . "-" . $method . $action;
			}
			$date = date('Y-m-d H:i:s v (T)');
			if ($this->dateLog == "") $this->dateLog = $date;
			$f = fopen($this->logPath . $action . '.log', 'a');
			if (!empty($f)) {
				fwrite($f, $date . " " . $txt . "\n");
				fclose($f);
			}
		}
	}

}