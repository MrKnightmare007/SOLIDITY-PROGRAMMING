// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Coprime {
    struct pair{
        uint a;
        uint b;
    }
    pair[] public arr; // To store numbers that are co-prime with others

    // Function to check if two numbers are co-prime
    function checkCoprime(uint n1, uint n2) public pure returns (bool) {
        uint a = n1;
        uint b = n2;  
        
        if (a > b) {
            (a, b) = (b, a); // Swap if n1 > n2
        }
        
        while (b != 0) {
            uint temp = b;
            b = a % b;
            a = temp;
        }

        return a == 1; // If GCD is 1, they are co-prime
    }

    // Function to check co-primes in a given range [start, end]
    function checkRange(uint start, uint end) public {
        delete arr; // Reset the array before repopulating
        
        for (uint i = start; i <= end; i++) {
            for (uint j = i + 1; j <= end; j++) {
                if (checkCoprime(i, j)) {
                    arr.push(pair(i,j)); // Push only the numbers which are co-prime with any other number
                }
            }
        }
    }

    // Function to get the stored array of numbers
    function getArray() public view returns (pair[] memory) {
        return arr;
    }
}