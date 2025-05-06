// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract simpleCalculator {
    int256 public a;
    int256 public b;

    function setValues(int256 _a, int256 _b) public {
        a = _a;
        b = _b;
    }

    function sum() public view returns(int256) {
        return (a + b);
    }

    function difference() public view returns(int256) {
        return (a - b);
    }

    function product() public view returns(int256) {
        return (a * b);
    }

    function quotient() public view returns(int256) {
        return (a / b);
    }

    function remainder() public view returns(int256) {
        return (a % b);
    } 
}