// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayInsertion {
    uint256[] public arr;

    function insertElement(uint256 element, uint256 position) public {
        require(position <= arr.length, "Invalid position");
        arr.push(0);
        for (uint256 i = arr.length - 1; i > position; i--) {
            arr[i] = arr[i - 1];
        }
        arr[position] = element;
    }

    function getArray() public view returns (uint256[] memory) {
        return arr;
    }
}
