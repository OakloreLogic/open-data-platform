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
			$scope.jsonPath = jsonPath;
			$.getJSON(jsonPath, function(data) {
				$.each(data, function(key, val) {
					var tmpChartLabels = [];
					var tmpChartSeries = [];
					var chartLabels = [];
					var chartSeries = [];
					var options = {
						axisY: {
							offset: 80,
							labelInterpolationFnc: function(value) {
								return value + ' php';
							}
						},
						series: {
							'data': {lineSmooth: Chartist.Interpolation.none()},
							'prediction': {lineSmooth: Chartist.Interpolation.simple()}
						},
						lineSmooth: Chartist.Interpolation.cardinal({
						    fillHoles: true,
						}),
					};


					var mediaQueries = [
						["screen and (max-width:750px)", {
							axisY: {
								showLine: false,
								showLabel: false,
								offset: 0
							},
							axisX: {
								showLine: false,
								showLabel: false,
							},
							showPoint: false
						}]
					];

					$(".chart-area").append("<div class=\"ct-chart ct-perfect-fourth ct_" + key + "\"></div>");
					$.each(val, function(key2, val2) {
						if(key2 == "title") {
							$(".ct-chart.ct_"+key).append("<div class='chart title'>" + val2 + "</div>");
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
					var a, diff, tmp = 0, trendSkip = Math.round(tmpChartLabels.length/6);
					var predictions = [];
					var trend = [];
					for(a = 0; a < tmpChartLabels.length; a++) {
						predictions[a] = null;
						trend[a] = null;
					}

					for(a = 0; a < tmpChartLabels.length; a++) {
						if((a % trendSkip) == 0) {
							trend[a] = tmp / (trendSkip - 1);
							tmp = 0;
						}
						tmp += tmpChartSeries[a];
					}
					trend[0] = tmpChartSeries[0];
					trend[tmpChartLabels.length-1] = tmpChartSeries[tmpChartLabels.length-1];
					predictions[tmpChartLabels.length-1] = tmpChartSeries[tmpChartLabels.length-1];
					diff = tmpChartSeries[tmpChartLabels.length-1] - tmpChartSeries[tmpChartLabels.length-2];
					predictions[tmpChartLabels.length] = ((predictions[tmpChartLabels.length-1] + diff) + trend[tmpChartLabels.length-1])/2;
					if($scope.resource.resource_format == "Line Graph") {
						var j;
						for(j = 0; j < tmpChartLabels.length; j++) {
							chartLabels[j] = "";
							chartSeries[j] = tmpChartSeries[j];
						}
						chartLabels[0] = tmpChartLabels[0];
						chartLabels[tmpChartLabels.length] = "prediction";
						chartLabels[tmpChartLabels.length-1] = tmpChartLabels[tmpChartLabels.length-1];
						chartSeries[tmpChartLabels.length] = null;

						new Chartist.Line(".ct-chart.ct_"+key, {
						  	labels: chartLabels,
						  	series: [
						  		chartSeries,
						  		trend,
						    	predictions
							]
						}, options, mediaQueries);
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
						}, options, mediaQueries);
					}
				});
			});
		});
	});
}());