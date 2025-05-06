//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Vehicle {
    string public make;
    string public model;
    uint public year;
    string public fuelType;

    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType) {
        make = _make;
        model = _model;
        year = _year;
        fuelType = _fuelType;        
    }

    function fuelEffieciency() public virtual pure returns(uint) {
        return 10;
    }

    function distanceTravelled(uint fuelUsed) public virtual pure returns(uint) {
        return fuelUsed * fuelEffieciency();
    }

    function maximumSpeed() public virtual pure returns(uint) {
        return 100;
    }
}

contract Truck is Vehicle {
    uint public noOfTyres;

    constructor(string memory _make, string memory _model, uint _year, uint _noOfTyres)
        Vehicle(_make, _model, _year, "Diesel") {
            noOfTyres = _noOfTyres;
        }
    
    function fuelEffieciency() public override pure returns(uint) {
        return 8;
    }

    function distanceTravelled(uint fuelUsed) public override pure returns(uint) {
        return fuelUsed * fuelEffieciency();
    }

    function maximumSpeed() public override pure returns(uint) {
        return 120;
    }

}

contract Car is Vehicle {
    uint public noOfTyres;

    constructor(string memory _make, string memory _model, uint _year, uint _noOfTyres)
        Vehicle(_make, _model, _year, "CNG") {
            noOfTyres = _noOfTyres;
        }
    
    function fuelEffieciency() public override pure returns(uint) {
        return 7;
    }

    function distanceTravelled(uint fuelUsed) public override pure returns(uint) {
        return fuelUsed * fuelEffieciency();
    }

    function maximumSpeed() public override pure returns(uint) {
        return 150;
    }

}

contract Motorcycle is Vehicle {
    uint public noOfTyres;

    constructor(string memory _make, string memory _model, uint _year, uint _noOfTyres)
        Vehicle(_make, _model, _year, "Petrol") {
            noOfTyres = _noOfTyres;
        }
    
    function fuelEffieciency() public override pure returns(uint) {
        return 6;
    }

    function distanceTravelled(uint fuelUsed) public override pure returns(uint) {
        return fuelUsed * fuelEffieciency();
    }

    function maximumSpeed() public override pure returns(uint) {
        return 90;
    }

}