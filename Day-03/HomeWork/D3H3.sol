// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SeriesSumCalculator {
    // Function to calculate sum of first N natural numbers
    // S = 1 + 2 + 3 + 4 + ... + N
    function calculateNaturalNumbersSum(uint256 n) public pure returns (uint256) {
        // Using the formula: sum = n * (n + 1) / 2
        return n * (n + 1) / 2;
    }
    
    // Function to calculate sum of first N odd numbers
    // S = 1 + 3 + 5 + 7 + ... + N (where N is odd)
    function calculateOddNumbersSum(uint256 n) public pure returns (uint256) {
        require(n % 2 == 1, "N must be odd");
        
        // Calculate how many odd numbers are there up to N
        uint256 count = (n + 1) / 2;
        
        // Using the formula: sum = count^2
        return count * count;
    }
    
    // Alternative function that calculates sum of first N odd numbers
    // S = 1 + 3 + 5 + 7 + ... (up to N terms)
    function calculateFirstNOddNumbersSum(uint256 n) public pure returns (uint256) {
        // Using the formula: sum = n^2
        return n * n;
    }
    
    // Function to calculate sum using iteration (for demonstration)
    function calculateSumByIteration(uint256 n, bool oddOnly) public pure returns (uint256) {
        uint256 sum = 0;
        
        if (oddOnly) {
            // Sum of odd numbers only
            for (uint256 i = 1; i <= n; i += 2) {
                sum += i;
            }
        } else {
            // Sum of all numbers
            for (uint256 i = 1; i <= n; i++) {
                sum += i;
            }
        }
        
        return sum;
    }
}
