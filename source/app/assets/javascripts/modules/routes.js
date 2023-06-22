(function(angular) {
  var module = angular.module("timeshift");

  module.config(["kantoProvider", function(provider) {
    provider.defaultConfig = {
      controller: "Cyberhawk.Controller",
      controllerAs: "gnc",
      templateBuilder: function(route, params) {
        return route + "?ajax=true";
      }
    }

    provider.configs = [{
      routes: ["/"],
      config: {
        controllerAs: "hc"
      }
    }, {
      routes: ["/clients/new", "/clients/:id", "/clients", "/clients/:id/edit"]
    }];
    provider.$get().bindRoutes();
  }]);
}(window.angular));

