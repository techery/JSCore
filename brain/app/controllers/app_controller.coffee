AppStateMachine = require '../models/app_state_machine'
SessionController = require './session_controller'

module.exports = class AppController
  application = null

  @run: (config) ->
    application ?= new AppController(config, new AppStateMachine())

  constructor: (@config, @stateMachine) ->
    @stateMachine.onlogin = =>
      console.log('Login')

    @sessionController = new SessionController()

  currentState: ->
    @stateMachine.current
