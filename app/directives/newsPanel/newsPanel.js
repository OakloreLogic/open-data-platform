(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.newsPanel", []).directive("newsPanel", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/newsPanel/newsPanel.html",
			controller: "NewsPanelController"
		}
	}).controller("NewsPanelController", function($scope) {
	});
})();