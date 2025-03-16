// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract TriangleAnalyzer {
    // Define triangle types as constants
    uint8 constant NOT_A_TRIANGLE = 0;
    uint8 constant SCALENE = 1;
    uint8 constant ISOSCELES = 2;
    uint8 constant EQUILATERAL = 3;
    uint8 constant RIGHT_ANGLED = 4;
    
    // Event to log triangle analysis results
    event TriangleAnalyzed(
        uint256 side1,
        uint256 side2,
        uint256 side3,
        uint8 triangleType,
        string triangleTypeName,
        uint256 area
    );
    
    // Function to analyze a triangle
    function analyzeTriangle(uint256 a, uint256 b, uint256 c) public returns (uint8 triangleType, uint256 area) {
        // Check if the sides can form a triangle
        bool isTriangle = (a + b > c) && (a + c > b) && (b + c > a);
        
        if (!isTriangle) {
            emit TriangleAnalyzed(a, b, c, NOT_A_TRIANGLE, "Not a Triangle", 0);
            return (NOT_A_TRIANGLE, 0);
        }
        
        // Determine triangle type
        if (a == b && b == c) {
            triangleType = EQUILATERAL;
        } else if (a == b || b == c || a == c) {
            // Check if it's also a right-angled triangle
            if (isRightAngled(a, b, c)) {
                triangleType = RIGHT_ANGLED;
            } else {
                triangleType = ISOSCELES;
            }
        } else {
            // Check if it's a right-angled triangle
            if (isRightAngled(a, b, c)) {
                triangleType = RIGHT_ANGLED;
            } else {
                triangleType = SCALENE;
            }
        }
        
        // Calculate area using Heron's formula
        area = calculateArea(a, b, c);
        
        // Get triangle type name for the event
        string memory typeName = getTriangleTypeName(triangleType);
        
        // Emit event with results
        emit TriangleAnalyzed(a, b, c, triangleType, typeName, area);
        
        return (triangleType, area);
    }
    
    // View function to check if inputs form a triangle
    function isValidTriangle(uint256 a, uint256 b, uint256 c) public pure returns (bool) {
        return (a + b > c) && (a + c > b) && (b + c > a);
    }
    
    // View function to get triangle type and area
    function getTriangleInfo(uint256 a, uint256 b, uint256 c) public pure returns (uint8 triangleType, uint256 area) {
        // Check if the sides can form a triangle
        bool isTriangle = (a + b > c) && (a + c > b) && (b + c > a);
        
        if (!isTriangle) {
            return (NOT_A_TRIANGLE, 0);
        }
        
        // Determine triangle type
        if (a == b && b == c) {
            triangleType = EQUILATERAL;
        } else if (a == b || b == c || a == c) {
            // Check if it's also a right-angled triangle
            if (isRightAngled(a, b, c)) {
                triangleType = RIGHT_ANGLED;
            } else {
                triangleType = ISOSCELES;
            }
        } else {
            // Check if it's a right-angled triangle
            if (isRightAngled(a, b, c)) {
                triangleType = RIGHT_ANGLED;
            } else {
                triangleType = SCALENE;
            }
        }
        
        // Calculate area
        area = calculateArea(a, b, c);
        
        return (triangleType, area);
    }
    
    // Helper function to check if a triangle is right-angled
    function isRightAngled(uint256 a, uint256 b, uint256 c) internal pure returns (bool) {
        // Sort the sides to identify the longest side
        uint256[3] memory sides = sortSides(a, b, c);
        
        // Use Pythagorean theorem: a² + b² = c² (where c is the longest side)
        // Allow for small rounding errors in integer math by checking equality
        return sides[0] * sides[0] + sides[1] * sides[1] == sides[2] * sides[2];
    }
    
    // Helper function to sort three sides (ascending order)
    function sortSides(uint256 a, uint256 b, uint256 c) internal pure returns (uint256[3] memory) {
        uint256[3] memory sides;
        sides[0] = a;
        sides[1] = b;
        sides[2] = c;
        
        // Simple bubble sort
        if (sides[0] > sides[1]) {
            (sides[0], sides[1]) = (sides[1], sides[0]);
        }
        if (sides[1] > sides[2]) {
            (sides[1], sides[2]) = (sides[2], sides[1]);
        }
        if (sides[0] > sides[1]) {
            (sides[0], sides[1]) = (sides[1], sides[0]);
        }
        
        return sides;
    }
    
    // Helper function to calculate area using Heron's formula
    function calculateArea(uint256 a, uint256 b, uint256 c) internal pure returns (uint256) {
        // Calculate semi-perimeter
        uint256 s = (a + b + c) / 2;
        
        // Use Heron's formula: Area = √(s(s-a)(s-b)(s-c))
        // Since Solidity doesn't have built-in square root, we'll calculate and return s(s-a)(s-b)(s-c)
        // which is the square of the area
        uint256 squaredArea = s * (s - a) * (s - b) * (s - c);
        
        // Calculate approximate square root using a simple binary search method
        uint256 area = sqrt(squaredArea);
        
        return area;
    }
    
    // Helper function to get the triangle type name
    function getTriangleTypeName(uint8 triangleType) internal pure returns (string memory) {
        if (triangleType == NOT_A_TRIANGLE) return "Not a Triangle";
        if (triangleType == SCALENE) return "Scalene";
        if (triangleType == ISOSCELES) return "Isosceles";
        if (triangleType == EQUILATERAL) return "Equilateral";
        if (triangleType == RIGHT_ANGLED) return "Right-angled";
        return "Unknown";
    }
    
    // Helper function to calculate square root
    function sqrt(uint256 x) internal pure returns (uint256) {
        if (x == 0) return 0;
        
        // Initial estimate
        uint256 z = (x + 1) / 2;
        uint256 y = x;
        
        // Newton's method for square root approximation
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        
        return y;
    }
}