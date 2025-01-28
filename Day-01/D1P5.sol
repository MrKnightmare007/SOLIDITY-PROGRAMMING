// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SwapValues {
    
    int256 public a;
    int256 public b;

    // Function to set initial values for a and b
    function setValues(int256 _a, int256 _b) public {
        a = _a;
        b = _b;
    }

    // Function to swap the values of a and b using a third variable
    function swapUsingThirdVariable() public {
        int256 temp = a; // Store value of a in temp
        a = b;           // Assign value of b to a
        b = temp;        // Assign value of temp (original a) to b
    }

    // Function to swap the values of a and b without using a third variable
    function swapWithoutThirdVariable() public {
        a = a + b; // Step 1: a becomes the sum of a and b
        b = a - b; // Step 2: b becomes the original value of a
        a = a - b; // Step 3: a becomes the original value of b
    }
}
