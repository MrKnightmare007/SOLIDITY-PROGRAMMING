//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Shape {
    function getPerimeter() public virtual view returns(uint) {
        return 0;
    }

    function getArea() public virtual view returns(uint) {
        return 0;
    }
}

contract Circle is Shape {
    uint public radius;
    constructor (uint _radius) {
        radius = _radius;
    }
    uint PI = 3141592;
    function getPerimeter() public override view returns(uint) {
        return (2 * radius * radius)/1000000;
    }

    function getArea() public override view returns(uint) {
        return (PI * radius * radius)/1000000;
    }
}

contract Rectangle is Shape {
    uint public length;
    uint public breadth;
    constructor (uint _length, uint _breadth) {
        length = _length;
        breadth = _breadth;
    }
    function getPerimeter() public override view returns(uint) {
        return 2 * (length + breadth);
    }

    function getArea() public override view returns(uint) {
        return length * breadth;
    }
}

contract Triangle is Shape {
    uint public side1;
    uint public side2;
    uint public side3;
    uint public height;
    uint public breadth;

    constructor (uint _side1, uint _side2, uint _side3, uint _height, uint _breadth) {
        side1 = _side1;
        side2 = _side2;
        side3 = _side3;
        height = _height;
        breadth = _breadth;
    }

    function getPerimeter() public override view returns(uint) {
        return side1 + side2 + side3;
    }

    function getArea() public override view returns(uint) {
        return (breadth * height)/2;
    }
}