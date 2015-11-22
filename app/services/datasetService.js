(function() {
	'use strict';

	angular.module("app").factory("DatasetService", function(Restangular) {
		return {
			getDatasets: function() {
				return Restangular.all("datasets").getList();
			},
			getRecentDatasets: function(limit) {
				return Restangular.all("datasets/recent/"+limit).getList();
			},
			getDataset: function(id) {
				return Restangular.one("datasets/"+id).get();
			}
		};
	});

}());
