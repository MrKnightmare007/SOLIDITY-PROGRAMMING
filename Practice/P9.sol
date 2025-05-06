// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract minMax {
    int256 a;
    int256 b;
    int256 c;

    constructor(int256 _a, int256 _b, int256 _c) {
        a = _a;
        b = _b;
        c = _c;
    }

    function Minimum() public view returns(int256) {
        if(a < b && a < c) return a;
        else if(b < c) return b;
        else return c;
    }

    function Maximum() public view returns(int256) {
        if(a > b && a > c) return a;
        else if(b > c) return b;
        else return c;
    }
}