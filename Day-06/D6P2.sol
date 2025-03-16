// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Math library to handle more complex operations
library MathExtension {
    // Calculate square root using Newton's method
    function sqrt(uint256 x) internal pure returns (uint256) {
        if (x == 0) return 0;
        
        uint256 z = (x + 1) / 2;
        uint256 y = x;
        
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        
        return y;
    }
    
    // Calculate absolute value
    function abs(int256 x) internal pure returns (uint256) {
        return x >= 0 ? uint256(x) : uint256(-x);
    }
    
    // Calculate exponentiation (x^n)
    function power(uint256 base, uint256 exponent) internal pure returns (uint256) {
        if (exponent == 0) return 1;
        if (base == 0) return 0;
        
        uint256 result = 1;
        while (exponent > 0) {
            if (exponent % 2 == 1) {
                result = result * base;
            }
            base = base * base;
            exponent = exponent / 2;
        }
        
        return result;
    }
}

contract Calculator {
    // Using SafeMath is generally unnecessary in Solidity 0.8.0+
    // as overflow checks are built into the compiler
    
    // Events to log calculations
    event CalculationPerformed(string operation, int256 result);
    event UintCalculationPerformed(string operation, uint256 result);
    
    // Basic arithmetic operations
    function add(int256 a, int256 b) public returns (int256) {
        int256 result = a + b;
        emit CalculationPerformed("addition", result);
        return result;
    }
    
    function subtract(int256 a, int256 b) public returns (int256) {
        int256 result = a - b;
        emit CalculationPerformed("subtraction", result);
        return result;
    }
    
    function multiply(int256 a, int256 b) public returns (int256) {
        int256 result = a * b;
        emit CalculationPerformed("multiplication", result);
        return result;
    }
    
    function divide(int256 a, int256 b) public returns (int256) {
        require(b != 0, "Division by zero");
        int256 result = a / b;
        emit CalculationPerformed("division", result);
        return result;
    }
    
    function modulo(int256 a, int256 b) public returns (int256) {
        require(b != 0, "Modulo by zero");
        int256 result = a % b;
        emit CalculationPerformed("modulo", result);
        return result;
    }
    
    // Advanced operations using our custom library
    function squareRoot(uint256 a) public returns (uint256) {
        uint256 result = MathExtension.sqrt(a);
        emit UintCalculationPerformed("square root", result);
        return result;
    }
    
    function absoluteValue(int256 a) public returns (uint256) {
        uint256 result = MathExtension.abs(a);
        emit UintCalculationPerformed("absolute value", result);
        return result;
    }
    
    function exponentiation(uint256 base, uint256 exponent) public returns (uint256) {
        uint256 result = MathExtension.power(base, exponent);
        emit UintCalculationPerformed("exponentiation", result);
        return result;
    }
    
    // View functions that don't modify state (no events emitted)
    function addView(int256 a, int256 b) public pure returns (int256) {
        return a + b;
    }
    
    function subtractView(int256 a, int256 b) public pure returns (int256) {
        return a - b;
    }
    
    function multiplyView(int256 a, int256 b) public pure returns (int256) {
        return a * b;
    }
    
    function divideView(int256 a, int256 b) public pure returns (int256) {
        require(b != 0, "Division by zero");
        return a / b;
    }
    
    function moduloView(int256 a, int256 b) public pure returns (int256) {
        require(b != 0, "Modulo by zero");
        return a % b;
    }
    
    function squareRootView(uint256 a) public pure returns (uint256) {
        return MathExtension.sqrt(a);
    }
    
    function absoluteValueView(int256 a) public pure returns (uint256) {
        return MathExtension.abs(a);
    }
    
    function exponentiationView(uint256 base, uint256 exponent) public pure returns (uint256) {
        return MathExtension.power(base, exponent);
    }
}