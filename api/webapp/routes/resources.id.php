<?php
	$app->get("/resources/:id", function($id) use ($app, $db) {
		// query database
		$resource = $db->resource()[$id];

		// prepare array output
		$format = $db->format()[$resource["format"]]["name"];
		$dataset = $db->dataset()[$resource["dataset"]]["name"];
		$categoryId = $db->dataset()[$resource["dataset"]]["category"];
		$category = $db->category()[$categoryId]["name"];
		$output = [
			"resource_id"			=> $resource["id"],
			"resource_name"			=> $resource["name"],
			"resource_description"	=> $resource["description"],
			"resource_format"		=> $format,
			"resource_timestamp"	=> $resource["timestamp"],
			"resource_dataset"		=> $dataset,
			"resource_category"		=> $category
		];

		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>