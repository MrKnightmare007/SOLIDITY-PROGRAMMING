// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract areaOfCircle {
    uint256 constant PI = 31459;
    uint256 precision = 10000;
    function area(uint256 radius) public view returns(uint256) {
        return (PI * radius * radius)/precision;
    }
}