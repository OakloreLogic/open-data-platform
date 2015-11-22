<?php
	$app->get("/datasets/recent/:limit", function($limit) use ($app, $db) {
		$i = 0;
		// query database
		$queryResult = $db->dataset()->order("timestamp DESC");

		// prepare array output
		$output = array();
		foreach ($queryResult as $dataset) {
			if($i++ < $limit) {
				$department = $db->department()[$dataset["department"]]["name"];
				$category = $db->category()[$dataset["category"]]["name"];
				$resourceCount = count($db->resource()->where(array("dataset"=>$dataset["id"])));
				$output[] = array(
					"dataset_id"			=> $dataset["id"],
					"dataset_name"			=> $dataset["name"],
					"dataset_timestamp"		=> $dataset["timestamp"],
					"dataset_department"	=> $department,
					"dataset_category"		=> $category,
					"dataset_resourceCount" => $resourceCount
				);
			}
		}
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>