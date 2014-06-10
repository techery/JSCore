expect = require("chai").expect

describe "test on coffee", ->
  it "should pass", ->
    expect([1, 2, 3].indexOf 4).to.equal -1
