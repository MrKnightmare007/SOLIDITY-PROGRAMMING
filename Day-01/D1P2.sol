//User input
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract UserInput {
    //A state variable to store user input
    string public userInput = "Hi";
    uint256 public data1;

    //Function to take input from the user
    function setInput(string memory input, uint256 d) public {
        userInput = input; //Store the input in the contract's state
        data1 = d;
    }

    //Function to retrieve the stored input
    function getInput1() public view returns (string memory) {
        return userInput;
    }

    function get() public view returns (uint256) {
        return data1;
    }
}
