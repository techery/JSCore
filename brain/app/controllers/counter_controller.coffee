module.exports = class Counter
  constructor: ->
    @value = 0
    @observers = {}

  counterValue: ->
    @value

  increment: ->
    @value++
    @notify("update", @value)

  addObserver: (event, observer) ->
    @observers[event] ?= []
    @observers[event].push observer

  notify: (event, payload) ->
    observer(payload) for observer in @observers[event]

  cleanup: ->
    delete @observers