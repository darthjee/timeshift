(function() {
  var app = angular.module('login', ['requester']);

  app.controller('LoginController', ['$rootScope','$requester', function($scope, $http) {
    this.login = function() {
      $http.post('/login.json', {
        user: {
          email: this.email
        }
      }).success(function(data){
      	$scope.$emit('redirect:start', data.redirect);
      });
    };
  }]);
})();
