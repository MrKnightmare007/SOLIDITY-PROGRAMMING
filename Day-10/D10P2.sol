// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Interface for College
interface College {
    function display() external view returns (string memory, string memory);
}

// Contract for Department
contract Department {
    string public deptName;
    string public deptHead;
    
    // Function to accept department details
    function setDepartmentDetails(string memory _deptName, string memory _deptHead) public {
        deptName = _deptName;
        deptHead = _deptHead;
    }
    
    // Function to display department details
    function getDepartmentDetails() public view returns (string memory, string memory) {
        return (deptName, deptHead);
    }
}

// Student contract inheriting Department and implementing College
contract Student is Department, College {
    string public collegeName;
    string public collegeCode;
    string public studentName;
    string public regNo;
    uint public marks;
    
    // Constructor to initialize all details
    constructor(
        string memory _collegeName,
        string memory _collegeCode,
        string memory _deptName,
        string memory _deptHead,
        string memory _studentName,
        string memory _regNo,
        uint _marks
    ) {
        collegeName = _collegeName;
        collegeCode = _collegeCode;
        setDepartmentDetails(_deptName, _deptHead);
        studentName = _studentName;
        regNo = _regNo;
        marks = _marks;
    }
    
    // Implementation of display function from College interface
    function display() public view override returns (string memory, string memory) {
        return (collegeName, collegeCode);
    }
    
    // Function to print the report card
    function printReportCard() public view returns (string memory) {
        (string memory deptN, string memory deptH) = getDepartmentDetails();
        return string(abi.encodePacked(
            "Student Report Card\n",
            "College Name: ", collegeName, "\n",
            "College Code: ", collegeCode, "\n",
            "Department Name: ", deptN, "\n",
            "Department Head: ", deptH, "\n",
            "Student Name: ", studentName, "\n",
            "Registration Number: ", regNo, "\n",
            "Marks: ", uint2str(marks)
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

// Main contract to test Student contract
contract CollegeManagement {
    Student public student;
    
    function createStudent(
        string memory _collegeName,
        string memory _collegeCode,
        string memory _deptName,
        string memory _deptHead,
        string memory _studentName,
        string memory _regNo,
        uint _marks
    ) public {
        student = new Student(
            _collegeName, _collegeCode, _deptName, _deptHead,
            _studentName, _regNo, _marks
        );
    }
    
    function getReportCard() public view returns (string memory) {
        return student.printReportCard();
    }
}