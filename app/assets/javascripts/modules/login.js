(function() {
  function Login($scope, $http) {
    this.scope = $scope;
    this.http = $http;
    _.bindAll(this, '_redirect');
  }

  var fn = Login.prototype;

  fn.login = function() {
    this.requestLogin().success(this._redirect);
  };

  fn.requestLogin = function() {
    return this.http.post('/login.json', {
      user: {
        email: this.email
      }
    });
  };

  fn._redirect = function(data){
    this.scope.$emit('redirect:start', data.redirect);
  };

  var app = angular.module('login', ['requester']);

  app.controller('LoginController', ['$rootScope','$requester', Login]);
})();
