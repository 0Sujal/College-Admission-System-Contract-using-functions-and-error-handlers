// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CollegeAdmission {
    enum StudentStatus { Applied, Accepted, Rejected }

    struct Student {
        string name;
        uint256 admissionScore;
        StudentStatus status;
    }

    Student[] public students;
    uint256 public constant MAX_CAPACITY = 4;

    function applyForAdmission(string memory _name, uint256 _admissionScore) public {
        require(bytes(_name).length > 0, "Student name must be provided.");
        require(_admissionScore > 400, "Admission score must be greater than 400.");

        assert(students.length < MAX_CAPACITY);

        Student memory newStudent;
        newStudent.name = _name;
        newStudent.admissionScore = _admissionScore;
        newStudent.status = StudentStatus.Applied;

        students.push(newStudent);
    }

    function acceptStudent(uint256 _studentIndex) public {
        require(_studentIndex < students.length, "Invalid student index.");

        Student storage student = students[_studentIndex];
        require(student.status == StudentStatus.Applied, "Student is not in the applied state.");

        student.status = StudentStatus.Accepted;
    }

    function rejectStudent(uint256 _studentIndex) public {
        require(_studentIndex < students.length, "Invalid student index.");

        Student storage student = students[_studentIndex];
        require(student.status == StudentStatus.Applied, "Student is not in the applied state.");

        student.status = StudentStatus.Rejected;
    }

    function getStudentStatus(uint256 _studentIndex) public view returns (string memory) {
        require(_studentIndex < students.length, "Invalid student index.");

        StudentStatus status = students[_studentIndex].status;
        if (status == StudentStatus.Applied) {
            return "Applied";
        } else if (status == StudentStatus.Accepted) {
            return "Accepted";
        } else if (status == StudentStatus.Rejected) {
            return "Rejected";
        }

        revert("Unknown student status.");
    }
}
