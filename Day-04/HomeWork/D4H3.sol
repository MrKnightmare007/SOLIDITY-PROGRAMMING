// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayReversal {
    uint256[] public arr;

    function addElement(uint256 element) public {
        arr.push(element);
    }

    function reverseArray() public {
        uint256 length = arr.length;
        for (uint256 i = 0; i < length / 2; i++) {
            uint256 temp = arr[i];
            arr[i] = arr[length - i - 1];
            arr[length - i - 1] = temp;
        }
    }

    function getArray() public view returns (uint256[] memory) {
        return arr;
    }
}