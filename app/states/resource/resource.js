(function() {
	"use strict";

	angular.module("app.states.resource", [
		"restangular",
		"ui.router"
	])
	.config(function($stateProvider) {
		$stateProvider.state("resource", {
			url: "/resource/:id",
			templateUrl: "app/states/resource/resource.html",
			controller: "ResourceController",
			resolve: {
				$title: function() { return "Resource"; }
			}
		});
	}).controller("ResourceController", function($scope, $stateParams, ResourceService) {
		var resource = ResourceService.getResource($stateParams.id);
		resource.then(function(result) {
			$scope.resource = result;	
			var jsonPath = "data/" + $scope.resource.resource_category + "/" + $scope.resource.resource_dataset + "/" +  $scope.resource.resource_name + ".json";
			$.getJSON(jsonPath, function(data) {
				$.each(data, function(key, val) {
					var tmpChartLabels = [];
					var tmpChartSeries = [];
					var chartLabels = [];
					var chartSeries = [];
					$(".chart-area").append("<div class=\"ct-chart ct-perfect-fourth ct_" + key + "\"></div>");
					$.each(val, function(key2, val2) {
						if(key2 == "title") {
							$(".ct-chart.ct_"+key).append("<div>" + val2 + "</div>");
						} else {
							$.each(val2, function(key3, val3) {
								var i = 0;
								$.each(val3, function(key4, val4) {
									if(i == 0) {
										tmpChartLabels[key3] = val4;
										i++;
									} else {
										tmpChartSeries[key3] = parseInt(val4);
									}
								});
							});
						}
					});
					if($scope.resource.resource_format == "Line Graph") {
						var j;
						for(j = 0; j < tmpChartLabels.length; j++) {
							chartLabels[j] = "";
							chartSeries[j] = tmpChartSeries[j];
						}
						chartLabels[0] = tmpChartLabels[0];
						chartLabels[tmpChartLabels.length-1] = tmpChartLabels[tmpChartLabels.length-1];

						new Chartist.Line(".ct-chart.ct_"+key, {
						  	labels: chartLabels,
						  	series: [
						    	chartSeries
							]
						});
					} else {
						var j;
						for(j = 0; j < tmpChartLabels.length; j++) {
							chartLabels[j] = tmpChartLabels[j];
							chartSeries[j] = tmpChartSeries[j];
						}

						new Chartist.Bar(".ct-chart.ct_"+key, {
						  	labels: chartLabels,
						  	series: [
						    	chartSeries
							]
						});
					}
				});
			});
		});
	});
}());