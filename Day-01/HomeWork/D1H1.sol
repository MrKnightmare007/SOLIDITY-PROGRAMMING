// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MinimumNotesCalculator {
    // Denominations of the notes
    uint[] public denominations = [100, 50, 10, 5, 2, 1];

    // Function to calculate the minimum number of notes
    function calculateMinimumNotes(uint N) public view returns (uint[] memory) {
        uint[] memory noteCounts = new uint[](6); // Array to store the count of each note
        uint remainingAmount = N;

        for (uint i = 0; i < denominations.length; i++) {
            if (remainingAmount >= denominations[i]) {
                noteCounts[i] = remainingAmount / denominations[i];
                remainingAmount = remainingAmount % denominations[i];
            } else {
                noteCounts[i] = 0;
            }
        }

        return noteCounts;
    }

    // Function to get the total number of notes
    function getTotalNotes(uint N) public view returns (uint) {
        uint[] memory noteCounts = calculateMinimumNotes(N);
        uint totalNotes = 0;

        for (uint i = 0; i < noteCounts.length; i++) {
            totalNotes += noteCounts[i];
        }

        return totalNotes;
    }
}