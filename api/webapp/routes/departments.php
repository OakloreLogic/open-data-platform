<?php
	$app->get("/departments", function() use ($app, $db) {
		// query database
		$queryResult = $db->department();

		// prepare array output
		$output = array();
		foreach ($queryResult as $department) {
			$output[] = array(
				"department_id"		=> $department["id"],
				"department_name"	=> $department["name"]
			);
		}
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>