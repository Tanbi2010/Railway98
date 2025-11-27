DROP DATABASE IF EXISTS Testing_System_Assignment_44;
CREATE DATABASE Testing_System_Assignment_4;
USE Testing_System_Assignment_4;
-- create Table 1 Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName			NVARCHAR(150) UNIQUE KEY NOT NULL
);


-- create table 2 position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName			NVARCHAR(200)  NOT NULL
);

-- create table 3 account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
AccountID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email					VARCHAR(150) UNIQUE KEY NOT NULL,
Username  				NVARCHAR(50) UNIQUE KEY NOT NULL,
FullName  				NVARCHAR(150) NOT NULL,
DepartmentID 			TINYINT UNSIGNED NOT NULL,
PositionID				TINYINT UNSIGNED NOT NULL,
CreateDate				DATETIME DEFAULT NOW(),

FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
FOREIGN KEY (PositionID)	REFERENCES `Position`(PositionID) ON DELETE CASCADE
);

-- create Table 4 group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE  `Group` (
GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName				NVARCHAR(150) UNIQUE KEY NOT NULL,
CreatorID				TINYINT UNSIGNED NOT NULL,
CreateDate				DATETIME DEFAULT NOW(),

FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

-- create table 5 GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
GroupID 				TINYINT UNSIGNED NOT NULL,
AccountID				TINYINT UNSIGNED NOT NULL,
JoinDate				DATETIME DEFAULT NOW(),

PRIMARY KEY(GroupID,AccountID),
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID) ON DELETE CASCADE,
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

-- Create table 6 TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName				ENUM('Essay', 'Multiple-Choice') NOT NULL
);

-- create table 7 CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName			NVARCHAR(200) NOT NULL
);


-- create table 8 Question 
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
QuestionID				TINYINT UNSIGNED AUTO_INCREMENT,
Content					TEXT NOT NULL,
CategoryID				TINYINT UNSIGNED NOT NULL,
TypeID					TINYINT UNSIGNED NOT NULL,
CreatorID				TINYINT UNSIGNED NOT NULL,
CreateDate				DATETIME DEFAULT NOW(),

PRIMARY KEY (QuestionID,CategoryID,TypeID),
FOREIGN KEY (CategoryID)	REFERENCES CategoryQuestion(CategoryID) 	ON DELETE CASCADE,
FOREIGN KEY (TypeID) 		REFERENCES TypeQuestion(TypeID) 	ON DELETE CASCADE,
FOREIGN KEY (CreatorID) 	REFERENCES `Account`(AccountID) 	ON DELETE CASCADE
);

-- create table 9 Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID				TINYINT UNSIGNED AUTO_INCREMENT,
Content					TEXT NOT NULL,
QuestionID				TINYINT UNSIGNED NOT NULL,
isCorrect				BOOLEAN DEFAULT 1,

PRIMARY KEY (AnswerID,QuestionID),
FOREIGN KEY (QuestionID) 	REFERENCES Question(QuestionID)		ON DELETE CASCADE
);

-- create table 10 Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE  Exam (
ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code`					NVARCHAR(200) NOT NULL UNIQUE KEY,
Title 					NVARCHAR(200) NOT NULL,
CategoryID				TINYINT UNSIGNED NOT NULL,
Duration				TINYINT UNSIGNED NOT NULL,
CreatorID				TINYINT UNSIGNED NOT NULL,
CreateDate				DATETIME DEFAULT NOW(),

FOREIGN KEY (CategoryID)	REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
FOREIGN KEY (CreatorID)		REFERENCES `Account`(AccountID) 		ON DELETE CASCADE
);


-- create table 11  ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
ExamID					TINYINT UNSIGNED NOT NULL,
QuestionID				TINYINT UNSIGNED NOT NULL,

PRIMARY KEY(ExamID,QuestionID),
FOREIGN KEY (ExamID)		REFERENCES Exam(ExamID) 			ON DELETE CASCADE,
FOREIGN KEY (QuestionID)	REFERENCES Question(QuestionID) 	ON DELETE CASCADE
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

--  Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010


-- Question 3: Viết lệnh để lấy ra tất cả các developer  
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



-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên 


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question


-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

