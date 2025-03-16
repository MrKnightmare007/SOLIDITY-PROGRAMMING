// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayDeletion {
    uint256[] public arr;

    function addElement(uint256 element) public {
        arr.push(element);
    }

    function deleteElement(uint256 position) public {
        require(position < arr.length, "Invalid position");
        for (uint256 i = position; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function getArray() public view returns (uint256[] memory) {
        return arr;
    }
}
