// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract StudentGradeCalculator {
    // Event to log grade calculations
    event GradeCalculated(uint256 score, string grade);

    // Function to calculate grade based on score
    function calculateGrade(uint256 score) public returns (string memory) {
        require(score <= 100, "Score must be between 0 and 100");
        
        string memory grade;
        
        if (score >= 90) {
            grade = "O";
        } else if (score >= 80) {
            grade = "E";
        } else if (score >= 70) {
            grade = "A";
        } else if (score >= 60) {
            grade = "B";
        } else if (score >= 50) {
            grade = "C";
        } else if (score >= 40) {
            grade = "D";
        } else {
            grade = "F";
        }
        
        // Emit an event with the score and grade
        emit GradeCalculated(score, grade);
        
        return grade;
    }
    
    // View function to calculate grade without modifying state
    function getGrade(uint256 score) public pure returns (string memory) {
        require(score <= 100, "Score must be between 0 and 100");
        
        if (score >= 90) {
            return "O";
        } else if (score >= 80) {
            return "E";
        } else if (score >= 70) {
            return "A";
        } else if (score >= 60) {
            return "B";
        } else if (score >= 50) {
            return "C";
        } else if (score >= 40) {
            return "D";
        } else {
            return "F";
        }
    }
}