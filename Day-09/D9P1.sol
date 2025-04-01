// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Department Interface
interface Department {
    function setDeptName(string calldata _deptName) external;
    function setDeptHead(string calldata _deptHead) external;
    function printDeptDetails() external view returns (string memory, string memory);
}

// Hostel Contract
contract Hostel {
    string public hostelName;
    string public hostelLocation;
    uint public numberOfRooms;

    // Constructor to initialize the Hostel contract
    constructor(string memory _hostelName, string memory _hostelLocation, uint _numberOfRooms) {
        hostelName = _hostelName;
        hostelLocation = _hostelLocation;
        numberOfRooms = _numberOfRooms;
    }

    // Get methods
    function getHostelDetails() external view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }

    // Print Hostel details
    function printHostelDetails() external view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }
}

// Student Contract inheriting Hostel and implementing Department interface
contract Student is Hostel, Department {
    string public studentName;
    uint public regdNo;
    string public electiveSubject;
    uint public avgMarks;
    
    string public deptName;
    string public deptHead;

    // Constructor to initialize Student details
    constructor(
        string memory _hostelName, 
        string memory _hostelLocation, 
        uint _numberOfRooms,
        string memory _studentName,
        uint _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead
    ) Hostel(_hostelName, _hostelLocation, _numberOfRooms) {
        studentName = _studentName;
        regdNo = _regdNo;
        electiveSubject = _electiveSubject;
        avgMarks = _avgMarks;
        deptName = _deptName;
        deptHead = _deptHead;
    }

    // Implement abstract methods from Department interface
    function setDeptName(string calldata _deptName) external override {
        deptName = _deptName;
    }

    function setDeptHead(string calldata _deptHead) external override {
        deptHead = _deptHead;
    }

    function printDeptDetails() external view override returns (string memory, string memory) {
        return (deptName, deptHead);
    }

    // Get student data
    function getStudentData() external view returns (string memory, uint, string memory, uint) {
        return (studentName, regdNo, electiveSubject, avgMarks);
    }

    // Print student data
    function printStudentData() external view returns (string memory, uint, string memory, uint) {
        return (studentName, regdNo, electiveSubject, avgMarks);
    }

    // Method to migrate student (for simplicity, we will just change hostel details here)
    function migrateStudent(string memory newHostelName, string memory newHostelLocation, uint newNumberOfRooms) external {
        hostelName = newHostelName;
        hostelLocation = newHostelLocation;
        numberOfRooms = newNumberOfRooms;
    }
}

// Driver Contract to interact with the system
contract Driver {
    // Mapping to store student contract instances by registration number
    mapping(uint => address) public students;

    // Function to admit a new student
    function admitNewStudent(
        string memory _hostelName,
        string memory _hostelLocation,
        uint _numberOfRooms,
        string memory _studentName,
        uint _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead
    ) public {
        // Deploy a new Student contract
        Student newStudent = new Student(
            _hostelName,
            _hostelLocation,
            _numberOfRooms,
            _studentName,
            _regdNo,
            _electiveSubject,
            _avgMarks,
            _deptName,
            _deptHead
        );

        // Store the contract address in the mapping
        students[_regdNo] = address(newStudent);
    }

    // Function to migrate a student
    function migrateStudent(uint regdNo, string memory newHostelName, string memory newHostelLocation, uint newNumberOfRooms) public {
        Student student = Student(students[regdNo]);
        student.migrateStudent(newHostelName, newHostelLocation, newNumberOfRooms);
    }

    // Function to display student details based on registration number
    function displayStudentDetails(uint regdNo) public view returns (string memory, uint, string memory, uint, string memory, string memory) {
        Student student = Student(students[regdNo]);

        (
            string memory studentName, 
            uint studentRegdNo, 
            string memory electiveSubject, 
            uint avgMarks
        ) = student.getStudentData();
        
        (
            string memory deptName, 
            string memory deptHead
        ) = student.printDeptDetails();
        
        return (studentName, studentRegdNo, electiveSubject, avgMarks, deptName, deptHead);
    }
}
