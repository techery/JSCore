Signal = require './signal'

module.exports = class EmptySignal extends Signal
  subscribeCompleted: (observer) ->
    observer()

  isEmpty: -> true
