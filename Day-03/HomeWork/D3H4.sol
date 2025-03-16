// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PerfectNumberChecker {
    // Function to check if a number is perfect
    function isPerfectNumber(uint256 num) public pure returns (bool) {
        if (num <= 1) return false;
        
        uint256 sum = 1; // Start with 1 as divisor
        
        // Check divisors up to sqrt(num) for efficiency
        for (uint256 i = 2; i * i <= num; i++) {
            if (num % i == 0) {
                sum += i;
                
                // If i is not the square root, add the paired divisor
                if (i != num / i) {
                    sum += num / i;
                }
            }
        }
        
        return sum == num;
    }
    
    // Function to get all proper divisors of a number
    function getProperDivisors(uint256 num) public pure returns (uint256[] memory) {
        if (num <= 1) {
            uint256[] memory emptyArray = new uint256[](0);
            return emptyArray;
        }
        
        // First count the number of divisors
        uint256 divisorCount = 0;
        for (uint256 i = 1; i < num; i++) {
            if (num % i == 0) {
                divisorCount++;
            }
        }
        
        // Create and fill the array with proper divisors
        uint256[] memory divisors = new uint256[](divisorCount);
        uint256 index = 0;
        
        for (uint256 i = 1; i < num; i++) {
            if (num % i == 0) {
                divisors[index] = i;
                index++;
            }
        }
        
        return divisors;
    }
    
    // Function to calculate the sum of proper divisors
    function sumOfProperDivisors(uint256 num) public pure returns (uint256) {
        if (num <= 1) return 0;
        
        uint256 sum = 1; // Start with 1 as divisor
        
        for (uint256 i = 2; i * i <= num; i++) {
            if (num % i == 0) {
                sum += i;
                
                // If i is not the square root, add the paired divisor
                if (i != num / i) {
                    sum += num / i;
                }
            }
        }
        
        return sum;
    }
}
