(function() {
  var app = angular.module('router', []);

  app.controller('RoutesController', ['$rootScope', function($scope) {
    var controller = this;

    $scope.$on('redirect:start', function(e, path) {
      controller.setPage(path);
    });

    controller.setPage = function(page) {
      controller.page = page + '?ajax=true';
    };
  }]);
})();
