//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract ThreeDObject {
    function surfaceArea() public view virtual returns (uint);
    function volume() public view virtual returns (uint);
}

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

contract Cylinder is ThreeDObject {
    uint public radius;
    uint public height;
    uint constant PI = 3141592; // Scaled for integer math

    constructor(uint _radius, uint _height) {
        radius = _radius;
        height = _height;
    }

    function surfaceArea() public view override returns (uint) {
        return (2 * PI * radius * (radius + height)) / 1000000;
    }

    function volume() public view override returns (uint) {
        return (PI * radius * radius * height) / 1000000;
    }
}

contract Cone is ThreeDObject {
    uint public radius;
    uint public height;
    uint constant PI = 3141592;

    constructor(uint _radius, uint _height) {
        radius = _radius;
        height = _height;
    }

    function surfaceArea() public view override returns (uint) {
        uint slantHeight = (radius * radius + height * height) / 1000000; // Approximation
        return (PI * radius * (radius + slantHeight)) / 1000000;
    }

    function volume() public view override returns (uint) {
        return (PI * radius * radius * height) / (3 * 1000000);
    }
}

contract ShapeTester {
    function testShapes(
        uint cubeSide,
        uint cylRadius,
        uint cylHeight,
        uint coneRadius,
        uint coneHeight
    ) public returns (
        uint cubeSA, uint cubeVol,
        uint cylSA, uint cylVol,
        uint coneSA, uint coneVol
    ) {
        Cube cube = new Cube(cubeSide);
        Cylinder cylinder = new Cylinder(cylRadius, cylHeight);
        Cone cone = new Cone(coneRadius, coneHeight);

        cubeSA = cube.surfaceArea();
        cubeVol = cube.volume();
        cylSA = cylinder.surfaceArea();
        cylVol = cylinder.volume();
        coneSA = cone.surfaceArea();
        coneVol = cone.volume();
    }
}