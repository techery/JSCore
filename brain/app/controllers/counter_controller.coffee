Rx = require "../rx/rx"

module.exports = class Counter
  constructor: ->
    @value = 0
    @valueSignal = new Rx.Signal()

    @incrementCommand = new Rx.Command (value) =>
      singal = new Rx.Signal()
      setTimeout((=>
        @increment()
        singal.sendCompleted()
        ), 500)

      singal

  increment: ->
    @value++
    @valueSignal.sendNext(@value)
