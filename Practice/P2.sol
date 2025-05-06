// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract temperatureConvert {
    function convert(int256 temp ) public pure returns(int256) {
        return ((9*temp)/5 + 32);
    }
}

