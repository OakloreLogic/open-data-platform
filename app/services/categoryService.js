(function() {
	'use strict';

	angular.module("app").factory("CategoryService", function(Restangular) {
		return {
			getCategories: function() {
				return Restangular.all("categories").getList();
			}
		};
	});

}());
