<?php
	$app->get("/categories", function() use ($app, $db) {
		// query database
		$queryResult = $db->category();

		// prepare array output
		$output = array();
		foreach ($queryResult as $category) {
			$output[] = array(
				"category_id"			=> $category["id"],
				"category_name"			=> $category["name"]
			);
		}
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>