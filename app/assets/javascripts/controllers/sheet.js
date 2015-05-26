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
    url = ['','sheet',this.sheet.id,this.year,this.month,'days.json'].join('/');
    this.http.get(url, {
      year: this.year,
      month: this.month
    }).success(this.setDays);
  };

  fn.setDays = function(days) {
    this.days = days;
  };

  fn._init = function() {
    date = new Date();
    this.year = date.getFullYear();
    this.month = date.getMonth() + 1;
    _.bindAll(this, 'setSheet');
  };

  var app = angular.module('sheet', ['session', 'requester']);

  app.controller('SheetController', ['$rootScope','requester', 'session', SheetController]);
})();
