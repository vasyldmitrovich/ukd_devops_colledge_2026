CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);


INSERT INTO students (name, age) VALUES ('Ivan', 20);
INSERT INTO students (name, age) VALUES ('Oksana', 123);
INSERT INTO students (name, age) VALUES ('Adrian', 18);
INSERT INTO students (name, age) VALUES ('Dima', 18);
INSERT INTO students (name, age) VALUES ('Vovp', 18);


UPDATE students
SET name = CONCAT('Senior', name)
WHERE age >= 18;


SELECT * FROM students;

SELECT name, age FROM students
WHERE age > 19;

DELETE FROM students
WHERE age = 18;
