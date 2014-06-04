module.exports = class Command
  constructor: (body) ->
    @body = body

  execute: (value) ->
    @body(value)
