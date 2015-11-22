(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.datasetPanel", []).directive("datasetPanel", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/datasetPanel/datasetPanel.html",
			controller: "DatasetPanelController"
		}
	}).controller("DatasetPanelController", function($scope) {
	});
})();