// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Abstract contract for ThreeDObject
abstract contract ThreeDObject {
    function surfaceArea() public virtual view returns (uint);
    function volume() public virtual view returns (uint);
}

// Contract for Box
contract Box is ThreeDObject {
    uint public length;
    uint public width;
    uint public height;
    
    constructor(uint _length, uint _width, uint _height) {
        length = _length;
        width = _width;
        height = _height;
    }
    
    function surfaceArea() public view override returns (uint) {
        return 2 * (length * width + width * height + height * length);
    }
    
    function volume() public view override returns (uint) {
        return length * width * height;
    }
}

// Contract for Cube
contract Cube is ThreeDObject {
    uint public side;
    
    constructor(uint _side) {
        side = _side;
    }
    
    function surfaceArea() public view override returns (uint) {
        return 6 * side * side;
    }
    
    function volume() public view override returns (uint) {
        return side * side * side;
    }
}

// Contract for Cylinder
contract Cylinder is ThreeDObject {
    uint public radius;
    uint public height;
    uint constant PI = 314; // Approximate PI * 100 for integer math
    
    constructor(uint _radius, uint _height) {
        radius = _radius;
        height = _height;
    }
    
    function surfaceArea() public view override returns (uint) {
        return (2 * PI * radius * height + 2 * PI * radius * radius) / 100;
    }
    
    function volume() public view override returns (uint) {
        return (PI * radius * radius * height) / 100;
    }
}

// Contract for Cone
contract Cone is ThreeDObject {
    uint public radius;
    uint public height;
    uint constant PI = 314; // Approximate PI * 100 for integer math
    
    constructor(uint _radius, uint _height) {
        radius = _radius;
        height = _height;
    }
    
    function surfaceArea() public view override returns (uint) {
        // Approximate slant height using Pythagorean theorem: sqrt(r^2 + h^2)
        uint slantHeightSquared = radius * radius + height * height;
        uint slantHeight = sqrt(slantHeightSquared); // Simplified approximation
        return (PI * radius * (radius + slantHeight)) / 100;
    }
    
    function volume() public view override returns (uint) {
        return (PI * radius * radius * height) / 300; // Divide by 3 for cone
    }
    
    // Simplified square root function for approximation
    function sqrt(uint x) internal pure returns (uint) {
        if (x == 0) return 0;
        uint z = (x + 1) / 2;
        uint y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }
}

// Main contract to test shapes
contract ShapeCalculator {
    Cube public cube;
    Cylinder public cylinder;
    Cone public cone;
    
    constructor(uint cubeSide, uint cylinderRadius, uint cylinderHeight, uint coneRadius, uint coneHeight) {
        cube = new Cube(cubeSide);
        cylinder = new Cylinder(cylinderRadius, cylinderHeight);
        cone = new Cone(coneRadius, coneHeight);
    }
    
    function getShapeDetails() public view returns (string memory) {
        return string(abi.encodePacked(
            "Cube: Surface Area = ", uint2str(cube.surfaceArea()), ", Volume = ", uint2str(cube.volume()), "\n",
            "Cylinder: Surface Area = ", uint2str(cylinder.surfaceArea()), ", Volume = ", uint2str(cylinder.volume()), "\n",
            "Cone: Surface Area = ", uint2str(cone.surfaceArea()), ", Volume = ", uint2str(cone.volume())
        ));
    }
    
    // Utility function to convert uint to string
    function uint2str(uint _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bstr[k] = bytes1(temp);
            _i /= 10;
        }
        return string(bstr);
    }
}