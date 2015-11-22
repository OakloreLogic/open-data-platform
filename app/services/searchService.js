(function() {
	'use strict';

	angular.module("app").factory("SearchService", function(Restangular) {
		return {
			searchDatasets: function(query) {
				return Restangular.all("/datasets/search/" + query).getList();
			},
			searchResources: function(query) {
				return Restangular.all("/resources/search/" + query).getList();
			}
		};
	});

}());
