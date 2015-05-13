(function() {
  function Session() {
    this.stored = {};
  };

  var fn = Session.prototype;

  fn.get = function(key) {
    return this.stored[key];
  };

  fn.set = function(key, value) {
    return this.stored[key] = value;
  };

  function SessionFactory($http) {
    return new Session();
  }

  var app = angular.module('session', []);

  app.factory('session', SessionFactory);
})();
