(function() {
	"use strict";

	angular.module("app.states.dataset", [
		"restangular",
		"ui.router"
	])
	.config(function($stateProvider) {
		$stateProvider.state("dataset", {
			url: "/dataset/:id",
			templateUrl: "app/states/dataset/dataset.html",
			controller: "DatasetController",
			resolve: {
				$title: function() { return "Dataset"; }
			}
		});
	}).controller("DatasetController", function($scope, $stateParams, DatasetService) {
		var dataset = DatasetService.getDataset($stateParams.id);
		dataset.then(function(result) {
			$scope.dataset = result;
		});
	});
}());