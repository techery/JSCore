StateMachine = require "javascript-state-machine"
localStorage = require 'LocalStorage'

module.exports = class AppStateMachine
  kAppStateKey = "kAppState"

  @NotLogined: "not_logined"
  @Logined: "logined"
  @InCase: "in_case"
  @IncomingCall: "incoming_call"

  constructor: () ->
    @sm = StateMachine.create({
      target: this
      initial: localStorage.getItem(kAppStateKey) or AppStateMachine.NotLogined
      events: [
        { name: "login", from: AppStateMachine.NotLogined, to: AppStateMachine.Logined}
        { name: "logout", from: AppStateMachine.Logined, to: AppStateMachine.NotLogined}
        { name: "createCase", from: AppStateMachine.Logined, to: AppStateMachine.InCase}
        { name: "finishCase", from: AppStateMachine.InCase, to: AppStateMachine.Logined}
        { name: "newIncomingCall", from: AppStateMachine.Logined, to: AppStateMachine.IncomingCall}
      ]
    })

    @sm.onenterstate = =>
      localStorage.setItem kAppStateKey, @sm.current