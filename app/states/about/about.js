(function() {
	"use strict";

	angular.module("app.states.about", [
		"restangular",
		"ui.router"
	])
	.config(function($stateProvider) {
		$stateProvider.state("about", {
			url: "/about/:id",
			templateUrl: "app/states/about/about.html",
			controller: "AboutController",
			resolve: {
				$title: function() { return "About"; }
			}
		});
	}).controller("AboutController", function($scope) {
	});
}());