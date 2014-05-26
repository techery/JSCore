var AppStateMachine, StateMachine;

StateMachine = require("javascript-state-machine");

AppStateMachine = (function() {
  var kAppStateKey;

  kAppStateKey = "kAppState";

  AppStateMachine.NotLogined = "not_logined";

  AppStateMachine.Logined = "logined";

  function AppStateMachine(localStorage) {
    this.localStorage = localStorage;
    this.sm = StateMachine.create({
      target: this,
      initial: this.localStorage.getItem(kAppStateKey) || AppStateMachine.NotLogined,
      events: [
        {
          name: "login",
          from: AppStateMachine.NotLogined,
          to: AppStateMachine.Logined
        }, {
          name: "logout",
          from: AppStateMachine.Logined,
          to: AppStateMachine.NotLogined
        }
      ]
    });
    this.sm.onenterstate = (function(_this) {
      return function() {
        return _this.localStorage.setItem(kAppStateKey, _this.sm.current);
      };
    })(this);
  }

  return AppStateMachine;

})();

module.exports = AppStateMachine;
