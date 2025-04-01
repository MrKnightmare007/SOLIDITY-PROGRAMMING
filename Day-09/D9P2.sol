// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface College {
    function getCollegeName() external view returns (string memory);
    function getCollegeCode() external view returns (uint);
}
contract Department {
    string public deptName;
    string public DeptHead;
    function setDepartmentDetails(string memory _deptName, string memory _DeptHead) public {
        deptName = _deptName;
        DeptHead = _DeptHead;
    }
    function displayDepartmentDetails() public view returns (string memory, string memory) {
        return (deptName, DeptHead);
    }
}
contract Student is Department, College {
    string public studentName;
    uint public regNo;
    uint public Marks;
    string private collegeName;
    uint private collegeCode;
    constructor(
        string memory _collegeName, 
        uint _collegeCode, 
        string memory _deptName, 
        string memory _DeptHead, 
        string memory _studentName, 
        uint _regNo, 
        uint _Marks
    ) {
        collegeName = _collegeName;
        collegeCode = _collegeCode;
        setDepartmentDetails(_deptName, _DeptHead);
        studentName = _studentName;
        regNo = _regNo;
        Marks = _Marks;
    }
    function getCollegeName() external view override returns (string memory) {
        return collegeName;
    }
    function getCollegeCode() external view override returns (uint) {
        return collegeCode;
    }
    function displayStudentReportCard() public view returns (
        string memory, uint, string memory, string memory, uint, uint, string memory
    ) {
        return (
            studentName, 
            regNo, 
            deptName, 
            DeptHead, 
            Marks, 
            collegeCode,
            collegeName
        );
    }
}