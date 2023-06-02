(function(angular) {
  var module = angular.module('timeshift', [
    'global',
    'cyberhawk',
    'kanto',
    'home',
    'login'
  ]);

  module.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.patch = {
      'Content-Type': 'application/json;charset=utf-8'
    };
  }]);
}(window.angular));
