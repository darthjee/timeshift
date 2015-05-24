(function() {
  function SheetController($scope, http, session) {
    this.session = session;
    this.http = http;
    this.scope = $scope;
    this._init();
  }

  var fn = SheetController.prototype;

  fn.show = function(id) {
    this.http.get('/sheet/'+id+'.json').success(this.setSheet);
  };

  fn.setSheet = function(sheet) {
    this.sheet = sheet;
  };

  fn._init = function() {
    date = new Date();
    this.year = date.getYear();
    this.month = date.getMonth();
    _.bindAll(this, 'setSheet');
  };

  var app = angular.module('sheet', ['session', 'requester']);

  app.controller('SheetController', ['$rootScope','requester', 'session', SheetController]);
})();
