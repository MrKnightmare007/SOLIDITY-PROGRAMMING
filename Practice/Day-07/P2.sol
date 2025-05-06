//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './Math.sol';

contract Calculator {
    using Math for uint;

    function add(uint a, uint b) public pure returns(uint) {
        return Math.add(a,b);
    }

    function subtract(uint a, uint b) public pure returns(uint) {
        require(a >= b, "Subtraction underflow");
        return Math.subtract(a,b);
    }

    function multiply(uint a, uint b) public pure returns(uint) {
        return Math.multiply(a,b);
    }

    function divide(uint a, uint b) public pure returns(uint) {
        return Math.divide(a,b);
    }

    function mod(uint a, uint b) public pure returns(uint) {
        return Math.mod(a,b);
    }

    function sqrt(uint n) public pure returns(uint) {
        return Math.sqrt(n);
    }
    
    function abs(int n) public pure returns(uint) {
        return Math.abs(n);
    }

    function pow(uint a , uint b) public pure returns(uint) {
        return Math.pow(a,b);
    }
}