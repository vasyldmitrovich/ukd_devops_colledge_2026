CREATE TABLE IF NOT EXISTS student_courses (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO students (name, age) VALUES 
('Vova', 18), 
('Adrian', 18);

INSERT INTO student_courses (student_id, course_id) VALUES 
(1, 1), 
(1, 3), 
(2, 2);

SELECT students.name, courses.course_name, courses.instructor
FROM students
JOIN student_courses ON students.id = student_courses.student_id
JOIN courses ON student_courses.course_id = courses.id;
