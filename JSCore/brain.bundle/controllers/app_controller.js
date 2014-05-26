var App, AppController, AppStateMachine, http, localStorage;

http = require('http');

App = require('../models/app');

AppStateMachine = require('../models/app_state_machine');

localStorage = require('../helpers/local_storage');

AppController = (function() {
  var application;

  application = null;

  AppController.run = function(config) {
    return application != null ? application : application = new AppController(config, new AppStateMachine(localStorage));
  };

  function AppController(config, stateMachine) {
    this.config = config;
    this.stateMachine = stateMachine;
    this.stateMachine.onlogin = (function(_this) {
      return function() {
        return console.log("Login");
      };
    })(this);
  }

  AppController.prototype.login = function() {
    return this.stateMachine.login();
  };

  AppController.prototype.currentState = function() {
    return this.stateMachine.current;
  };

  return AppController;

})();

module.exports = AppController;
