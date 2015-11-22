<?php
	$app->get("/resources", function() use ($app, $db) {
		// query database
		$queryResult = $db->resource();

		// prepare array output
		$output = array();
		foreach ($queryResult as $resource) {
			$format = $db->format()[$resource["format"]]["name"];
			$dataset = $db->dataset()[$resource["dataset"]]["name"];
			$output[] = array(
				"resource_id"			=> $resource["id"],
				"resource_name"			=> $resource["name"],
				"resource_description"	=> $resource["description"],
				"resource_format"		=> $format,
				"resource_timestamp"	=> $resource["timestamp"],
				"resource_dataset"		=> $dataset
			);
		}
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>