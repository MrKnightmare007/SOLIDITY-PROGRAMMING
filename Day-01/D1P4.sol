// Simple Calculator
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SimpleCalculator {

    int256 public inputA;
    int256 public inputB;

    // Function to set inputs a and b
    function setInputs(int256 a, int256 b) public {
        inputA = a;
        inputB = b;
    }

    // Function to calculate the sum of the inputs
    function add() public view returns (int256) {
        return inputA + inputB;
    }

    // Function to calculate the difference of the inputs
    function subtract() public view returns (int256) {
        return inputA - inputB;
    }

    // Function to calculate the product of the inputs
    function multiply() public view returns (int256) {
        return inputA * inputB;
    }

    // Function to calculate the quotient of the inputs
    // Assumes inputB is not zero
    function divide() public view returns (int256) {
        require(inputB != 0, "Cannot divide by zero");
        return inputA / inputB;
    }

    // Function to calculate the remainder of the inputs
    // Assumes inputB is not zero
    function remainder() public view returns (int256) {
        require(inputB != 0, "Cannot divide by zero");
        return inputA % inputB;
    }
}
