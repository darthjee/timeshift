(function() {
  function Session($scope, http) {
    this.scope = $scope;
    this.stored = {};
  };

  var fn = Session.prototype;

  fn.get = function(key) {
    return this.stored[key];
  };

  fn.set = function(key, value) {
    return this.stored[key] = value;
  };

  function SessionFactory($scope) {
    return new Session($scope);
  }

  fn.logged = function() {
    return this.get('user');
  };

  var app = angular.module('session', []);

  app.factory('session', ['$rootScope', SessionFactory]);
})();
