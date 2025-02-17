// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract VowelConsonantChecker {
    // Function to check if a character is a vowel or consonant
    function checkAlphabet(bytes1 _char) public pure returns (string memory) {
        // Convert the input byte to a lowercase character for comparison
        bytes1 lowerChar = toLower(_char);

        // Check if the character is a vowel
        if (lowerChar == 'a' || lowerChar == 'e' || lowerChar == 'i' || lowerChar == 'o' || lowerChar == 'u') {
            return "Vowel";
        } 
        // Check if the character is a consonant (assuming input is a valid alphabet)
        else if (lowerChar >= 'a' && lowerChar <= 'z') {
            return "Consonant";
        } 
        // Handle invalid input (not an alphabet)
        else {
            return "Invalid input";
        }
    }

    // Helper function to convert a byte to lowercase
    function toLower(bytes1 _char) internal pure returns (bytes1) {
        // Check if the character is an uppercase letter
        if (_char >= 'A' && _char <= 'Z') {
            // Convert to lowercase by adding 32 (ASCII difference)
            return bytes1(uint8(_char) + 32);
        }
        return _char;
    }
}