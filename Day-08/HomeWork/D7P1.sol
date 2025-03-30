// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement {
    // Define the Student structure
    struct Student {
        uint256 roll;
        string name;
        uint256 marksInPhysics;
        uint256 marksInChemistry;
        uint256 marksInMathematics;
        uint256 totalMarks;
    }
    
    // Array to store all students
    Student[] public students;
    
    // Mapping from roll number to student index in the array
    mapping(uint256 => bool) public rollExists;
    
    // Function to add a new student
    function addStudent(
        uint256 _roll,
        string memory _name,
        uint256 _marksInPhysics,
        uint256 _marksInChemistry,
        uint256 _marksInMathematics
    ) public {
        // Check if roll number already exists
        require(!rollExists[_roll], "Student with this roll number already exists");
        
        // Calculate total marks
        uint256 _totalMarks = _marksInPhysics + _marksInChemistry + _marksInMathematics;
        
        // Create a new student and add to the array
        students.push(Student({
            roll: _roll,
            name: _name,
            marksInPhysics: _marksInPhysics,
            marksInChemistry: _marksInChemistry,
            marksInMathematics: _marksInMathematics,
            totalMarks: _totalMarks
        }));
        
        // Mark roll number as used
        rollExists[_roll] = true;
    }
    
    // Function to get the number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }
    
    // Function to get a specific student by index
    function getStudent(uint256 index) public view returns (
        uint256 roll,
        string memory name,
        uint256 marksInPhysics,
        uint256 marksInChemistry,
        uint256 marksInMathematics,
        uint256 totalMarks
    ) {
        require(index < students.length, "Index out of bounds");
        Student memory student = students[index];
        return (
            student.roll,
            student.name,
            student.marksInPhysics,
            student.marksInChemistry,
            student.marksInMathematics,
            student.totalMarks
        );
    }
    
    // Function to sort students by total marks in descending order
    function sortStudentsByTotalMarks() public {
        uint256 n = students.length;
        
        // Using bubble sort for simplicity
        for (uint256 i = 0; i < n - 1; i++) {
            for (uint256 j = 0; j < n - i - 1; j++) {
                if (students[j].totalMarks < students[j + 1].totalMarks) {
                    // Swap students
                    Student memory temp = students[j];
                    students[j] = students[j + 1];
                    students[j + 1] = temp;
                }
            }
        }
    }
    
    // Function to get all students (after sorting)
    function getAllStudents() public view returns (Student[] memory) {
        return students;
    }
}