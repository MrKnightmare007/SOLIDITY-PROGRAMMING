// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {

    // Declare prize winners
    address public firstPrizeWinner;
    address public secondPrizeWinner;
    address public thirdPrizeWinner;

    uint public randomNumber; // Store the random number

    // Event to emit when the lottery is drawn
    event LotteryDrawn(uint winningNumber, address firstPrizeWinner, address secondPrizeWinner, address thirdPrizeWinner);

    // Function to generate a pseudo-random number and assign prizes
    function drawLottery() public {
        // Generate a pseudo-random number using block properties
        uint lotteryNumber = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % 1000;
        randomNumber = lotteryNumber; // Store the generated number

        // Reset previous winners
        firstPrizeWinner = address(0);
        secondPrizeWinner = address(0);
        thirdPrizeWinner = address(0);
        
        // Check if the number is divisible by both 3 and 5 for first prize
        if (lotteryNumber % 3 == 0 && lotteryNumber % 5 == 0) {
            firstPrizeWinner = msg.sender; // Current caller gets the first prize
        }
        // Check if the number is divisible by 7 or 11 for second prize
        else if (lotteryNumber % 7 == 0 || lotteryNumber % 11 == 0) {
            secondPrizeWinner = msg.sender; // Current caller gets the second prize
        }
        // Check if the number is divisible by 5 but not 10 for third prize
        else if (lotteryNumber % 5 == 0 && lotteryNumber % 10 != 0) {
            thirdPrizeWinner = msg.sender; // Current caller gets the third prize
        }

        // Emit the lottery result event
        emit LotteryDrawn(lotteryNumber, firstPrizeWinner, secondPrizeWinner, thirdPrizeWinner);
    }

    // Function to check if a given address has won the first prize
    function getFirstPrizeWinner() public view returns (address) {
        return firstPrizeWinner;
    }

    // Function to check if a given address has won the second prize
    function getSecondPrizeWinner() public view returns (address) {
        return secondPrizeWinner;
    }

    // Function to check if a given address has won the third prize
    function getThirdPrizeWinner() public view returns (address) {
        return thirdPrizeWinner;
    }

    // Function to get the generated random number
    function getRandomNumber() public view returns (uint) {
        return randomNumber;
    }
}
