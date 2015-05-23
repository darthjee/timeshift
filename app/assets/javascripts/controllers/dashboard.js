(function() {
  function DashBoard(session) {
    this.session = session;
  }

  var fn = DashBoard.prototype;

  fn.getUser = function() {
    return this.session.getUser();
  };

  fn.logged = function() {
    return this.session.logged();
  };

  var app = angular.module('dashboard', ['session']);

  app.controller('DashBoardController', ['session', DashBoard]);
})();
