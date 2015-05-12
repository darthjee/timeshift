(function() {
  var app = angular.module('requester', []);

  app.factory('$requester', ['$http', function($http) {
    var tokens = {};
    tokens[$('[name="csrf-param"]').attr('content')] = $('[name="csrf-token"]').attr('content');

    function requestSettings(url, data, success, dataType) {
      var settings;

      if (typeof url != 'string') {
        settings = url;
      } else {
        settings = {
          url: url,
          data: data,
          success: success,
          dataType: dataType
        };
      };
      settings.url = settings.url + '?ajax=true';
      _.extend(settings.data, tokens);
      return settings;
    }

    return {
      get: function() {
        var settings = requestSettings.apply(this, arguments);
        return $http.get(settings.url, settings.data);
      },
      post: function() {
        var settings = requestSettings.apply(this, arguments);
        return $http.post(settings.url, settings.data);
      }
    };
  }]);
})();
