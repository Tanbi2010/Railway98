DROP DATABASE IF EXISTS Company_Management;
CREATE DATABASE Company_Management;
USE Company_Management;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
DepartmentID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName			NVARCHAR(200) NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
EmployeesID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
EmployeesName			NVARCHAR(200) NOT NULL,
DepartmentName			TINYINT UNSIGNED NOT NULL,

FOREIGN KEY (DepartmentName) REFERENCES Department(DepartmentID)
);

DROP TABLE IF EXISTS EmployeesSkill;
CREATE TABLE EmployeesSkill (
EmployeesID				TINYINT UNSIGNED NOT NULL PRIMARY KEY,
SkillCode				NVARCHAR(150) NOT NULL,
DateRegistered			DATETIME DEFAULT NOW(),

FOREIGN KEY (EmployeesID)	REFERENCES Employees(EmployeesID)
);

INSERT INTO  Department(DepartmentName)
VALUES
(N'Human Resource'),
(N'Tài Chính'),
(N'Quảng cáo'),
(N'Information Technology'),
(N'Kinh doanh');

INSERT INTO Employees 		(EmployeesName,DepartmentName)
VALUES
						(	N'Nguyễn Văn A',		1	),
                        (	N'Trần Thị B',			2	),
                        (	N'Lê Minh C',			3	),
                        (	N'Phạm Hồng D',			4	),
                        (	N'Nguyễn Thị E',		5	),
                        (	N'Lưu Đức F',			3	),
                        (	N'Hoàng Anh G',			1	),
                        (	N'Vũ Khánh H',			4	),
                        (	N'Trịnh Quốc I',		5	),
                        (	N'Phan Thùy J',			2	);

INSERT INTO EmployeesSkill (EmployeesID	,SkillCode,DateRegistered)
VALUES
						(	1 ,		N'Sql'	,		'2024-01-10'),
                        (	2 ,		N'Java'	,		'2024-02-05'),
                        (	3 ,		N'PHP'	,		'2024-03-12'),
                        (	4 ,		N'Sql'	,		'2024-04-21'),
                        (	5 ,		N'PHP'	,		'2024-05-09'),
                        (	6 ,		N'Java'	,		'2024-06-15'),
                        (	7 ,		N'PHP'	,		'2024-07-20'),
                        (	8 ,		N'Sql'	,		'2024-08-11'),
                        (	9 ,		N'Java'	,		'2024-09-18'),
                        (	10,		N'Sql'	,		'2024-10-25');


-- Question 3: query all employees (include name) who has Java skill (instruction: using UNION)
SELECT * FROM Employees a
INNER JOIN  EmployeesSkill b ON SkillCode= N'Java';
SELECT * FROM Employees;
SELECT * FROM EmployeesSkill;


