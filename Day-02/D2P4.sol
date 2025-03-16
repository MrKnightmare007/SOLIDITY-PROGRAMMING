// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract QuadraticEquationSolver {
    // Define root types
    uint8 constant TWO_REAL_ROOTS = 1;
    uint8 constant ONE_REAL_ROOT = 2;
    uint8 constant COMPLEX_ROOTS = 3;
    
    // Structure to hold complex numbers
    struct Complex {
        int256 real;
        int256 imaginary;
    }
    
    // Structure to hold quadratic equation roots
    struct Roots {
        uint8 rootType;
        Complex root1;
        Complex root2;
    }
    
    // Event to log the results
    event RootsCalculated(
        int256 a,
        int256 b,
        int256 c,
        uint8 rootType,
        int256 root1Real,
        int256 root1Imaginary,
        int256 root2Real,
        int256 root2Imaginary
    );
    
    // Function to solve the quadratic equation
    function solveQuadratic(int256 a, int256 b, int256 c) public returns (Roots memory) {
        require(a != 0, "Not a quadratic equation, 'a' must not be zero");
        
        // Calculate discriminant: b^2 - 4ac
        int256 discriminant = b * b - 4 * a * c;
        
        Roots memory result;
        
        if (discriminant > 0) {
            // Two real roots
            result.rootType = TWO_REAL_ROOTS;
            
            // Calculate the square root of discriminant
            int256 sqrtDiscriminant = intSqrt(uint256(discriminant));
            
            // Calculate numerator / denominator (We divide by 2 separately to avoid overflow)
            int256 denominator = 2 * a;
            int256 numerator1 = -b + sqrtDiscriminant;
            int256 numerator2 = -b - sqrtDiscriminant;
            
            // Calculate roots
            result.root1.real = numerator1 / denominator;
            result.root1.imaginary = 0;
            
            result.root2.real = numerator2 / denominator;
            result.root2.imaginary = 0;
        } 
        else if (discriminant == 0) {
            // One real root (repeated)
            result.rootType = ONE_REAL_ROOT;
            
            // Calculate the root: -b / (2a)
            result.root1.real = -b / (2 * a);
            result.root1.imaginary = 0;
            
            result.root2.real = result.root1.real;
            result.root2.imaginary = 0;
        } 
        else {
            // Complex roots
            result.rootType = COMPLEX_ROOTS;
            
            // Calculate real part: -b / (2a)
            int256 realPart = -b / (2 * a);
            
            // Calculate imaginary part: sqrt(|discriminant|) / (2a)
            int256 sqrtAbsDiscriminant = intSqrt(uint256(-discriminant));
            int256 imaginaryPart = sqrtAbsDiscriminant / (2 * a);
            
            // Ensure imaginary part is positive
            if (a < 0) {
                imaginaryPart = -imaginaryPart;
            }
            
            result.root1.real = realPart;
            result.root1.imaginary = imaginaryPart;
            
            result.root2.real = realPart;
            result.root2.imaginary = -imaginaryPart;
        }
        
        // Emit event with results
        emit RootsCalculated(
            a,
            b,
            c,
            result.rootType,
            result.root1.real,
            result.root1.imaginary,
            result.root2.real,
            result.root2.imaginary
        );
        
        return result;
    }
    
    // View function to solve the quadratic equation without modifying state
    function getQuadraticRoots(int256 a, int256 b, int256 c) public pure returns (Roots memory) {
        require(a != 0, "Not a quadratic equation, 'a' must not be zero");
        
        // Calculate discriminant: b^2 - 4ac
        int256 discriminant = b * b - 4 * a * c;
        
        Roots memory result;
        
        if (discriminant > 0) {
            // Two real roots
            result.rootType = TWO_REAL_ROOTS;
            
            // Calculate the square root of discriminant
            int256 sqrtDiscriminant = intSqrt(uint256(discriminant));
            
            // Calculate numerator / denominator (We divide by 2 separately to avoid overflow)
            int256 denominator = 2 * a;
            int256 numerator1 = -b + sqrtDiscriminant;
            int256 numerator2 = -b - sqrtDiscriminant;
            
            // Calculate roots
            result.root1.real = numerator1 / denominator;
            result.root1.imaginary = 0;
            
            result.root2.real = numerator2 / denominator;
            result.root2.imaginary = 0;
        } 
        else if (discriminant == 0) {
            // One real root (repeated)
            result.rootType = ONE_REAL_ROOT;
            
            // Calculate the root: -b / (2a)
            result.root1.real = -b / (2 * a);
            result.root1.imaginary = 0;
            
            result.root2.real = result.root1.real;
            result.root2.imaginary = 0;
        } 
        else {
            // Complex roots
            result.rootType = COMPLEX_ROOTS;
            
            // Calculate real part: -b / (2a)
            int256 realPart = -b / (2 * a);
            
            // Calculate imaginary part: sqrt(|discriminant|) / (2a)
            int256 sqrtAbsDiscriminant = intSqrt(uint256(-discriminant));
            int256 imaginaryPart = sqrtAbsDiscriminant / (2 * a);
            
            // Ensure imaginary part is positive
            if (a < 0) {
                imaginaryPart = -imaginaryPart;
            }
            
            result.root1.real = realPart;
            result.root1.imaginary = imaginaryPart;
            
            result.root2.real = realPart;
            result.root2.imaginary = -imaginaryPart;
        }
        
        return result;
    }
    
    // Helper function to calculate integer square root
    function intSqrt(uint256 x) internal pure returns (int256) {
        if (x == 0) return 0;
        
        // Initial estimate
        uint256 z = (x + 1) / 2;
        uint256 y = x;
        
        // Newton's method for square root approximation
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        
        return int256(y);
    }
    
    // Helper function to get the root type name
    function getRootTypeName(uint8 rootType) public pure returns (string memory) {
        if (rootType == TWO_REAL_ROOTS) return "Two Real Roots";
        if (rootType == ONE_REAL_ROOT) return "One Real Root";
        if (rootType == COMPLEX_ROOTS) return "Complex Roots";
        return "Unknown";
    }
}