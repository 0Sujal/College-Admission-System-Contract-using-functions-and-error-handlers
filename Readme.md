# College Admission Smart Contract

The CollegeAdmission smart contract enables the admission process for a college. It manages the application, acceptance, and rejection of students applying for admission.

## Student Status

Students in the system can have three possible statuses:
- Applied: The student has applied for admission.
- Accepted: The student has been accepted for admission.
- Rejected: The student's application has been rejected.

## Contract Functions

### applyForAdmission

solidity
function applyForAdmission(string memory _name, uint256 _admissionScore) public


This function allows a student to apply for admission. It requires the student's name and admission score to be provided. The student's application is added to the system if the conditions are met.

- `require(bytes(_name).length > 0, "Student name must be provided.")`: This `require()` statement ensures that the provided student name is not empty. If the condition evaluates to `false`, the transaction reverts with the given error message.

- `require(_admissionScore > 400, "Admission score must be greater than 400.")`: This `require()` statement checks if the student's admission score is greater than 400. If the condition evaluates to `false`, indicating a score below 400, the transaction reverts with the given error message.

- `assert(students.length < MAX_CAPACITY)`: This `assert()` statement checks if the number of students in the system is less than the maximum capacity defined by `MAX_CAPACITY`. If the condition evaluates to `false`, indicating that the capacity has been reached, the assertion fails, and the transaction reverts.

### acceptStudent

solidity
function acceptStudent(uint256 _studentIndex) public


This function allows the college to accept a student's application by specifying the index of the student in the system. It updates the student's status to "Accepted" if the conditions are met.

- `require(_studentIndex < students.length, "Invalid student index.")`: This `require()` statement checks if the provided student index is within the valid range. If the condition evaluates to `false`, indicating an invalid index, the transaction reverts with the given error message.

- `require(student.status == StudentStatus.Applied, "Student is not in the applied state.")`: This `require()` statement checks if the student's status is "Applied". If the condition evaluates to `false`, indicating the student is not in the applied state, the transaction reverts with the given error message.

### rejectStudent

solidity
function rejectStudent(uint256 _studentIndex) public


This function allows the college to reject a student's application by specifying the index of the student in the system. It updates the student's status to "Rejected" if the conditions are met.

- `require(_studentIndex < students.length, "Invalid student index.")`: This `require()` statement checks if the provided student index is within the valid range. If the condition evaluates to `false`, indicating an invalid index, the transaction reverts with the given error message.

- `require(student.status == StudentStatus.Applied, "Student is not in the applied state.")`: This `require()` statement checks if the student's status is "Applied". If the condition evaluates to `false`, indicating the student is not in the applied state, the transaction reverts with the given error message.

### getStudentStatus

solidity
function getStudentStatus(uint256 _studentIndex) public view returns (string memory)


This function retrieves the status of a student based on their index. It returns a string indicating whether the student is "Applied", "Accepted

", or "Rejected".

- `require(_studentIndex < students.length, "Invalid student index.")`: This `require()` statement checks if the provided student index is within the valid range. If the condition evaluates to `false`, indicating an invalid index, the function reverts with the given error message.

- `StudentStatus status = students[_studentIndex].status;`: This statement retrieves the status of the student at the specified index.

- The function then uses a series of conditional statements to determine the corresponding string representation of the student's status. If the status matches one of the known values, the corresponding string is returned. Otherwise, the function reverts with the error message "Unknown student status."

## Maximum Capacity

The smart contract defines a `MAX_CAPACITY` constant to limit the number of students that can be admitted. The value of `MAX_CAPACITY` is set to 4 in this contract. Once the maximum capacity is reached, further admissions will fail.

# Authors
Sujal Dua (https://github.com/0Sujal)

## License

The College Admission Smart Contract is licensed under the SPDX-License-Identifier: MIT.
