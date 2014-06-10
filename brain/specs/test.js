var expect = require("chai").expect

describe("test", function() {
  it("should fail", function() {
    expect([1,2,3].indexOf(4)).to.equal(-1);
  });
});
