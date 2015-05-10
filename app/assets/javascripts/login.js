(function() {
  var app = angular.module('login', []);

  app.controller('LoginController', ['$http', function($http) {
    this.login = function() {
      $http.post('/login.json', {
        uesr: {
          email: this.email
        }
      });
    };
  }]);
})();
