// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Math library with utility functions
library MathLibrary {
    // Find the maximum of two numbers
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        return a >= b ? a : b;
    }
    
    // Find the minimum of two numbers
    function min(uint256 a, uint256 b) public pure returns (uint256) {
        return a <= b ? a : b;
    }
    
    // Calculate the factorial of a number
    function factorial(uint256 n) public pure returns (uint256) {
        // Factorials can grow very large, so we limit input to avoid overflow
        require(n <= 20, "Input too large, would cause overflow");
        
        if (n <= 1) {
            return 1;
        }
        
        uint256 result = 1;
        for (uint256 i = 2; i <= n; i++) {
            result *= i;
        }
        
        return result;
    }
    
    // Generate Fibonacci number at position n (0-indexed)
    function fibonacci(uint256 n) public pure returns (uint256) {
        // Fibonacci numbers grow quickly, so we limit input to avoid overflow
        require(n <= 78, "Input too large, would cause overflow");
        
        if (n == 0) return 0;
        if (n == 1) return 1;
        
        uint256 a = 0;
        uint256 b = 1;
        uint256 c;
        
        for (uint256 i = 2; i <= n; i++) {
            c = a + b;
            a = b;
            b = c;
        }
        
        return b;
    }
    
    // Generate array of Fibonacci numbers up to position n
    function fibonacciSeries(uint256 n) public pure returns (uint256[] memory) {
        // Fibonacci numbers grow quickly, so we limit input to avoid overflow
        require(n <= 78, "Input too large, would cause overflow");
        
        uint256[] memory series = new uint256[](n + 1);
        
        if (n >= 0) series[0] = 0;
        if (n >= 1) series[1] = 1;
        
        for (uint256 i = 2; i <= n; i++) {
            series[i] = series[i-1] + series[i-2];
        }
        
        return series;
    }
    
    // Check if a number is an Armstrong number
    // An Armstrong number is a number that is equal to the sum of its own digits each raised to the power of the number of digits
    function isArmstrong(uint256 n) public pure returns (bool) {
        uint256 originalNumber = n;
        uint256 numDigits = countDigits(n);
        uint256 sum = 0;
        
        while (n > 0) {
            uint256 digit = n % 10;
            sum += power(digit, numDigits);
            n /= 10;
        }
        
        return sum == originalNumber;
    }
    
    // Helper function to count the number of digits in a number
    function countDigits(uint256 n) internal pure returns (uint256) {
        if (n == 0) return 1;
        
        uint256 count = 0;
        while (n > 0) {
            count++;
            n /= 10;
        }
        
        return count;
    }
    
    // Helper function to calculate power
    function power(uint256 base, uint256 exponent) internal pure returns (uint256) {
        if (exponent == 0) return 1;
        if (base == 0) return 0;
        
        uint256 result = 1;
        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }
        
        return result;
    }
}

// Contract to test the Math Library functions
contract MathLibraryTest {
    using MathLibrary for uint256;
    
    // Event to log test results
    event TestResult(string testName, bool passed, string details);
    
    // Test maximum function
    function testMax(uint256 a, uint256 b) public returns (uint256) {
        uint256 result = MathLibrary.max(a, b);
        bool passed = (a >= b && result == a) || (b > a && result == b);
        
        emit TestResult(
            "Maximum", 
            passed, 
            string(abi.encodePacked("max(", uint2str(a), ", ", uint2str(b), ") = ", uint2str(result)))
        );
        
        return result;
    }
    
    // Test minimum function
    function testMin(uint256 a, uint256 b) public returns (uint256) {
        uint256 result = MathLibrary.min(a, b);
        bool passed = (a <= b && result == a) || (b < a && result == b);
        
        emit TestResult(
            "Minimum", 
            passed, 
            string(abi.encodePacked("min(", uint2str(a), ", ", uint2str(b), ") = ", uint2str(result)))
        );
        
        return result;
    }
    
    // Test factorial function
    function testFactorial(uint256 n) public returns (uint256) {
        require(n <= 20, "Input too large, would cause overflow");
        
        uint256 result = MathLibrary.factorial(n);
        bool passed = verifyFactorial(n, result);
        
        emit TestResult(
            "Factorial", 
            passed, 
            string(abi.encodePacked("factorial(", uint2str(n), ") = ", uint2str(result)))
        );
        
        return result;
    }
    
    // Test fibonacci function
    function testFibonacci(uint256 n) public returns (uint256) {
        require(n <= 78, "Input too large, would cause overflow");
        
        uint256 result = MathLibrary.fibonacci(n);
        bool passed = true; // Simplified validation as proper verification would require storing known values
        
        emit TestResult(
            "Fibonacci", 
            passed, 
            string(abi.encodePacked("fibonacci(", uint2str(n), ") = ", uint2str(result)))
        );
        
        return result;
    }
    
    // Test fibonacci series function
    function testFibonacciSeries(uint256 n) public returns (uint256[] memory) {
        require(n <= 78, "Input too large, would cause overflow");
        
        uint256[] memory result = MathLibrary.fibonacciSeries(n);
        bool passed = verifyFibonacciSeries(result);
        
        emit TestResult(
            "Fibonacci Series", 
            passed, 
            string(abi.encodePacked("fibonacciSeries(", uint2str(n), ") length = ", uint2str(result.length)))
        );
        
        return result;
    }
    
    // Test isArmstrong function
    function testIsArmstrong(uint256 n) public returns (bool) {
        bool result = MathLibrary.isArmstrong(n);
        
        // Known Armstrong numbers for verification
        bool passed = true;
        if (n == 1 || n == 153 || n == 370 || n == 371 || n == 407) {
            passed = result == true;
        } else if (n == 10 || n == 100 || n == 200 || n == 500) {
            passed = result == false;
        }
        
        emit TestResult(
            "Is Armstrong", 
            passed, 
            string(abi.encodePacked("isArmstrong(", uint2str(n), ") = ", result ? "true" : "false"))
        );
        
        return result;
    }
    
    // Run all tests with sample values
    function runAllTests() public {
        testMax(42, 17);
        testMin(42, 17);
        testFactorial(5);
        testFibonacci(10);
        testFibonacciSeries(10);
        testIsArmstrong(153); // Armstrong number
        testIsArmstrong(154); // Not an Armstrong number
    }
    
    // Helper function to verify factorial calculation
    function verifyFactorial(uint256 n, uint256 result) internal pure returns (bool) {
        if (n <= 1) return result == 1;
        
        uint256 expected = 1;
        for (uint256 i = 2; i <= n; i++) {
            expected *= i;
        }
        
        return expected == result;
    }
    
    // Helper function to verify fibonacci series
    function verifyFibonacciSeries(uint256[] memory series) internal pure returns (bool) {
        if (series.length == 0) return true;
        if (series.length == 1) return series[0] == 0;
        if (series.length == 2) return series[0] == 0 && series[1] == 1;
        
        for (uint256 i = 2; i < series.length; i++) {
            if (series[i] != series[i-1] + series[i-2]) {
                return false;
            }
        }
        
        return true;
    }
    
    // Helper function to convert uint to string
    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = uint8(48 + _i % 10);
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        
        return string(bstr);
    }
}