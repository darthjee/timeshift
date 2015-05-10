(function() {
  var app = angular.module('requester', []);

  app.factory('$requester', ['$http', function($http) {
    return {
      get: function() {
        $http.get.apply($http, arguments);
      },
      post: function() {
        $http.post.apply($http, arguments);
      }
    }
  }]);
})();
