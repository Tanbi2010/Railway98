DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
-- create Table 1 Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName NVARCHAR(150) UNIQUE KEY NOT NULL
);


-- create table 2 position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
    PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName NVARCHAR(200) NOT NULL
);

-- create table 3 account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(150) UNIQUE KEY NOT NULL,
    Username NVARCHAR(50) UNIQUE KEY NOT NULL,
    FullName NVARCHAR(150) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID)
        ON DELETE CASCADE,
    FOREIGN KEY (PositionID)
        REFERENCES `Position` (PositionID)
        ON DELETE CASCADE
);

-- create Table 4 group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName NVARCHAR(150) UNIQUE KEY NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountID)
        ON DELETE CASCADE
);

-- create table 5 GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupID TINYINT UNSIGNED NOT NULL,
    AccountID TINYINT UNSIGNED NOT NULL,
    JoinDate DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID , AccountID),
    FOREIGN KEY (GroupID)
        REFERENCES `Group` (GroupID)
        ON DELETE CASCADE,
    FOREIGN KEY (AccountID)
        REFERENCES `Account` (AccountID)
        ON DELETE CASCADE
);

-- Create table 6 TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay', 'Multiple-Choice') NOT NULL
);

-- create table 7 CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName NVARCHAR(200) NOT NULL
);


-- create table 8 Question 
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID TINYINT UNSIGNED AUTO_INCREMENT,
    Content TEXT NOT NULL,
    CategoryID TINYINT UNSIGNED NOT NULL,
    TypeID TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    PRIMARY KEY (QuestionID , CategoryID , TypeID),
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID)
        ON DELETE CASCADE,
    FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion (TypeID)
        ON DELETE CASCADE,
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountID)
        ON DELETE CASCADE
);

-- create table 9 Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID TINYINT UNSIGNED AUTO_INCREMENT,
    Content TEXT NOT NULL,
    QuestionID TINYINT UNSIGNED NOT NULL,
    isCorrect BOOLEAN DEFAULT 1,
    PRIMARY KEY (AnswerID , QuestionID),
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
        ON DELETE CASCADE
);

