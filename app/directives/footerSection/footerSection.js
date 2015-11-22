(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.footerSection", []).directive("footerSection", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/footerSection/footerSection.html",
		}
	});
})();