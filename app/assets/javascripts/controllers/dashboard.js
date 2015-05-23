(function() {
  function DashBoard($scope, http, session) {
    this.session = session;
    this.http = http;
    this.scope = $scope;
    this._init();
  }

  var fn = DashBoard.prototype;

  fn.getUser = function() {
    return this.session.getUser();
  };

  fn.logged = function() {
    return this.session.logged();
  };

  fn.openSheet = function(id) {
    this.scope.$emit('redirect:start', '/sheet/'+id);
  };

  fn._init = function() {
    _.bindAll(this, '_fillSheets');
    this.http.get('/sheet.json').success(this._fillSheets);
  };

  fn._fillSheets = function(data) {
    this.sheets = data.sheets;
  };

  var app = angular.module('dashboard', ['session', 'requester']);

  app.controller('DashBoardController', ['$rootScope','requester', 'session', DashBoard]);
})();