-- create table 10 Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` NVARCHAR(200) NOT NULL UNIQUE KEY,
    Title NVARCHAR(200) NOT NULL,
    CategoryID TINYINT UNSIGNED NOT NULL,
    Duration TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID)
        ON DELETE CASCADE,
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountID)
        ON DELETE CASCADE
);


-- create table 11  ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID TINYINT UNSIGNED NOT NULL,
    QuestionID TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (ExamID , QuestionID),
    FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID)
        ON DELETE CASCADE,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
        ON DELETE CASCADE
);


-- input data
-- input data và Department

INSERT INTO Department(DepartmentName)
VALUES
						
  						(N'Sale'		),                      
						(N'Bảo Vệ'		),
 						(N'Nhân sự'		),
                        (N'Kỹ thuật'	),
                        (N'Tài chính'	),
                        (N'Phó giám đốc'),
                        (N'Giám đốc'	),
                        (N'Thư kí'		),
                        (N'Bán hàng'	),
                        (N'Marketing'	)
                        ;
-- insert data position
INSERT INTO `Position`(PositionName)
VALUES
						('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			);

-- insert data Account
INSERT INTO `Account`(			Email	, 				Username , 			FullName , 					DepartmentID , 	PositionID, 	CreateDate)
VALUES
						('Email1@gmail.com'				, 'Username1'		,'Fullname1'				,   '5'			,   '1'		,'2020-03-05'),
						('Email2@gmail.com'				, 'Username2'		,'Fullname2'				,   '1'			,   '2'		,'2020-03-05'),
						('Email3@gmail.com'				, 'Username3'		,'Fullname3'				,   '2'			,   '2'		,'2020-03-07'),
						('Email4@gmail.com'				, 'Username4'		,'Fullname4'				,   '3'			,   '4'		,'2020-03-08'),
						('Email5@gmail.com'				, 'Username5'		,'Fullname5'				,   '4'			,   '4'		,'2020-03-10'),
						('Email6@gmail.com'				, 'Username6'		,'Fullname6'				,   '6'			,   '3'		,'2020-04-05'),
						('Email7@gmail.com'				, 'Username7'		,'Fullname7'				,   '2'			,   '2'		, NULL		),
						('Email8@gmail.com'				, 'Username8'		,'Fullname8'				,   '8'			,   '1'		,'2020-04-07'),
						('Email9@gmail.com'				, 'Username9'		,'Fullname9'				,   '2'			,   '2'		,'2020-04-07'),
						('Email10@gmail.com'			, 'Username10'		,'Fullname10'				,   '10'		,   '1'		,'2020-04-09');
	
-- insert data group
INSERT INTO `Group`(  	GroupName			, CreatorID		, 	CreateDate)
VALUES
						(N'Testing System'		,   5			,'2019-03-05'),
						(N'Development'			,   1			,'2020-03-07'),
						(N'VTI Sale 01'			,   2			,'2020-03-09'),
						(N'VTI Sale 02'			,   3			,'2020-03-10'),
						(N'VTI Sale 03'			,   4			,'2020-03-28'),
						(N'VTI Creator'			,   6			,'2020-04-06'),
						(N'VTI Marketing 01'	,   7			,'2020-04-07'),
						(N'Management'			,   8			,'2020-04-08'),
						(N'Chat with love'		,   9			,'2020-04-09'),
						(N'Vi Ti Ai'			,   10			,'2020-04-10');

-- insert data groupaccount
INSERT INTO `GroupAccount`(GroupID	, AccountID	, JoinDate	 )
VALUES
						(	1		,    1		,'2019-03-05'),
						(	1		,    2		,'2020-03-07'),
						(	3		,    3		,'2020-03-09'),
						(	3		,    4		,'2020-03-10'),
						(	5		,    5		,'2020-03-28'),
						(	1		,    3		,'2020-04-06'),
						(	1		,    7		,'2020-04-07'),
						(	8		,    3		,'2020-04-08'),
						(	1		,    9		,'2020-04-09'),
						(	10		,    10		,'2020-04-10');

-- insert data TypeQuestion
INSERT INTO TypeQuestion(TypeName)
VALUES
						('Essay'			), 
						('Multiple-Choice'	);
                        
-- insert data CategoryQuestion

INSERT INTO CategoryQuestion(CategoryName)
VALUES
					('Java'			),
					('ASP.NET'		),
					('ADO.NET'		),
					('SQL'			),
					('Postman'		),
					('Ruby'			),
					('Python'		),
					('C++'			),
					('C Sharp'		),
					('PHP'			);
SELECT * FROM CategoryQuestion;
-- insert data Question
INSERT INTO Question(Content, 			CategoryID, 	TypeID, 	CreatorID, 		CreateDate )
VALUES
					(N'Câu hỏi về Java'	,	1		,   '1'			,   '2'		,'2020-04-05'),
					(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
					(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
					(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
					(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
					(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
					(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
					(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
					(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
					(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- insert data Answers
INSERT INTO   Answer(Content		, QuestionID	, isCorrect	)
VALUES
					(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);

-- insert data Exam
INSERT INTO Exam(	`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES
					('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');

-- insert data ExamQuestion
INSERT INTO ExamQuestion (ExamID	, QuestionID	)
VALUES
					(	1	,		5		),
					(	2	,		10		), 
					(	3	,		4		), 
					(	4	,		3		), 
					(	5	,		7		), 
					(	6	,		10		), 
					(	7	,		2		), 
					(	8	,		10		), 
					(	9	,		9		), 
					(	10	,		8		); 
                    
-- luyện tập ngày 19/11/2025 (sử dụng hàm SELECT * FROM...)

-- QUESTION 2: LẤY RA TẤT CẢ CÁC PHÒNG BAN


