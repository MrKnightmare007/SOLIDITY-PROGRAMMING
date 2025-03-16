// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberOperations {
    // a. Calculate factorial of a given number
    function calculateFactorial(uint256 n) public pure returns (uint256) {
        require(n <= 20, "Number too large for factorial calculation");
        
        if (n == 0 || n == 1) return 1;
        
        uint256 result = 1;
        for (uint256 i = 2; i <= n; i++) {
            result *= i;
        }
        
        return result;
    }
    
    // b. Check if a number is prime
    function isPrime(uint256 n) public pure returns (bool) {
        if (n <= 1) return false;
        if (n <= 3) return true;
        if (n % 2 == 0 || n % 3 == 0) return false;
        
        for (uint256 i = 5; i * i <= n; i += 6) {
            if (n % i == 0 || n % (i + 2) == 0) {
                return false;
            }
        }
        
        return true;
    }
    
    // c. Check if a number is palindrome
    function isPalindrome(uint256 n) public pure returns (bool) {
        uint256 original = n;
        uint256 reversed = 0;
        
        while (n > 0) {
            reversed = reversed * 10 + n % 10;
            n /= 10;
        }
        
        return original == reversed;
    }
    
    // Bonus: Get all prime numbers up to n
    function getPrimesUpTo(uint256 n) public pure returns (uint256[] memory) {
        // First count the number of primes
        uint256 primeCount = 0;
        for (uint256 i = 2; i <= n; i++) {
            if (isPrime(i)) {
                primeCount++;
            }
        }
        
        // Create and fill the array with primes
        uint256[] memory primes = new uint256[](primeCount);
        uint256 index = 0;
        
        for (uint256 i = 2; i <= n; i++) {
            if (isPrime(i)) {
                primes[index] = i;
                index++;
            }
        }
        
        return primes;
    }
}
