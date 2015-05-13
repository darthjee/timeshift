(function() {
  function Login($scope, http, session) {
    this.scope = $scope;
    this.http = http;
    this.session = session;
    this.user = session.get('user');
    _.bindAll(this, '_redirect');
  }

  var fn = Login.prototype;

  fn.login = function() {
    this.requestLogin().success(this._redirect);
    this.session.set('user', this.user);
  };

  fn.logOff = function() {
    this.user = null;
    this.session.set('user', null);
  };

  fn.requestLogin = function() {
    return this.http.post('/login.json', {
      user: this.user
    });
  };

  fn._redirect = function(data){
    this.scope.$emit('redirect:start', data.redirect);
  };

  var app = angular.module('login', ['requester', 'session']);

  app.controller('LoginController', ['$rootScope','requester', 'session', Login]);
})();
