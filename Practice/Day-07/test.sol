// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MathUtils {
    function fibonacci(uint a, uint b) internal pure returns (uint[] memory) {
        require(a <= b, "Start index must be less than or equal to end index");
        
        // Calculate the size of the output array
        uint length = b - a + 1;
        uint[] memory result = new uint[](length);
        
        // Handle edge cases for a and b
        if (b == 0) {
            result[0] = 0;
            return result;
        }
        
        // Initialize variables for Fibonacci calculation
        uint[] memory fib = new uint[](b + 1); // Temporary array to store Fibonacci numbers up to b
        fib[0] = 0;
        if (b >= 1) {
            fib[1] = 1;
        }
        
        // Generate Fibonacci numbers up to index b
        for (uint i = 2; i <= b; i++) {
            fib[i] = fib[i - 1] + fib[i - 2];
        }
        
        // Copy the relevant portion (from a to b) to the result array
        for (uint i = a; i <= b; i++) {
            result[i - a] = fib[i];
        }
        
        return result;
    }
}

contract MathVerifier {
    using MathUtils for uint;

    // Test function to verify the Fibonacci series
    function testFibonacci(uint a, uint b) public pure returns (uint[] memory) {
        return MathUtils.fibonacci(a, b);
    }
}