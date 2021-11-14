// const assert = require("assert");

// describe("smoke test", function () {
//     it("checks equality", function () {
//         assert.equal(true, false);
//     });
// }); 

const chai = require("chai");
const expect = chai.expect;

describe("smoke test", function () {
    it("checks equality", function () {
        expect(true).to.be.true;
    });
});