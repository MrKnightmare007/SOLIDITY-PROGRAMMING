//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library Numbers {
    function max(uint a, uint b) internal pure returns(uint) {
        return a > b ? a : b;
    }

    function min(uint a, uint b) internal pure returns(uint) {
        return a < b ? a : b;
    }

    function factorial(uint n) internal pure returns(uint) {
        if(n == 0 || n == 1) return 1;
        else return n * factorial(n-1);
    }
    
    function fibonacci(uint a, uint b) internal pure returns(uint[] memory) {
        require(a <= b, "Start Index must be less than the End index");

        uint length = b - a + 1;
        uint[] memory result = new uint[](length);

        if(b == 0) {
            result[0] = 0;
            return result;
        }

        uint[] memory fib = new uint[](b + 1);
        fib[0] = 0;
        if(b > 0) {
            fib[1] = 1;
        }

        for(uint i = 2; i <= b; i++) {
            fib[i] = fib[i - 1] + fib[i - 2];
        }

        for(uint i = a; i <= b; i++) {
            result[i - a] = fib[i];
        }

        return result;
    }

    function isArmstrong(uint n) internal pure returns(bool) {
        uint temp = n;
        uint digits = 0;
        uint sum = 0;

        while(temp > 0) {
            digits++;
            temp /= 10;
        }

        uint t = n;
        while(t > 0) {
            uint d = t % 10;
            sum += d ** digits;
            t /= 10;
        }

        return sum == n;
    }
}