# 🎓 Student Records Database (MySQL)

This project implements a **relational database system** for managing student records.  
It is designed in **MySQL** and demonstrates the use of primary keys, foreign keys, constraints, and different relationship types (One-to-One, One-to-Many, Many-to-Many).

---

## 📂 Project Files
- `student_records.sql` → Ready-to-run SQL script containing database schema and sample data.
- `README.md` → Documentation for setup and usage.

---

## 📌 Features
- **Students** table with personal details and enrollment info.
- **Courses** table with unique course codes and credit values.
- **Instructors** table storing faculty details.
- **Enrollments** table modeling **Many-to-Many** relationship between Students and Courses.
- **CourseAssignments** table modeling **One-to-Many** relationship between Instructors and Courses.
- **StudentAddresses** table modeling a **One-to-One** relationship with Students.

---

## 🛠️ Setup Instructions
1. Open **MySQL Workbench** or **phpMyAdmin**.
2. Create a new connection to your MySQL server.
3. Run the provided SQL script:
   ```sql
   SOURCE path/to/student_records.sql;
