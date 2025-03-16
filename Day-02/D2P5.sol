// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SimpleCalculator {
    // Enum to represent the mathematical operations
    enum Operation { Addition, Subtraction, Multiplication, Division, Modulo }
    
    // Event to log calculations
    event CalculationPerformed(
        uint256 num1,
        uint256 num2,
        Operation operation,
        int256 result
    );
    
    // Mapping to store history of calculations for an address
    mapping(address => Calculation[]) public calculationHistory;
    
    // Structure to store calculation details
    struct Calculation {
        uint256 timestamp;
        uint256 num1;
        uint256 num2;
        Operation operation;
        int256 result;
    }
    
    // Function to perform calculation
    function calculate(uint256 num1, uint256 num2, uint8 operationCode) public returns (int256) {
        require(operationCode <= 4, "Invalid operation: Use 0 for +, 1 for -, 2 for *, 3 for /, 4 for %");
        
        Operation operation = Operation(operationCode);
        int256 result;
        
        // Perform calculation based on the operation
        if (operation == Operation.Addition) {
            result = int256(num1) + int256(num2);
        } else if (operation == Operation.Subtraction) {
            result = int256(num1) - int256(num2);
        } else if (operation == Operation.Multiplication) {
            result = int256(num1) * int256(num2);
        } else if (operation == Operation.Division) {
            require(num2 != 0, "Division by zero");
            result = int256(num1) / int256(num2);
        } else if (operation == Operation.Modulo) {
            require(num2 != 0, "Modulo by zero");
            result = int256(num1) % int256(num2);
        }
        
        // Store calculation in history
        calculationHistory[msg.sender].push(
            Calculation({
                timestamp: block.timestamp,
                num1: num1,
                num2: num2,
                operation: operation,
                result: result
            })
        );
        
        // Emit event
        emit CalculationPerformed(num1, num2, operation, result);
        
        return result;
    }
    
    // View function to perform calculation without modifying state
    function getCalculationResult(uint256 num1, uint256 num2, uint8 operationCode) public pure returns (int256) {
        require(operationCode <= 4, "Invalid operation: Use 0 for +, 1 for -, 2 for *, 3 for /, 4 for %");
        
        Operation operation = Operation(operationCode);
        
        if (operation == Operation.Addition) {
            return int256(num1) + int256(num2);
        } else if (operation == Operation.Subtraction) {
            return int256(num1) - int256(num2);
        } else if (operation == Operation.Multiplication) {
            return int256(num1) * int256(num2);
        } else if (operation == Operation.Division) {
            require(num2 != 0, "Division by zero");
            return int256(num1) / int256(num2);
        } else if (operation == Operation.Modulo) {
            require(num2 != 0, "Modulo by zero");
            return int256(num1) % int256(num2);
        }
        
        revert("Unexpected error");
    }
    
    // Function to get the number of calculations performed by the caller
    function getCalculationCount() public view returns (uint256) {
        return calculationHistory[msg.sender].length;
    }
    
    // Function to get a specific calculation from history
    function getCalculationFromHistory(uint256 index) public view returns (Calculation memory) {
        require(index < calculationHistory[msg.sender].length, "Index out of bounds");
        return calculationHistory[msg.sender][index];
    }
    
    // Function to get operation name as string
    function getOperationName(uint8 operationCode) public pure returns (string memory) {
        require(operationCode <= 4, "Invalid operation code");
        
        if (operationCode == 0) return "Addition";
        if (operationCode == 1) return "Subtraction";
        if (operationCode == 2) return "Multiplication";
        if (operationCode == 3) return "Division";
        if (operationCode == 4) return "Modulo";
        
        return "Unknown";
    }
    
    // Function to clear calculation history
    function clearCalculationHistory() public {
        delete calculationHistory[msg.sender];
    }
}