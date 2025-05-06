// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract currency {
    uint256[] public denominations = [100, 50, 10, 5, 2, 1];

    function calculateMinimumNotes(uint256 N) public view returns(uint256[] memory) {
        uint256[] memory notesCount = new uint256[](6);
        uint256 remainingAmount = N;
        for(uint256 i = 0; i < denominations.length; i++) {
            if(remainingAmount >= denominations[i]) {
                notesCount[i] = remainingAmount / denominations[i];
                remainingAmount = remainingAmount % denominations[i];
            } else {
                notesCount[i] = 0;
            }
        }
        return notesCount;
    }

    function totalNotesCount(uint256 N) public view returns(uint256) {
        uint256 total = 0;
        uint256[] memory notesCount = calculateMinimumNotes(N);
        for(uint256 i = 0; i < notesCount.length; i++) {
            total += notesCount[i];
        }
        return total;
    }

}