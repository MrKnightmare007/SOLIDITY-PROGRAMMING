// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseSquareChecker {
    // Function to reverse a number
    function reverseNumber(uint256 num) public pure returns (uint256) {
        uint256 reversed = 0;
        
        while (num > 0) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        
        return reversed;
    }
    
    // Function to check if square of a number equals reverse of square of reverse of the number
    function checkReverseSquareProperty(uint256 num) public pure returns (bool) {
        uint256 reverseOfNum = reverseNumber(num);
        uint256 squareOfNum = num * num;
        uint256 squareOfReverseNum = reverseOfNum * reverseOfNum;
        uint256 reverseOfSquare = reverseNumber(squareOfNum);
        
        return squareOfReverseNum == reverseOfSquare;
    }
    
    // Function to get all calculations for debugging
    function getCalculations(uint256 num) public pure returns (
        uint256 reverseOfNum,
        uint256 squareOfNum,
        uint256 squareOfReverseNum,
        uint256 reverseOfSquare
    ) {
        reverseOfNum = reverseNumber(num);
        squareOfNum = num * num;
        squareOfReverseNum = reverseOfNum * reverseOfNum;
        reverseOfSquare = reverseNumber(squareOfNum);
        
        return (reverseOfNum, squareOfNum, squareOfReverseNum, reverseOfSquare);
    }
}