-- QUESTION 3: LẤY RA ID CỦA PHÒNG BAN 'SALE'
SELECT DepartmentID FROM Department WHERE DepartmentName="Sale";

-- QUESTION 4: lấy ra thông tin account có full name dài nhất
-- SELECT * FROM `Account` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account`);
SELECT * FROM `Account` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account`);

-- QUESTION 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT * FROM `Account` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account`) AND DepartmentID=3 ; 

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 
SELECT * FROM `Group` WHERE CreateDate < '2019/12/20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT * FROM	Question WHERE CreatorID >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 
SELECT `Code` FROM Exam WHERE Duration > 60 AND CreateDate < '2019/12/20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất


-- Question 10: Đếm số nhân viên thuộc department có id = 2 
SELECT count(Username) FROM `Account` WHERE DepartmentID=2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
SELECT * FROM `Account` WHERE 'D%o';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM Exam WHERE CreateDate < '2019/12/20'; 

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 
DELETE FROM Question 
WHERE
    Content LIKE 'Câu hỏi%'； 
-- Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và  email thành loc.nguyenba@vti.com.vn
-- SELECT * FROM `Account`;
UPDATE  `Account` 
SET FullName = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID=5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4 
UPDATE GroupAccount 
SET GroupID=4
WHERE AccountID=5;

SELECT * FROM GroupAccount;

-- TRONG SUBQUERY/ CÂU LỆNH HƠI RƯỜM RÀ TRONG CÂU LỆNH CHANGE
-- CÓ THỂ TÁCH SUBQUERY THÌ CÓ THỂ TẠO RA CÁI BẢNG CTE (BẢNG TẠM) 

WITH cte_MaxlengthFullname AS( 
SELECT MAX(LENGtH(FullName)) m FROM `Account`)

SELECT * FROM `Account`
WHERE length(FullName) = (SELECT m FROM cte_MaxlengthFullname);



WITH maxlenghtFN AS (SELECT max(length(FullName)) Max_FullName FROM `Account`)
SELECT * FROM `Account`
WHERE length(FullName)= (SELECT Max_FullName FROM maxlenghtFN);


-- 22/11/2025 TESTING_SYSTEM ASSIGNMENT 4
-- Exercise 1: Join 
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT * FROM `Account` a
INNER JOIN 
Department d ON a.departmentID= d.departmentID;
SELECT * FROM `Account`;
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010

-- WITH CTE_right_require AS (
-- SELECT CreateDate FROM `Account` GROUP BY CreateDate > 20/12/2010
-- )
SELECT * FROM `Account` a WHERE CreateDate > 20/12/2010;

SELECT * FROM Department;
SELECT * FROM Position;
SELECT * FROM `Account`;
SELECT * FROM `Group`;
SELECT * FROM `GroupAccount`;
SELECT * FROM TypeQuestion;
SELECT * FROM CategoryQuestion;
SELECT * FROM Question;
SELECT * FROM Answer;
SELECT * FROM Exam;
SELECT * FROM ExamQuestion;
-- cách 1
WITH cte AS (
SELECT * FROM `Account` WHERE CreateDate > 20/12/2010)

SELECT * FROM cte a
 JOIN Department d ON a.departmentID= d.departmentID 
 JOIN position p ON a.positionID= p.positionID;
 
 -- cách 2
 SELECT * FROM `Account` a 
 JOIN department d ON a.departmentID = d.departmentID
 JOIN position p ON a.positionID = p.positionID
 WHERE CreateDate > 2010-12-20;
 
 SELECT * FROM position;

-- Question 3: Viết lệnh để lấy ra tất cả các developer 

SELECT * FROM `GroupAccount`ga
JOIN `Group` g ON ga.groupID=g.groupID
JOIN `Account` a ON a.AccountID= ga.AccountID
WHERE ga.groupID=2;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên 

SELECT a.departmentID, d.departmentName, count(*) FROM `Account`  a
INNER JOIN department d ON a.departmentID= d.departmentID
GROUP BY departmentID HAVING count(*) >=3;

SELECT a.*, d.DepartmentName, count(*) FROM `Account`  a
INNER JOIN department d ON a.departmentID= d.departmentID
GROUP BY a.departmentID HAVING count(*) >=3;

SELECT d.*, count(*) FROM `Account`  a -- lấy thông tin từ bảng department
INNER JOIN department d ON a.departmentID= d.departmentID
GROUP BY departmentID HAVING count(*) >=3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
WITH cte_question AS (
SELECT QuestionID, count(*) sl FROM ExamQuestion 
GROUP BY QuestionID
)

SELECT ex.QuestionID, q.Content,  count(*) FROM ExamQuestion ex 
INNER JOIN Question q ON ex.QuestionID = q.QuestionID
GROUP BY ex.QuestionID 
HAVING count(*)= (SELECT max(sl) FROM cte_question);

-- 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT  qt.categoryID, cq.CategoryName, count(*) sl FROM Question qt
INNER JOIN CategoryQuestion cq ON qt.categoryID =cq.categoryID
GROUP BY qt.CategoryID;

USE `testing_system_assignment_1`;
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam 

SELECT eq.QuestionID, count(eq.QuestionID) FROM ExamQuestion eq
LEFT JOIN Exam e ON eq.examID=e.examID
GROUP BY eq.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất 
SELECT * FROM Department;
SELECT * FROM Position;
SELECT * FROM `Account`;
SELECT * FROM `Group`;
SELECT * FROM `GroupAccount`;
SELECT * FROM TypeQuestion;
SELECT * FROM CategoryQuestion;
SELECT * FROM Question;
SELECT * FROM Answer;
SELECT * FROM Exam;
SELECT * FROM ExamQuestion;

-- Question 9: Thống kê số lượng account trong mỗi group  
SELECT ga.GroupID, count(ga.AccountID), g.GroupName  FROM `GroupAccount` ga
JOIN `Group` g ON ga.GroupID=g.GroupID
GROUP BY ga.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất 
WITH cte_min_number AS (
SELECT PositionID, count(PositionID) mn FROM `Account`
GROUP BY PositionID
)
SELECT p.PositionID, p.PositionName , count(a.PositionID) 'amount' FROM `Account` a
JOIN Position p ON a.PositionID=p.PositionID
GROUP BY a.PositionID
HAVING count(a.PositionID)= (SELECT min(mn) FROM  cte_min_number);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM 
SELECT a.DepartmentID, d.DepartmentName, p.PositionName, count(a.PositionID) amount FROM `Account` a 
JOIN Position p ON a.PositionID=p.PositionID
JOIN Department d ON d.DepartmentID=a.DepartmentID
GROUP BY a.DepartmentID, p.PositionID; -- why we need to group by two fields

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … 
SELECT q.QuestionID,q.Content,tq.TypeName,cq.CategoryName, a.FullName,an.AnswerID FROM Question q
JOIN TypeQuestion tq ON q.TypeID=tq.TypeID
JOIN CategoryQuestion cq ON cq.CategoryID=q.CategoryID
JOIN `Account` a ON q.CreatorID=a.AccountID
JOIN Answer an ON an.QuestionID=q.QuestionID;

-- - Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … 

SELECT * FROM Department;
SELECT * FROM Position;
SELECT * FROM `Account`;
SELECT * FROM `Group`;
SELECT * FROM `GroupAccount`;
SELECT * FROM TypeQuestion;
SELECT * FROM CategoryQuestion;
SELECT * FROM Question;
SELECT * FROM Answer;
SELECT * FROM Exam;
SELECT * FROM ExamQuestion;

SELECT q.Content, q.CreateDate,cq.CategoryName, a.FullName, an.Content FROM Question q
JOIN CategoryQuestion cq ON cq.CategoryID=q.CategoryID
JOIN TypeQuestion tq ON tq.TypeID=q.TypeID
JOIN `Account` a ON q.CreatorID=a.AccountID
JOIN Answer an ON an.QuestionID=q.QuestionID;

-- 25/11/2025 tìm hiểu về view trong mysql
-- CREATE OR REPLACE VIEW name_view vw_AccountList AS
-- câu lệnh tạo ra dữ liệu mà mình lấy và muốn lưu trữ;

CREATE OR REPLACE VIEW vw_min_number_department AS
WITH cte_min_number AS (
SELECT PositionID, count(PositionID) mn FROM `Account`
GROUP BY PositionID
)
SELECT p.PositionID, p.PositionName , count(a.PositionID) 'amount' FROM `Account` a
JOIN Position p ON a.PositionID=p.PositionID
GROUP BY a.PositionID
HAVING count(a.PositionID)= (SELECT min(mn) FROM  cte_min_number);

-- muốn xóa bảng view giả này thì sử dụng câu lệnh drop bình thường: DROP VIEW view_name;
-- muốn lấy dữ liệu từ view giả: SELECT * FROM VIEW;
-- ƯU ĐIỂM
-- => hạn chế truy cập vào những bảng dữ liệu chính
-- tạo ra view muốn lấy hoặc xem các thông tin cơ bản mà có thể cung cấp, thì tạo ra các bảng view
-- và có thể cung cấp cho admin khác để họ xem mà ko phải tương tác nhiều đến cơ sở dữ liệu, bảo mật và đảm bảo an toàn cho dữ liệu

-- NHƯỢC ĐIỂM
-- tốn thêm tài nguyên lưu trữ 
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale 
CREATE OR REPLACE VIEW vw_SaleAccountList AS
SELECT a.*, d.departmentName FROM  `Account` a
JOIN Department d ON a.DepartmentID=d.DepartmentID
WHERE a.DepartmentID=1;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất 
-- CREATE OR REPLACE VIEW vw_group_max_mem AS 
-- WITH cte_maxAccount AS(
-- SELECT count(*) ma FROM `GroupAccount`
-- GROUP BY GroupID
-- )
-- SELECT a.*,ga.GroupID, count(*) FROM `Account` a
-- JOIN `GroupAccount` ga ON ga.AccountID=a.AccountID
-- GROUP BY GroupID
-- HAVING count(*) = (SELECT max(ma) FROM cte_maxAccount); => GROUP BY THEO GROUP ID, NHƯNG KO THEO YÊU CẦU ĐỀ BÀI

CREATE OR REPLACE VIEW vw_group_max_mem AS 
WITH cte_maxAccount AS(
SELECT count(*) ma FROM `GroupAccount`
GROUP BY AccountID
)
SELECT a.*,ga.GroupID, count(*) amount FROM `GroupAccount` ga
JOIN `Account` a ON ga.AccountID=a.AccountID
GROUP BY AccountID
HAVING count(*) = (SELECT max(ma) FROM cte_maxAccount);

-- stored procedure (sp)
-- tạo 1 sp lấy danh sách account

-- ## CẤU TRÚC ĐỂ TẠO 1 STORED PROCEDURE
DROP PROCEDURE IF EXISTS sp_getListAccount; 

DELIMITER $$
CREATE PROCEDURE sp_getListAccount()
BEGIN
	SELECT * FROM `Account`; -- CÂU LỆNH MUỐN THỰC HIỆN
END$$
DELIMITER ;
-- ##
-- SAU KHI TẠO PROCEDURE, NẾU MUỐN GỌI DỮ LIỆU ĐỂ DÙNG THÌ DÙNG CÂU LỆNH CALL
CALL sp_getListAccount;

-- NẾU MUỐN XÓA PROCEDURE ĐÃ TẠO

-- TẠO DANH SÁCH LẤY ACCOUNT CÓ ID = 2

## CẤU TRÚC ĐỂ TẠO 1 STORED PROCEDURE MÀ CÓ THAM SỐ THAY ĐỔI (như lấy account có account ID= 2,3,4...

-- DROP PROCEDURE IF EXISTS sp_getListAccount (IN fieldname có tham số thay đổi DATATYPE ; (NẾU MUỐN XÓA 

-- DELIMITER $$
-- CREATE PROCEDURE sp_getListAccount()
-- BEGIN
-- 	SELECT * FROM `Account` WHERE điều kiện = tên fieldname lựa chọn phía trên; -- CÂU LỆNH MUỐN THỰC HIỆN
-- END$$
-- DELIMITER ;
-- ##

DROP PROCEDURE IF EXISTS sp_getListAccount_1; -- (NẾU MUỐN XÓA )

DELIMITER $$
CREATE PROCEDURE sp_getListAccount_1(IN in_AccountID TINYINT)
BEGIN
	SELECT * FROM `Account`WHERE AccountID=in_AccountID; -- CÂU LỆNH MUỐN THỰC HIỆN
END$$
DELIMITER ;

CALL sp_getListAccount_1 (3);
CALL sp_getListAccount_1 (5);

DROP PROCEDURE IF EXISTS sp_insertListAccount; 

DELIMITER $$
CREATE PROCEDURE sp_insertListAccount(
IN p_email VARCHAR(150),
IN p_Username NVARCHAR(150),
IN p_FullName NVARCHAR(200),
IN p_DepartmentID TINYINT,
IN p_PositionID TINYINT
)
BEGIN
	INSERT INTO `Account` (Email,Username,FullName,DepartmentID,PositionID)
    VALUES (p_Email, p_Username, p_FullName, p_DepartmentID, p_PositionID);
    
END$$
DELIMITER ;

CALL sp_insertListAccount (
'vanlam123@mail.com', 
'Vanlam',
'Nguyễn Văn Lâm',
2,
1);
-- nếu muốn inser thêm thì chỉnh sửa thông tin tiếp tục tại câu call ở trên mà không cần phải viết lại

-- xóa tài khoảng người dùng theo ID

DROP PROCEDURE IF EXISTS sp_DeletListAccount; 

DELIMITER $$
CREATE PROCEDURE sp_DeletListAccount(
IN in_accountID TINYINT UNSIGNED
)
BEGIN
DELETE FROM `Account` WHERE AccountID = in_accountID;
    
END$$
DELIMITER ;

CALL sp_DeletListAccount (11);

-- tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

SELECT * FROM Department;
SELECT * FROM Position;
SELECT * FROM `Account`;
SELECT * FROM `Group`;
SELECT * FROM `GroupAccount`;
SELECT * FROM TypeQuestion;
SELECT * FROM CategoryQuestion;
SELECT * FROM Question;
SELECT * FROM Answer;
SELECT * FROM Exam;
SELECT * FROM ExamQuestion;


use `testing_system_assignment_1`; 

DELIMITER $$
CREATE PROCEDURE sp_insertListAccount(
IN p_email VARCHAR(150),
IN p_Username NVARCHAR(150),
IN p_FullName NVARCHAR(200),
IN p_DepartmentID TINYINT,
IN p_PositionID TINYINT
)
BEGIN
	INSERT INTO `Account` (Email,Username,FullName,DepartmentID,PositionID)
    VALUES (p_Email, p_Username, p_FullName, p_DepartmentID, p_PositionID);
    
END$$
DELIMITER ;
DROP PROCEDURE IF EXISTS sp_ListDepartment; 

DELIMITER $$
CREATE PROCEDURE sp_ListDepartment(
IN in_DepartmentName NVARCHAR(200)
)
BEGIN
SELECT * FROM Department p
JOIN `Account` a ON a.DepartmentID=p.DepartmentID
WHERE p.DepartmentName= in_DepartmentName;
    
END$$
DELIMITER ;

CALL sp_ListDepartment('Kỹ thuật');



