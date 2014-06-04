module.exports = class Counter
  constructor: ->
    @value = 0
    @valueSignal = new Signal()
    @valueSignal.subscribeNext (value) ->
      console.log('Next' + value);

  counterValue: ->
    @value

  increment: ->
    command = new Command (value) =>
      @value++
      @valueSignal.sendNext(@value)

      new EmptySignal()



class Signal
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

class EmptySignal extends Signal
  subscribeCompleted: (observer) ->
    observer()

  isEmpty: -> true

class Command
  constructor: (body) ->
    @body = body

  execute: (value) ->
    @body(value)


