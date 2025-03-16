// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MaxMinFinder {
    // Event to log the results
    event ResultsCalculated(uint256 a, uint256 b, uint256 c, uint256 maximum, uint256 minimum);
    
    // Function to find maximum and minimum of three numbers
    function findMaxAndMin(uint256 a, uint256 b, uint256 c) public returns (uint256 maximum, uint256 minimum) {
        // Find maximum
        maximum = a;
        if (b > maximum) {
            maximum = b;
        }
        if (c > maximum) {
            maximum = c;
        }
        
        // Find minimum
        minimum = a;
        if (b < minimum) {
            minimum = b;
        }
        if (c < minimum) {
            minimum = c;
        }
        
        // Emit an event with the inputs and results
        emit ResultsCalculated(a, b, c, maximum, minimum);
        
        return (maximum, minimum);
    }
    
    // View function to find maximum and minimum without modifying state
    function getMaxAndMin(uint256 a, uint256 b, uint256 c) public pure returns (uint256 maximum, uint256 minimum) {
        // Find maximum
        maximum = a;
        if (b > maximum) {
            maximum = b;
        }
        if (c > maximum) {
            maximum = c;
        }
        
        // Find minimum
        minimum = a;
        if (b < minimum) {
            minimum = b;
        }
        if (c < minimum) {
            minimum = c;
        }
        
        return (maximum, minimum);
    }
}