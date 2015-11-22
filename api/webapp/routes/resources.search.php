<?php
	$app->get("/resources/search/:query", function($query) use ($app, $db) {
		// prepare array output

		$output = array();
		// query database
		$queries = explode(" ", $query);
		$found = array();

		for($i = 0; $i < count($queries); $i++) {
			$queryResult = $db->resource()->where("name like '%$queries[$i]%'");

			foreach($queryResult as $resource) {
				if(!in_array($resource["id"], $found)) {
					$found[] = $resource["id"];
					$dataset = $db->dataset()[$resource["dataset"]]["name"];
					$output[] = array(
						"resource_id"		=> $resource["id"],
						"resource_name"		=> $resource["name"],
						"resource_dataset"	=> $dataset
					);
				}
			}
		}
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>