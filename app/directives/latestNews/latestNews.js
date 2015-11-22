(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.latestNews", []).directive("latestNews", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/latestNews/latestNews.html",
		}
	});
})();