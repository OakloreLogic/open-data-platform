(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.headerNav", []).directive("headerNav", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/headerNav/headerNav.html",
			controller: "ResourcePanelController"
		}
	});
})();