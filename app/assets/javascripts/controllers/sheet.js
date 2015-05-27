(function(_) {
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
    var url = ['','sheet', this.sheet.id,'month',this.year,this.month+'.json'].join('/');

    this.http.get(url).success(this.setMonth);
  };

  fn.setMonth = function(month) {
    this.days = month.days;
  };

  fn._init = function() {
    var date = new Date();

    this.year = date.getFullYear();
    this.month = date.getMonth() + 1;
    _.bindAll(this, 'setSheet', 'setMonth');
  };

  var app = angular.module('sheet', ['session', 'requester']);

  app.controller('SheetController', ['$rootScope','requester', 'session', SheetController]);
})(_);
