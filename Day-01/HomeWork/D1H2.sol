// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SalaryCalculator {
    // Function to calculate the total pay
    function calculateTotalPay(uint basic, uint da, uint hra) public pure returns (uint) {
        // Ensure inputs are valid (optional, depending on use case)
        require(basic > 0, "Basic salary must be greater than 0");
        require(da >= 0, "DA cannot be negative");
        require(hra >= 0, "HRA cannot be negative");

        // Calculate total pay
        uint totalPay = basic + da + hra;

        return totalPay;
    }
}