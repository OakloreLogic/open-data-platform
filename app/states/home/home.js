(function() {
	"use strict";

	angular.module("app.states.home", [
		"restangular",
		"ui.router"
	])
	.config(function($stateProvider) {
		$stateProvider.state("home", {
			url: "/",
			templateUrl: "app/states/home/home.html",
			controller: "HomeController",
			resolve: {
				$title: function() { return "Home"; }
			}
		});
	}).controller("HomeController", function($scope, $state) {
		$(".search input").keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if((keycode == '13')&&($scope.searchQuery != undefined)) {
				$state.go("data", { searchQuery: $scope.searchQuery });
			}
		});

		$(document).on("scroll", function() {
			$("header-nav > section.inverted.content").css(
				"background-position", "0px " + ($(document).scrollTop() / 2) + "px"
			);
		});
	});
}());