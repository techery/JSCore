Rx = require "../rx/rx"

module.exports = class Counter
  constructor: ->
    @value = 0
    @valueSignal = new Rx.Signal()

    @incrementCommand = new Rx.Command (value) =>
      @increment()
      new Rx.Signal.Empty()

  increment: ->
    @value++
    @valueSignal.sendNext(@value)
