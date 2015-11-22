<?php
	// -- load config files
	require_once("vendor/config.php");
	if (file_exists("vendor/config-local.php")) {
		include_once("vendor/config-local.php");
	}
	
	// -- load custom functions
	require_once("vendor/functions.php");

	// -- setup Slim
	require_once("vendor/Slim/Slim.php");
	\Slim\Slim::registerAutoloader();

	$app = new \Slim\Slim();

	// -- setup CORS for cross domain API access
	require_once("vendor/Slim/Middleware/CorsSlim.php");
	$corsOptions = array(
		"origin" => "http://localhost",
		"allowMethods" => array("POST","GET"),
		"allowHeaders" => "Content-Type"
	);
	$app->add(new \CorsSlim\CorsSlim($corsOptions));

	// -- setup NotORM for database access
	require_once("vendor/NotORM.php");

	$dsn = $config["db-adapter"]
		. ":host=" . $config["db-host"]
		. ";dbname=" . $config["db-name"] . ";";
	$pdo = new PDO($dsn, $config["db-user"], $config["db-pass"]);
	$db = new NotORM($pdo);

	// -- setup timezone
	date_default_timezone_set("Asia/Singapore");

	// -- load route files
	include_once("routes/resources.php");
	include_once("routes/resources.id.php");
	include_once("routes/datasets.php");
	include_once("routes/datasets.id.php");
	include_once("routes/datasets.recent.php");
	include_once("routes/categories.php");
	include_once("routes/departments.php");
	include_once("routes/datasets.search.php");
	include_once("routes/resources.search.php");

	// -- execute Slim application
	$app->run();
?>