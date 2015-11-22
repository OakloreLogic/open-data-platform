(function() {
	// define a new directive for the global navigation interface
	angular.module("app.directives.topMenu", []).directive("topMenu", function() {
		return {
			restrict: "E",
			templateUrl: "app/directives/topMenu/topMenu.html",
			controller: "TopMenuController"
		}
	}).controller("TopMenuController", function($scope) {
		// initialize top menu on start scroll position
		if ($(document).scrollTop() < 10) {
			$("top-menu > .ui.menu").addClass("onTop");
		} else if ($(document).scrollTop() >= 10) {
			$("top-menu > .ui.menu").removeClass("onTop");
		}

		// update top menu state on scroll
		$(document).scroll(function() {
			if ($(document).scrollTop() < 10 && !($("top-menu > .ui.menu").hasClass("onTop"))) {
				$("top-menu > .ui.menu").addClass("onTop");
			} else if ($(document).scrollTop() >= 10 && $("top-menu > .ui.menu").hasClass("onTop")) {
				$("top-menu > .ui.menu").removeClass("onTop");
			}
		});
	});
})();