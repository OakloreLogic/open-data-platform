<?php
	$app->get("/datasets/search/:query", function($query) use ($app, $db) {
		// prepare array output

		$output = array();
		// query database
		$queries = explode(" ", $query);
		$found = array();

		for($i = 0; $i < count($queries); $i++) {
			$queryResult = $db->dataset()->where("name like '%$queries[$i]%'");

			foreach($queryResult as $dataset) {
				if(!in_array($dataset["id"], $found)) {
					$found[] = $dataset["id"];
					$resourceCount = count($db->resource()->where(array("dataset"=>$dataset["id"])));
					$output[] = array(
						"dataset_id"			=> $dataset["id"],
						"dataset_name"			=> $dataset["name"],
						"dataset_resourceCount" => $resourceCount
					);
				}
			}
		}
		// format and send output
		ResponseHelper::echoResponse(200, $output);
	});
?>