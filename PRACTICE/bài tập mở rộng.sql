DROP DATABASE IF EXISTS VTI_Mark_Management;
CREATE DATABASE VTI_Mark_Management;
USE VTI_Mark_Management;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
TraineeID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
FirstName		NVARCHAR(50) NOT NULL,
LastName		NVARCHAR(50) NOT NULL,
Age				TINYINT UNSIGNED NOT NULL,
Gender			ENUM ('Male', 'Female', 'Unknown') NOT NULL
);


DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject` (
SubjectID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
SubjectName		NVARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS TraineeSubject;
CREATE TABLE TraineeSubject (
TraineeID				TINYINT UNSIGNED,
SubjectID				TINYINT UNSIGNED,
Mark					TINYINT UNSIGNED NOT NULL,
ExamDay					DATETIME,
PRIMARY KEY 			(TraineeID,SubjectID),

FOREIGN KEY 			(TraineeID)		REFERENCES Trainee (TraineeID)		ON DELETE CASCADE,
FOREIGN KEY 			(SubjectID)		REFERENCES `Subject` (SubjectID)	ON DELETE CASCADE
);

INSERT INTO Trainee 		(FirstName	,LastName,Age, Gender)
VALUES 

							(N'Anh', N'Nguyễn Văn', 24, 'Male'),
							(N'Mai', N'Trần Thị', 22, 'Female'),
                            (N'Huy', N'Lê Minh', 25, 'Male'),
                            (N'Thảo', N'Phạm Ngọc', 24, 'Female'),
                            (N'Long', N'Võ Hoàng', 27, 'Male'),
                            (N'Lan', N'Bùi Thu', 23, 'Female'),
                            (N'Tùng', N'Đinh Công', 26, 'Male'),
                            (N'Hạnh',N'Hoàng Thị', 21, 'Female'),
                            (N'Khoa', N'Ngô Đức', 29, 'Male'),
                            (N'Vy', N'Huỳnh Ngọc', 20, 'Female');

INSERT INTO 	`Subject`		(SubjectName)
VALUES 
								('MySQL'),
                                ('JavaCore'),
                                ('FrontEnd Basic'),
                                ('Spring Framwork'),
                                ('FrontEnd Advance'),
                                ('Mock Project'),
                                ('Other');

INSERT INTO 	TraineeSubject		(TraineeID,		SubjectID,		 Mark,		ExamDay	 )
VALUES 
									(1, 3, 85, '2025-01-12'),
									(2, 5, 92, '2025-01-15'),
									(3, 1, 78, '2025-01-18'),
									(4, 4, 88, '2025-01-20'),
									(5, 7, 91, '2025-01-22'),
									(6, 2, 73, '2025-01-25'),
									(7, 6, 95, '2025-01-28'),
									(8, 3, 82, '2025-02-01'),
									(9, 5, 89, '2025-02-05'),
									(10, 1, 76, '2025-02-10');


-- Lấy tất cả các môn học không có bất kì điểm nào
SELECT s.SubjectID, s.SubjectName FROM  `Subject` s
LEFT JOIN TraineeSubject ts ON s.SubjectID = ts.SubjectID
WHERE ts.SubjectID IS NULL
;

-- Lấy danh sách các môn học có ít nhất 2 điểm
SELECT s.SubjectID, s.SubjectName FROM TraineeSubject ts
JOIN `Subject` s ON s.SubjectID = ts.SubjectID
GROUP BY ts.SubjectID
HAVING count(ts.SubjectID) >= 2;

-- Tạo view có tên là " TraineeInfo" lấy các thông tin về học sinh bao gồm: 
-- Trainee_ID, FullName, Age, Gender, Subject_ID, Subject_Name, Mark, Exam_Day

SELECT * FROM Trainee;
SELECT * FROM `Subject`;
SELECT * FROM TraineeSubject;

DROP VIEW IF EXISTS TraineeInfo;
CREATE OR REPLACE VIEW TraineeInfo AS(
SELECT t.TraineeID, CONCAT(t.LastName, ' ', t.FirstName) AS Fullname, t.Age, t.Gender, s.SubjectID, s.SubjectName, ts.Mark, ts.ExamDay FROM Trainee t
JOIN TraineeSubject ts ON t.TraineeID= ts.TraineeID
JOIN `Subject` s ON s.SubjectID = ts.SubjectID
);
SELECT * FROM TraineeInfo;


