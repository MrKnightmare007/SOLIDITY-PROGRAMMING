// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Department {
    function printDepartment() external view returns (string memory, string memory);
}

contract Hostel {
    string public hostelName;
    string public hostelLocation;
    uint public numberOfRooms;

    constructor(string memory _name, string memory _location, uint _rooms) {
        hostelName = _name;
        hostelLocation = _location;
        numberOfRooms = _rooms;
    }

    function getHostelData() public view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }
}

contract Student is Hostel, Department {
    string public studentName;
    uint public regdNo;
    string public electiveSubject;
    uint public avgMarks;
    string public deptName;
    string public deptHead;

    constructor(
        string memory _studentName,
        uint _regdNo,
        string memory _elective,
        uint _marks,
        string memory _hostelName,
        string memory _hostelLocation,
        uint _rooms,
        string memory _deptName,
        string memory _deptHead
    ) Hostel(_hostelName, _hostelLocation, _rooms) {
        studentName = _studentName;
        regdNo = _regdNo;
        electiveSubject = _elective;
        avgMarks = _marks;
        deptName = _deptName;
        deptHead = _deptHead;
    }

    function printDepartment() external view override returns (string memory, string memory) {
        return (deptName, deptHead);
    }

    function getStudentData() public view returns (string memory, uint, string memory, uint) {
        return (studentName, regdNo, electiveSubject, avgMarks);
    }
}

contract StudentManager {
    Student[] public students;

    function admitStudent(
        string memory _studentName,
        uint _regdNo,
        string memory _elective,
        uint _marks,
        string memory _hostelName,
        string memory _hostelLocation,
        uint _rooms,
        string memory _deptName,
        string memory _deptHead
    ) public {
        students.push(new Student(
            _studentName,
            _regdNo,
            _elective,
            _marks,
            _hostelName,
            _hostelLocation,
            _rooms,
            _deptName,
            _deptHead
        ));
    }

    function migrateStudent(uint _index, string memory _hostelName, string memory _hostelLocation, uint _rooms) public {
        Student student = students[_index];
        (,,, uint avgMarks) = student.getStudentData();
        (string memory studentName, uint regdNo, string memory elective,) = student.getStudentData();
        (string memory deptName, string memory deptHead) = student.printDepartment();
        students[_index] = new Student(
            studentName,
            regdNo,
            elective,
            avgMarks,
            _hostelName,
            _hostelLocation,
            _rooms,
            deptName,
            deptHead
        );
    }

    function displayStudent(uint _regdNo) public view returns (
        string memory studentName,
        uint regdNo,
        string memory elective,
        uint avgMarks,
        string memory hostelName,
        string memory hostelLocation,
        uint numberOfRooms,
        string memory deptName,
        string memory deptHead
    ) {
        for (uint i = 0; i < students.length; i++) {
            (, uint regNo,,) = students[i].getStudentData();
            if (regNo == _regdNo) {
                (studentName, regdNo, elective, avgMarks) = students[i].getStudentData();
                (hostelName, hostelLocation, numberOfRooms) = students[i].getHostelData();
                (deptName, deptHead) = students[i].printDepartment();
                return (
                    studentName,
                    regdNo,
                    elective,
                    avgMarks,
                    hostelName,
                    hostelLocation,
                    numberOfRooms,
                    deptName,
                    deptHead
                );
            }
        }
        revert("Student not found");
    }
}