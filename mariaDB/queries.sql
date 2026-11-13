-- Рівень 3 бали: Створення БД, таблиці та початкових записів
CREATE DATABASE IF NOT EXISTS students_db;
USE students_db;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

INSERT INTO students (name, age) VALUES ('Ivan', 20);
INSERT INTO students (name, age) VALUES ('Oksana', 19);
SELECT * FROM students;

-- Рівень 4 бали: Робота з даними (INSERT, SELECT, UPDATE, DELETE)
INSERT INTO students (name, age) VALUES 
('Andrii', 21),
('Mariia', 18),
('Taras', 22);

SELECT * FROM students;
SELECT * FROM students WHERE age > 19;
UPDATE students SET age = 20 WHERE name = 'Oksana';
DELETE FROM students WHERE id = 4;

-- Рівень 5 балів: Створення таблиці courses, фільтрація та сортування
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    teacher VARCHAR(50) NOT NULL
);

INSERT INTO courses (course_name, teacher) VALUES 
('Бази даних та SQL', 'Петренко О.В.'),
('Адміністрування Linux', 'Коваленко І.М.'),
('Комп’ютерні мережі', 'Сидоренко В.П.');

SELECT * FROM courses WHERE teacher = 'Петренко О.В.';
SELECT * FROM courses ORDER BY course_name ASC;

-- Додаткове завдання: Зв'язок таблиць (FOREIGN KEY) та JOIN
ALTER TABLE students
ADD COLUMN course_id INT,
ADD CONSTRAINT fk_student_course
FOREIGN KEY (course_id) REFERENCES courses(id)
ON DELETE SET NULL;

UPDATE students SET course_id = 1 WHERE id = 1;
UPDATE students SET course_id = 2 WHERE id = 2;
UPDATE students SET course_id = 1 WHERE id = 3;
UPDATE students SET course_id = 3 WHERE id = 5;

SELECT 
    students.id,
    students.name AS student_name,
    students.age,
    courses.course_name,
    courses.teacher
FROM students
INNER JOIN courses ON students.course_id = courses.id;
