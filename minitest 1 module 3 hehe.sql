-- Tạo cơ sở dữ liệu
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- Tạo bảng Address
CREATE TABLE Address (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL
);

-- Tạo bảng Classes
CREATE TABLE Classes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    language VARCHAR(50),
    description TEXT
);

-- Tạo bảng Students
CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    address_id INT,
    age INT,
    phone VARCHAR(15) UNIQUE,
    classes_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(id),
    FOREIGN KEY (classes_id) REFERENCES Classes(id)
);

-- Tạo bảng Course
CREATE TABLE Course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Tạo bảng Point
CREATE TABLE Point (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    student_id INT,
    point FLOAT,
    FOREIGN KEY (course_id) REFERENCES Course(id),
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

-- Thêm dữ liệu vào bảng Address
INSERT INTO Address (address) VALUES
('Hà Nội'), ('TP Hồ Chí Minh'), ('Đà Nẵng'), ('Cần Thơ'), ('Hải Phòng');

-- Thêm dữ liệu vào bảng Classes
INSERT INTO Classes (name, language, description) VALUES
('Lập trình Java', 'Java', 'Lớp học lập trình Java cơ bản'),
('Lập trình Python', 'Python', 'Lớp học lập trình Python nâng cao'),
('Tiếng Anh giao tiếp', 'English', 'Khóa học tiếng Anh giao tiếp'),
('Thiết kế đồ họa', 'Design', 'Khóa học thiết kế đồ họa cơ bản'),
('Phát triển Web', 'HTML/CSS/JS', 'Khóa học lập trình Web cơ bản');

-- Thêm dữ liệu vào bảng Students
INSERT INTO Students (fullname, address_id, age, phone, classes_id) VALUES
('Nguyen Van A', 1, 20, '0123456789', 1),
('Nguyen Thi B', 2, 19, '0123456790', 2),
('Tran Van C', 3, 18, '0123456791', 3),
('Le Thi D', 4, 22, '0123456792', 4),
('Nguyen Van E', 5, 21, '0123456793', 5),
('Pham Van F', 1, 23, '0123456794', 1),
('Hoang Thi G', 2, 20, '0123456795', 2),
('Nguyen Anh H', 3, 19, '0123456796', 3),
('Tran Thi I', 4, 17, '0123456797', 4),
('Nguyen Minh J', 5, 18, '0123456798', 5);

-- Thêm dữ liệu vào bảng Course
INSERT INTO Course (name, description) VALUES
('Java Basics', 'Khóa học Java cơ bản'),
('Python Advanced', 'Khóa học Python nâng cao'),
('English Speaking', 'Khóa học tiếng Anh giao tiếp'),
('Graphic Design', 'Khóa học thiết kế đồ họa'),
('Web Development', 'Khóa học lập trình Web cơ bản');

-- Thêm dữ liệu vào bảng Point
INSERT INTO Point (course_id, student_id, point) VALUES
(1, 1, 8.5), (1, 2, 9.0), (1, 3, 7.5),
(2, 4, 8.0), (2, 5, 7.8), (2, 6, 8.9),
(3, 7, 9.0), (3, 8, 8.7), (3, 9, 8.3),
(4, 10, 9.5), (4, 1, 8.2), (4, 2, 8.8),
(5, 3, 7.9), (5, 4, 8.4), (5, 5, 9.0);

-- 1. Tìm kiếm học viên
-- Học viên có họ "Nguyen"
SELECT * FROM Students WHERE fullname LIKE 'Nguyen%';

-- Học viên có tên "Anh"
SELECT * FROM Students WHERE fullname LIKE '% Anh %';

-- Học viên có độ tuổi từ 15 đến 18
SELECT * FROM Students WHERE age BETWEEN 15 AND 18;

-- Học viên có id là 12 hoặc 13
SELECT * FROM Students WHERE id IN (12, 13);

-- 2. Thống kê
-- Thống kê số lượng học viên theo lớp
SELECT c.name AS ClassName, COUNT(s.id) AS StudentCount
FROM Classes c
LEFT JOIN Students s ON c.id = s.classes_id
GROUP BY c.name;

-- Thống kê số lượng học viên theo địa chỉ
SELECT a.address AS Address, COUNT(s.id) AS StudentCount
FROM Address a
LEFT JOIN Students s ON a.id = s.address_id
GROUP BY a.address;

-- Tính điểm trung bình của các khóa học
SELECT c.name AS CourseName, AVG(p.point) AS AveragePoint
FROM Course c
JOIN Point p ON c.id = p.course_id
GROUP BY c.name;

-- Khóa học có điểm trung bình cao nhất
SELECT c.name AS CourseName, AVG(p.point) AS MaxAveragePoint
FROM Course cpoint_ibfk_1
JOIN Point p ON c.id = p.course_id
GROUP BY c.name
ORDER BY MaxAveragePoint DESC
LIMIT 1;




