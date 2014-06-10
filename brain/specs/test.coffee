expect = require("chai").expect


describe "test on cofee", ->
  it "should fail", ->
    expect([1, 2, 3].indexOf 4).to.equal -1
