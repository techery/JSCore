module.exports = class Signal
  constructor: ->
    @nextObservers      = []
    @errorObservers     = []
    @completedObservers = []

  sendNext: (value) ->
    observer(value) for observer in @nextObservers

  sendError: (error) ->
    observer(error) for observer in @errorObservers

  sendCompleted: ->
    observer() for observer in @completedObservers

  subscribeNext: (observer) ->
    @nextObservers.push(observer)

  subscribeError: (observer) ->
    @errorObservers.push(observer)

  subscribeCompleted: (observer) ->
    @completedObservers.push(observer)

  isEmpty: -> false