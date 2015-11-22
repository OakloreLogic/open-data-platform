(function() {
	'use strict';

	angular.module("app").factory("ResourceService", function(Restangular) {
		return {
			getResources: function() {
				return Restangular.all("resources").getList();
			},
			getResource: function(id) {
				return Restangular.one("resources/"+id).get();
			}
		};
	});

}());
