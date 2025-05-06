//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract StudentRecords {
    struct Student {
        uint roll;
        string name;
        uint marks_Physics;
        uint marks_Chemistry;
        uint marks_Maths;
        uint totalMarks;
    }

    Student[] public students;

    function addStudent(uint _roll , string memory _name, uint _phy, uint _chem, uint _maths) public {
        uint total_Marks = _phy + _chem + _maths;
        students.push(Student(_roll, _name, _phy, _chem, _maths, total_Marks));
    }

    function displayStudents() public view returns(Student[] memory) {
        Student[] memory sorted = students;
        for(uint i = 0; i < sorted.length; i++) {
            for(uint j = i + 1; j < sorted.length; j++) {
                if(sorted[i].totalMarks < sorted[j].totalMarks) {
                    (sorted[i], sorted[j]) = (sorted[j], sorted[i]);
                }
            }
        }
        return sorted;
    }
}