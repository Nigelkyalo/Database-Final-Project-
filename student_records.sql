-- Create Database
CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;

-- Table: Students
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    enrollment_date DATE NOT NULL
);

-- Table: Courses
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    credits INT NOT NULL
);

-- Table: Instructors
CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50)
);

-- Table: Enrollments (Many-to-Many between Students and Courses)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade CHAR(2),
    CONSTRAINT fk_enrollment_student FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_enrollment_course FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    CONSTRAINT uc_student_course UNIQUE (student_id, course_id)
);

-- Table: CourseAssignments (One-to-Many: Instructors teach multiple courses)
CREATE TABLE CourseAssignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    CONSTRAINT fk_assignment_course FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
    CONSTRAINT fk_assignment_instructor FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id) ON DELETE CASCADE,
    CONSTRAINT uc_course_instructor UNIQUE (course_id, instructor_id, semester, year)
);

-- Table: StudentAddresses (One-to-One: Each student has one main address)
CREATE TABLE StudentAddresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL UNIQUE,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50) NOT NULL,
    CONSTRAINT fk_address_student FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- SAMPLE DATA
-- -----------------------------------------------------

-- Insert Students
INSERT INTO Students (first_name, last_name, dob, email, phone, enrollment_date) VALUES
('John', 'Doe', '2000-05-15', 'john.doe@email.com', '0712345678', '2023-09-01'),
('Mary', 'Smith', '2001-08-22', 'mary.smith@email.com', '0723456789', '2023-09-01'),
('David', 'Kamau', '1999-12-10', 'david.kamau@email.com', '0734567890', '2022-09-01');

-- Insert Courses
INSERT INTO Courses (course_name, course_code, credits) VALUES
('Database Systems', 'CS101', 3),
('Web Development', 'CS102', 4),
('Data Structures', 'CS103', 3);

-- Insert Instructors
INSERT INTO Instructors (first_name, last_name, email, department) VALUES
('Alice', 'Johnson', 'alice.johnson@email.com', 'Computer Science'),
('Peter', 'Otieno', 'peter.otieno@email.com', 'Software Engineering');

-- Insert CourseAssignments
INSERT INTO CourseAssignments (course_id, instructor_id, semester, year) VALUES
(1, 1, 'Fall', 2023),   -- Database Systems taught by Alice
(2, 2, 'Fall', 2023),   -- Web Development taught by Peter
(3, 1, 'Spring', 2024); -- Data Structures taught by Alice

-- Insert Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-09-01', 'A'),
(1, 2, '2023-09-01', 'B'),
(2, 1, '2023-09-01', 'B'),
(3, 3, '2022-09-01', 'A');

-- Insert StudentAddresses
INSERT INTO StudentAddresses (student_id, street, city, state, postal_code, country) VALUES
(1, '123 Main St', 'Nairobi', 'Nairobi County', '00100', 'Kenya'),
(2, '456 Park Rd', 'Nakuru', 'Nakuru County', '20100', 'Kenya'),
(3, '789 West St', 'Mombasa', 'Mombasa County', '80100', 'Kenya');
