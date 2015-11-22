(function() {
	"use strict";

	angular.module("app.states.data", [
		"restangular",
		"ui.router"
	])
	.config(function($stateProvider) {
		$stateProvider.state("data", {
			url: "/data",
			params: {
				searchQuery: null
			},
			templateUrl: "app/states/data/data.html",
			controller: "DataController",
			resolve: {
				$title: function() { return "Data"; }
			}
		});
	}).controller("DataController", function($scope, $stateParams, SearchService, DatasetService, CategoryService, DepartmentService) {
		var categories = CategoryService.getCategories();
		var departments = DepartmentService.getDepartments();
		departments.then(function(result) {
			$scope.departments = result;
			$('.ui.department.dropdown')
				.dropdown();
			});
		categories.then(function(result) {
			$scope.categories = result;
			$('.ui.category.dropdown')
				.dropdown();
			});

		$scope.searchQuery = null;
		if($stateParams.searchQuery != null) {
			$scope.searchQuery = $stateParams.searchQuery;
			var resourceResults = SearchService.searchResources($scope.searchQuery);
			var datasetResults = SearchService.searchDatasets($scope.searchQuery);

			resourceResults.then(function(result) {
				$scope.resourceResults = result;
			});

			datasetResults.then(function(result) {
				$scope.datasetResults = result;
			});
		} else {
			var datasetResults = DatasetService.getRecentDatasets(9);

			datasetResults.then(function(result) {
				$scope.datasetResults = result;
			});
		}

		$scope.updateSearch = function() {
			if($scope.searchQuery != "") {
				var resourceResults = SearchService.searchResources($scope.searchQuery);
				var datasetResults = SearchService.searchDatasets($scope.searchQuery);

				resourceResults.then(function(result) {
					$scope.resourceResults = result;
				});

				datasetResults.then(function(result) {
					$scope.datasetResults = result;
				});
			} else {
				$scope.searchQuery = null;
				var datasetResults = DatasetService.getRecentDatasets(9);
				var resourceResults = [];
				$scope.resourceResults = [];
				datasetResults.then(function(result) {
					$scope.datasetResults = result;
				});
			}
		}

		$scope.updateFilter = function(data) {
			var departmentFilter = $(".ui.department.dropdown>input[type=hidden]").attr("value");
			var categoryFilter = $(".ui.category.dropdown>input[type=hidden]").attr("value");
			var merge = (departmentFilter + "," + categoryFilter).split(",");
			var cleanMerge = [];
			merge.forEach(function(item) {
				if (item != "undefined" && item != "") {
					cleanMerge.push(item);
				}
			});
			for(var i = 0; i < $scope.datasetResults.length; i++) {
				for(var j = 0; j < cleanMerge.length; j++) {
					console.log($scope.datasetResults[i]["dataset_department"].toLowerCase() + " | " + cleanMerge[j].toLowerCase());
					if($scope.datasetResults[i]["dataset_department"].toLowerCase() == cleanMerge[j].toLowerCase()) {
						//$scope.datasetResults = $scope.datasetResults.splice(i,1);
					}
				}
			}
		}

		// bind updateFilter to dropdown item close button
		$(".ui.dropdown").on("click", function(){
			$scope.updateFilter();
		});

		$(document).on("scroll", function() {
			$(".data-state .subheader").css(
				"background-position", "0px " + ($(document).scrollTop() / 2) + "px"
			);
		});
	});
}());