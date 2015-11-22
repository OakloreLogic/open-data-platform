<?php
	$app->get("/datasets/:id", function($id) use ($app, $db) {
		// query database
		$dataset = $db->dataset()[$id];

		// prepare array output
		$resourceQuery = $db->resource()->where(array("dataset"=>$dataset["id"]));
		$resources = array();
		foreach($resourceQuery as $resource) {
			$resources[] = array(
				"resource_id"	=> $resource["id"],
				"resource_name"	=> $resource["name"]
			);
		}
		$department = $db->department()[$dataset["department"]]["name"];
		$category = $db->category()[$dataset["category"]]["name"];
		$output = [
			"dataset_id"			=> $dataset["id"],
			"dataset_name"			=> $dataset["name"],
			"dataset_description"	=> $dataset["description"],
			"dataset_timestamp"		=> $dataset["timestamp"],
			"dataset_department"	=> $department,
			"dataset_category"		=> $category,
			"dataset_resources"		=> $resources
		];
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>