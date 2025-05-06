//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './Numbers.sol';

contract Calculate {
    using Numbers for uint;
    function max(uint a, uint b) public pure returns(uint) {
        return Numbers.max(a,b);
    }

    function min(uint a, uint b) public pure returns(uint) {
        return Numbers.min(a,b);
    }

    function factorial(uint n) public pure returns(uint) {
        return Numbers.factorial(n);
    }

    function fibonacci(uint a, uint b) public pure returns(uint[] memory) {
        return Numbers.fibonacci(a,b);
    }

    function Armstrong(uint n) public pure returns(bool) {
        return Numbers.isArmstrong(n);
    }
}