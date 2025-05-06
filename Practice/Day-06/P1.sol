//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Employee {
    string public name;
    string public addr;
    uint public salary;
    string public jobTitle;

    constructor(string memory _name, string memory _addr, uint _salary, string memory _jobTitle) {
        name = _name;
        addr = _addr;
        salary = _salary;
        jobTitle = _jobTitle;
    }

    function calculateBonus() public virtual view returns(uint) {
        return salary/10;
    }

    function performanceReport() public virtual view returns(string memory) {
        return string(abi.encodePacked("Performace Report of :", name, ":Standard"));
    }
}

contract Manager is Employee {
    string[] public projects;

    constructor(string memory _name, string memory _addr, uint _salary, string memory _jobTitle)
        Employee(_name, _addr, _salary, _jobTitle) {}
    
    function calculateBonus() public override view returns(uint) {
        return salary/8;
    }

    function performanceReport() public override view returns(string memory) {
        return string(abi.encodePacked("Performance Report of : ", name, ": Good Leadership Skills"));
    }

    function addProjects(string memory project) public {
        projects.push(project);
    }
}

contract Developer is Employee {
    string public programmingLanguage;

    constructor(string memory _name, string memory _addr, uint _salary, string memory _jobTitle, string memory _programmingLanguage)
        Employee(_name, _addr, _salary, _jobTitle) {
        programmingLanguage = _programmingLanguage;
        }

    function calculateBonus() public override view returns(uint) {
        return salary/5;
    }

    function performanceReport() public override view returns(string memory) {
        return string(abi.encodePacked("Performance Report of : ", name, ": Good knowledge of Programming Language : ",programmingLanguage));
    }
}

contract Programmer is Employee {
    uint public linesOfCode;

    constructor(string memory _name, string memory _addr, uint _salary, string memory _jobTitle)
        Employee(_name, _addr, _salary, _jobTitle) {}
    
    function calculateBonus() public override view returns(uint) {
        return salary/2;
    }

    function performanceReport() public override view returns(string memory) {
        return string(abi.encodePacked("Performance Report of : ", name, ": Written lines of code : ",linesOfCode));
    }

    function setLinesOfCode(uint _linesOfCode) public {
        linesOfCode = _linesOfCode;
    } 
}