// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
abstract contract ThreeDObject {
    function surfaceArea() public view virtual returns (uint);
    function volume() public view virtual returns (uint);
}
contract Box is ThreeDObject {
    uint length;
    uint width;
    uint height;
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
    uint side;
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
    uint radius;
    uint height;
    constructor(uint _radius, uint _height) {
        radius = _radius;
        height = _height;
    }
    function surfaceArea() public view override returns (uint) {
        return 2 * 314 * radius * (radius + height) / 100;
    }
    function volume() public view override returns (uint) {
        return 314 * radius * radius * height / 100;
    }
}
contract Cone is ThreeDObject {
    uint radius;
    uint height;
    uint slantHeight;
    constructor(uint _radius, uint _height, uint _slantHeight) {
        radius = _radius;
        height = _height;
        slantHeight = _slantHeight;
    }
    function surfaceArea() public view override returns (uint) {
        return (314 * radius * (radius + slantHeight)) / 100;
    }
    function volume() public view override returns (uint) {
        return (314 * radius * radius * height) / (3 * 100);
    }
}
contract MainContract {
    Cube public cube;
    Cylinder public cylinder;
    Cone public cone;
    constructor(uint _side, uint _radiusCyl, uint _heightCyl, uint _radiusCone, uint _heightCone, uint _slantHeightCone) {
        cube = new Cube(_side);
        cylinder = new Cylinder(_radiusCyl, _heightCyl);
        cone = new Cone(_radiusCone, _heightCone, _slantHeightCone);
    }
    function getSurfaceAreas() public view returns (uint, uint, uint) {
        return (cube.surfaceArea(), cylinder.surfaceArea(), cone.surfaceArea());
    }
    function getVolumes() public view returns (uint, uint, uint) {
        return (cube.volume(), cylinder.volume(), cone.volume());
    }
}