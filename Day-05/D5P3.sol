// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Base contract Shape
contract Shape {
    // Virtual functions to be overridden by sub-contracts
    function getPerimeter() public view virtual returns (uint256) {
        return 0; // Base perimeter is 0, to be overridden
    }

    function getArea() public view virtual returns (uint256) {
        return 0; // Base area is 0, to be overridden
    }
}

// Sub-contract Circle
contract Circle is Shape {
    uint256 public radius;
    uint256 constant PI = 3141592653; // π scaled by 10^9 (represents 3.141592653)
    uint256 constant SCALE = 1000000000; // 10^9, the scaling factor

    constructor(uint256 _radius) {
        radius = _radius;
    }

    // Override perimeter for Circle: 2 * π * radius
    function getPerimeter() public view override returns (uint256) {
        // (2 * PI * radius) / SCALE
        // We scale the numerator by 10^9 (via PI), so we divide by SCALE to adjust
        return (2 * PI * radius) / SCALE;
    }

    // Override area for Circle: π * radius^2
    function getArea() public view override returns (uint256) {
        // (PI * radius * radius) / SCALE
        // We scale the numerator by 10^9 (via PI), so we divide by SCALE to adjust
        return (PI * radius * radius) / SCALE;
    }
}

// Sub-contract Rectangle
contract Rectangle is Shape {
    uint256 public length;
    uint256 public width;

    constructor(uint256 _length, uint256 _width) {
        length = _length;
        width = _width;
    }

    // Override perimeter for Rectangle: 2 * (length + width)
    function getPerimeter() public view override returns (uint256) {
        return 2 * (length + width);
    }

    // Override area for Rectangle: length * width
    function getArea() public view override returns (uint256) {
        return length * width;
    }
}

// Sub-contract Triangle
contract Triangle is Shape {
    uint256 public side1;
    uint256 public side2;
    uint256 public side3;
    uint256 public base;
    uint256 public height;

    constructor(uint256 _side1, uint256 _side2, uint256 _side3, uint256 _base, uint256 _height) {
        side1 = _side1;
        side2 = _side2;
        side3 = _side3;
        base = _base;
        height = _height;
    }

    // Override perimeter for Triangle: side1 + side2 + side3
    function getPerimeter() public view override returns (uint256) {
        return side1 + side2 + side3;
    }

    // Override area for Triangle: 1/2 * base * height
    function getArea() public view override returns (uint256) {
        return (base * height) / 2;
    }
}