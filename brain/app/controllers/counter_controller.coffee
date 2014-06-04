Signal = require "../rx/signal"
EmptySignal = require "../rx/empty_signal"
Command = require "../rx/command"

module.exports = class Counter
  constructor: ->
    @value = 0
    @valueSignal = new Signal()

    @incrementCommand = new Command (value) =>
      @value++
      @valueSignal.sendNext(@value)

      new EmptySignal()



