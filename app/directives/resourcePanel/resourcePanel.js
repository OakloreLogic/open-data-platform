(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.resourcePanel", []).directive("resourcePanel", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/resourcePanel/resourcePanel.html",
			controller: "ResourcePanelController"
		}
	}).controller("ResourcePanelController", function($scope) {
	});
})();