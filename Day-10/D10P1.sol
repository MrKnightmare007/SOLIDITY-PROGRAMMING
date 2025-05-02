// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Interface for Department
interface Department {
    function printDepartmentDetails() external view returns (string memory, string memory);
}

// Contract for Hostel
contract Hostel {
    string public hostelName;
    string public hostelLocation;
    uint public numberOfRooms;
    
    constructor(string memory _hostelName, string memory _hostelLocation, uint _numberOfRooms) {
        hostelName = _hostelName;
        hostelLocation = _hostelLocation;
        numberOfRooms = _numberOfRooms;
    }
    
    function getHostelDetails() public view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }
    
    function printHostelDetails() public view returns (string memory) {
        return string(abi.encodePacked(
            "Hostel Name: ", hostelName,
            ", Location: ", hostelLocation,
            ", Number of Rooms: ", uint2str(numberOfRooms)
        ));
    }
    
    // Setter functions to update hostel details
    function setHostelName(string memory _newHostelName) public {
        hostelName = _newHostelName;
    }
    
    function setHostelLocation(string memory _newHostelLocation) public {
        hostelLocation = _newHostelLocation;
    }
    
    function setNumberOfRooms(uint _newNumberOfRooms) public {
        numberOfRooms = _newNumberOfRooms;
    }
    
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

// Student contract inheriting Hostel and implementing Department
contract Student is Hostel, Department {
    string public studentName;
    string public regdNo;
    string public electiveSubject;
    uint public avgMarks;
    string public deptName;
    string public deptHead;
    
    constructor(
        string memory _studentName,
        string memory _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead,
        string memory _hostelName,
        string memory _hostelLocation,
        uint _numberOfRooms
    ) Hostel(_hostelName, _hostelLocation, _numberOfRooms) {
        studentName = _studentName;
        regdNo = _regdNo;
        electiveSubject = _electiveSubject;
        avgMarks = _avgMarks;
        deptName = _deptName;
        deptHead = _deptHead;
    }
    
    function getData() public view returns (
        string memory, string memory, string memory, uint,
        string memory, string memory, string memory, string memory, uint
    ) {
        return (
            studentName, regdNo, electiveSubject, avgMarks,
            deptName, deptHead, hostelName, hostelLocation, numberOfRooms
        );
    }
    
    function printData() public view returns (string memory) {
        return string(abi.encodePacked(
            "Student Name: ", studentName,
            ", Registration No: ", regdNo,
            ", Elective Subject: ", electiveSubject,
            ", Average Marks: ", uint2str(avgMarks),
            ", Department: ", deptName,
            ", Department Head: ", deptHead,
            ", ", printHostelDetails()
        ));
    }
    
    function printDepartmentDetails() public view override returns (string memory, string memory) {
        return (deptName, deptHead);
    }
}

// Driver contract to manage students
contract StudentManagement {
    mapping(string => address) private students;
    uint public studentCount;
    
    event StudentAdmitted(string regdNo, address studentAddress);
    event StudentMigrated(string regdNo, string newHostelName, string newHostelLocation);
    
    function admitNewStudent(
        string memory _studentName,
        string memory _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead,
        string memory _hostelName,
        string memory _hostelLocation,
        uint _numberOfRooms
    ) public returns (address) {
        require(students[_regdNo] == address(0), "Student with this registration number already exists");
        
        Student newStudent = new Student(
            _studentName, _regdNo, _electiveSubject, _avgMarks,
            _deptName, _deptHead, _hostelName, _hostelLocation, _numberOfRooms
        );
        
        students[_regdNo] = address(newStudent);
        studentCount++;
        
        emit StudentAdmitted(_regdNo, address(newStudent));
        return address(newStudent);
    }
    
    function migrateStudent(
        string memory _regdNo,
        string memory _newHostelName,
        string memory _newHostelLocation,
        uint _newNumberOfRooms
    ) public {
        require(students[_regdNo] != address(0), "Student not found");
        
        Student student = Student(students[_regdNo]);
        // Use setter functions to update hostel details
        student.setHostelName(_newHostelName);
        student.setHostelLocation(_newHostelLocation);
        student.setNumberOfRooms(_newNumberOfRooms);
        
        emit StudentMigrated(_regdNo, _newHostelName, _newHostelLocation);
    }
    
    function displayStudentDetails(string memory _regdNo) public view returns (string memory) {
        require(students[_regdNo] != address(0), "Student not found");
        
        Student student = Student(students[_regdNo]);
        return student.printData();
    }
    
    function getStudentAddress(string memory _regdNo) public view returns (address) {
        require(students[_regdNo] != address(0), "Student not found");
        return students[_regdNo];
    }
}