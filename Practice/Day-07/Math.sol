//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library Math {
    function add(uint a, uint b) internal pure returns(uint) {
        return a + b;
    }

    function subtract(uint a, uint b) internal pure returns(uint) {
        require(a >= b, "Subtraction underflow");
        return a - b;
    }

    function multiply(uint a, uint b) internal pure returns(uint) {
        return a * b;
    }

    function divide(uint a, uint b) internal pure returns(uint) {
        require(b != 0, "Division by zero");
        return a / b;
    }

    function mod(uint a, uint b) internal pure returns(uint) {
        require(b != 0, "Modulo by zero");
        return a % b;
    }

    function sqrt(uint n) internal pure returns(uint) {
        if(n == 0) return 0;
        uint z = (n + 1) / 2;
        uint y = n;
        while(z < y) {
            y = z;
            z = (n / z + z) / 2;
        }
        return y;
    }
    
    function abs(int n) internal pure returns(uint) {
        return uint(n > 0 ? n : -n);
    }

    function pow(uint a , uint b) internal pure returns(uint) {
        if(b == 0) return 1;
        uint p = 1;
        for(uint i = 1; i <= b; i++) {
            p *= a;
        }
        return p;
    }
}