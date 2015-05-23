(function() {
  function DashBoard(session, http) {
    this.session = session;
    this.http = http;
    this._init();
  }

  var fn = DashBoard.prototype;

  fn.getUser = function() {
    return this.session.getUser();
  };

  fn.logged = function() {
    return this.session.logged();
  };

  fn._init = function() {
    _.bindAll(this, '_fillSheets');
    this.http.get('/sheet.json').success(this._fillSheets);
  };

  fn._fillSheets = function(data) {
    this.sheets = data.sheets;
  };

  var app = angular.module('dashboard', ['session', 'requester']);

  app.controller('DashBoardController', ['session', 'requester', DashBoard]);
})();
