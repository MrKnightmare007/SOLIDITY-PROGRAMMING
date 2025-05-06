//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface College {
    function collegeDetails() external view returns(string memory, string memory);
}

contract Department {
    string public depthName;
    string public deptHead;

    constructor (string memory _deptName, string memory _deptHead) {
        depthName = _deptName;
        deptHead = _deptHead;
    }

    function departmentDetails() public view returns(string memory, string memory) {
        return (depthName, deptHead);
    }
}

contract Student is Department,College {
    string public studentName;
    uint public regNo;
    uint public marks;
    string public CollegeName;
    string public CollegeCode;

    constructor (string memory _studentName,uint _regNo, uint _marks, string memory _CollegeName, string memory _CollegeCode, string memory _deptName, string memory _deptHead) 
        Department(_deptName, _deptHead) {
            studentName = _studentName;
            regNo = _regNo;
            marks = _marks;
            CollegeName = _CollegeName;
            CollegeCode = _CollegeCode;
    }

    function collegeDetails() external override view returns(string memory, string memory) {
        return (CollegeName, CollegeCode);
    }
    
    function printReportCard() public view returns(string memory, string memory, string memory, uint, string memory, string memory, uint) {
        return (studentName, CollegeName, CollegeCode, regNo, depthName, deptHead,marks);
    }
}