(function() {
  function Router($scope) {
    var controller = this;
    _.bindAll(this, 'setPage');
    this.scope = $scope;
    this._bind();
  }

  var fn = Router.prototype;

  fn.setPage = function(e, page) {
    if (typeof page == 'undefined') {
      page = e;
    }
    this.page = page + '?ajax=true';
  };

  fn._bind = function() {
    this.scope.$on('redirect:start', this.setPage);
  };

  var app = angular.module('router', []);

  app.controller('RoutesController', ['$rootScope', Router]);
})();
