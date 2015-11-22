(function() {
	'use strict';

	angular.module("app").factory("DepartmentService", function(Restangular) {
		return {
			getDepartments: function() {
				return Restangular.all("departments").getList();
			}
		};
	});

}());
