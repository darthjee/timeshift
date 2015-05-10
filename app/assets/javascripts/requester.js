(function() {
  var app = angular.module('requester', []);

  app.factory('$requester', ['$http', function($http) {
    var tokens = {};
    tokens[$('[name="csrf-param"]').attr('content')] = $('[name="csrf-token"]').attr('content')

    return {
      get: function(url, options) {
        if (typeof url != 'string') {
          options = url;
        }
        _.extend(options, tokens);
        $http.get.apply($http, arguments);
      },
      post: function(url, options) {
        _.extend(options, tokens);
        $http.post.apply($http, arguments);
      }
    }
  }]);
})();
