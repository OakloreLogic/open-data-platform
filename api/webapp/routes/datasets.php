<?php
	$app->get("/datasets", function() use ($app, $db) {
		// query database
		$queryResult = $db->dataset();

		// prepare array output
		$output = array();
		foreach ($queryResult as $dataset) {
			$department = $db->department()[$dataset["department"]]["name"];
			$category = $db->category()[$dataset["category"]]["name"];
			$output[] = array(
				"dataset_id"			=> $dataset["id"],
				"dataset_name"			=> $dataset["name"],
				"dataset_timestamp"		=> $dataset["timestamp"],
				"dataset_department"	=> $department,
				"dataset_category"		=> $category
			);
		}
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>