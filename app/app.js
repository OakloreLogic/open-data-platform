(function() {
	"use strict";

	// setup app's module dependencies
	var app = angular.module("app", [
		"ui.router",
		"ui.router.title",
		"app.states.home",
		"app.states.about",
		"app.states.data",
		"app.states.dataset",
		"app.states.resource",
		"app.directives.topMenu",
		"app.directives.headerNav",
		"app.directives.footerSection",
		"app.directives.statOverview",
		"app.directives.latestData",
		"app.directives.latestNews",
		"app.directives.datasetPanel",
		"app.directives.newsPanel",
		"app.directives.resourcePanel",
		"angularUtils.directives.dirDisqus",
		"restangular"]);

	// configure app
	app.config(function($urlRouterProvider, RestangularProvider, $locationProvider) {

		// redirects any unmatched url
		$urlRouterProvider.otherwise("/");

		// configure restangular
		RestangularProvider.setBaseUrl("./api/webapp");
		RestangularProvider.setDefaultRequestParams('jsonp', {callback: 'JSON_CALLBACK'});
		RestangularProvider.setDefaultHeaders({'Content-Type': 'application/json'});

		// use hashbang for disqus
		$locationProvider.hashPrefix('!');
	});
}());