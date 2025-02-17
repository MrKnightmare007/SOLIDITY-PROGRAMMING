// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract LeapYearChecker {
    // Function to check if a year is a leap year
    function isLeapYear(uint256 year) public pure returns (bool) {
        // A year is a leap year if it is divisible by 4, but not by 100, unless it is also divisible by 400
        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            return true;
        } else {
            return false;
        }
    }
}