(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.latestData", []).directive("latestData", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/latestData/latestData.html",
			controller: "LatestDataController"
		}
	}).controller("LatestDataController", function($scope, DatasetService) {
		var latestData = DatasetService.getRecentDatasets(4);
		latestData.then(function(result) {
			$scope.latestData = result;
		});
	});
})();