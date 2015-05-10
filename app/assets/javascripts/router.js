(function() {
  var app = angular.module('router', []);

  app.controller('RoutesController', function() {
    this.setPage = function(page) {
      this.page = page + '?ajax=true';
    };
    this.setPage('/');
  });
})();
