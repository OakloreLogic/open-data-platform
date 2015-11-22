(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.statOverview", []).directive("statOverview", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/statOverview/statOverview.html",
			controller: "StatOverviewController"
		}
	}).controller("StatOverviewController", function($scope, ResourceService, DatasetService, CategoryService, DepartmentService) {
		$scope.resourceCount = "...";
		$scope.datasetCount = "...";
		$scope.categoryCount = "...";
		$scope.departmentCount = "...";

		var resources = ResourceService.getResources();
		var datasets = DatasetService.getDatasets();
		var categories = CategoryService.getCategories();
		var departments = DepartmentService.getDepartments();

		resources.then(function(result) {
			$scope.resourceCount = result.length;
		});

		datasets.then(function(result) {
			$scope.datasetCount = result.length;
		});

		categories.then(function(result) {
			$scope.categoryCount = result.length;
		});

		departments.then(function(result) {
			$scope.departmentCount = result.length;
		});
	});
})();