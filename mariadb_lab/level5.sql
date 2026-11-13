CREATE TABLE IF NOT EXISTS courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

INSERT INTO courses (course_name, instructor) VALUES
('Серверне програмування', 'Рибак'),
('Менеджмент проектів', 'Шкатуляк'),
('ДевОпс', 'Бажан');

SELECT * FROM courses 
WHERE instructor = 'Рибак';

SELECT * FROM courses 
ORDER BY course_name ASC;
