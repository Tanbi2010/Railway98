-- BÀI 4 20112025
DROP DATABASE IF EXISTS Student;
CREATE DATABASE Student;

DROP TABLE IF EXISTS Student;
CREATE TABLE `Student`(
     Id		                    TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	 Student_Name				VARCHAR(50) NOT NULL,
     Subject_Name		      	VARCHAR(50) NOT NULL,
     Point_Student				TINYINT
);

SELECT * FROM Student;

INSERT INTO Student (Student_Name, Subject_Name, Point_Student)
VALUES				('Name1',	'Sql', 		'7'),
					('Name2',	'Java', 	'8'),
                    ('Name3',	'Java', 	'9'),
                    ('Name4',	'Sql', 		'5'),
                    ('Name5',	'Java', 	'4'),
                    ('Name6',	'Spring', 	'5'),
                    ('Name7',	'Java', 	'8'),
                    ('Name8',	'Spring', 	'8'),
					('Name9',	'Sql', 		'5'),
                    ('Name10',	'Spring', 	'4'),
                    ('Name11',	'Sql', 		'5'),
                    ('Name12',	'Spring', 	'8'),
                    ('Name13',	'Sql', 		'8')
                    ;
                    
SELECT * FROM Student;
SELECT Subject_Name, max(Point_Student) Sping_Score FROM Student WHERE Subject_Name='Spring';


-- OPERATOR: GROUP BY 
-- LẤY TẬP DỮ LIỆU ĐIỂM CAO NHẤT CỦA MÔN SQL, JAVA VÀ SPRING/ ĐIỂM SỐ LỚN NHẤT THEO TỪNG MÔN HỌC
-- CÁCH 1: 
SELECT Subject_Name, max(Point_Student) Sping_Score FROM Student WHERE Subject_Name='Spring'
UNION ALL -- sự khác biệt giữa union và union all: union all lấy các dữ liệu dù có trùng nhau
SELECT Subject_Name, max(Point_Student) Sping_Score FROM Student WHERE Subject_Name='Sql'
UNION ALL
SELECT Subject_Name, max(Point_Student) Sping_Score FROM Student WHERE Subject_Name='Java';

-- CÁCH 2 SỬ DỤNG GROUP BY tên trường;
SELECT Subject_Name, max(Point_Student) AS MAX_POINT FROM Student GROUP BY Subject_Name;

-- ĐẾM SỐ LƯỢNG HỌC VIÊN MỖI MÔN HỌC 
SELECT Subject_Name, COUNT(Subject_Name) AS 'NUMBER OF STUDENT' FROM Student GROUP BY Subject_Name;

-- ĐẾM SỐ LƯỢNG HỌC VIÊN MỖI MÔN HỌC VÀ CHỈ HIỂN THỊ NHỮNG MÔN HỌC CÓ HỌC SINH >=4 HỌC VIÊN
-- CHỈ ĐIỀU KIỆN TRONG CÁC TẬP NHỎ CỦA GROUP BY (HAVING)
SELECT Subject_Name, COUNT(Subject_Name) AS 'NUMBER OF STUDENT' FROM Student 
GROUP BY Subject_Name 
HAVING  COUNT(Subject_Name) > 4
;

-- ORDER BY: SẮP XẾP THỨ TỰ
-- ASC: CHIỀU TĂNG DẦN (DEFAULT) A- Z
-- DESC: GIẢM DẦN  Z-A
SELECT * FROM Student ORDER BY Point_Student DESC;
SELECT * FROM Student ORDER BY Point_Student ASC;

-- LIMIT: GIỚI HẠN SỐ LƯỢNG
-- OFFSET + SỐ: BỎ (SỐ LƯỢNG) BẢN GHI ĐẦU TIÊN
SELECT * FROM Student LIMIT 5 OFFSET 5;
SELECT * FROM Student WHERE Id BETWEEN 6 AND 10;


-- CẬP NHẬT DỮ LIỆU: UPDATE
-- UPDATE TÊN BẢNG 
-- (THAY ĐỔI DỮ LIỆU) SET...=....ALTER
-- VỚI ĐIỀU KIỆN WHERE   ;

UPDATE Student SET Point_Student = 8 WHERE Id=5;

-- CẬP NHẬT ĐIỂM CỦA MÔN SQL= 8
UPDATE Student SET Point_Student = 8 WHERE Subject_Name= 'Sql';

-- XÓA DỮ LIỆU DELETE FROM ... WHERE
DELETE FROM Student WHERE Id=1;



