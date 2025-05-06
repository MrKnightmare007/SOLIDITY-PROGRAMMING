// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract reportCard {
    uint256 public marks;

    constructor(uint256 _marks) {
        marks = _marks;
    }

    function grades() public view returns(string memory) {
        if (marks >= 90) {
            return "O";
        }
        else if(marks <= 89 && marks >= 80) {
            return "E";
        }
        else if(marks <= 79 && marks >= 70) {
            return "A";
        }
        else if(marks <= 69 && marks >= 60) {
            return "B";
        }
        else if(marks <= 59 && marks >= 50) {
            return "C";
        }
        else if(marks <= 49 && marks >= 40) {
            return "D";
        }
        else {
            return "F";
        }
    }
}