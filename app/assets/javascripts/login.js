(function() {
  var app = angular.module('login', ['requester']);

  app.controller('LoginController', ['$requester', function($http) {
    this.login = function() {
      $http.post('/login.json', {
        uesr: {
          email: this.email
        }
      });
    };
  }]);
})();
