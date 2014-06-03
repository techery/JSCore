module.exports = class Counter
  constructor: ->
    @value = 0
    @observers = []

  counterValue: ->
    @value

  increment: ->
    @value++
    observer(@value) for observer in @observers

  addObserver: (observer) ->
    @observers.push observer

  removeObserver: (observer) ->
    delete @observers[@observers.indexOf(observer)]