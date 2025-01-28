// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract CircleArea {

    // Function to calculate the area of a circle
    function calculateArea(uint radius) public pure returns (uint) {
        // Using a fixed value of pi, approximated as 3.14159265358979323846
        // Solidity doesn't support floating point numbers, so we'll use an approximation
        uint256 pi = 3141592653589793238; // Pi * 10^18 (to preserve precision)
        
        // Formula: Area = pi * radius^2
        uint256 radiusSquared = radius * radius;
        
        // Calculate area as pi * radius^2 / 10^18 (to adjust for the scale factor)
        uint256 area = (pi * radiusSquared) / 1e18;
        
        return area;
    }
}





