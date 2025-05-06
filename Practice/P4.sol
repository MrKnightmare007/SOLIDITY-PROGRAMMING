// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract swap {
    int256 public a;
    int256 public b;

    function setValues(int256 _a, int256 _b) public {
        a = _a;
        b = _b;
    }

    function withThird() public {
        int256 temp;
        temp = a;
        a = b;
        b = temp;
    }

    function withoutThird() public {
        a = a + b;
        b = a - b;
        a = a - b;
    }
}