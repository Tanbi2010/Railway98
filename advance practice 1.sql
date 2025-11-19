-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu

DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE Fresher;
USE Fresher;

CREATE TABLE Trainee (
TraineeID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Full_Name				NVARCHAR(200) NOT NULL,
Birth_Date				DATE NOT NULL,
Gender					ENUM('Male', 'Female', 'Unknown') NOT NULL,
ET_IQ					TINYINT UNSIGNED CHECK (ET_IQ BETWEEN 0 AND 20) NOT NULL,
ET_Gmath				TINYINT UNSIGNED CHECK (ET_Gmath BETWEEN 0 AND 20) NOT NULL,
ET_English				TINYINT UNSIGNED CHECK (ET_English BETWEEN 0 AND 50) NOT NULL,
Training_Class			NVARCHAR(150) NOT NULL,
Evaluation_Notes		NVARCHAR(150) NOT NULL
);

-- Question 2: Thêm ít nhất 10 bản ghi vào table
INSERT INTO Trainee ( 		Full_Name, 			Birth_Date, 			Gender, ET_IQ, 	ET_Gmath, 	ET_English, Training_Class, Evaluation_Notes)
VALUES

						(N'Nguyễn Văn An',		'2001-03-12',			'Male',		5,		18,			30,		'VT001',	'DHBKHN'),
						(N'Trần Thị Minh',		'2000-11-05',			'Female',	8,		12,			25,		'VT002',	'DHNL'),
						(N'Lê Hoàng Phúc',		'1999-07-29',			'Male',		11,		7,			45,		'VT003',	'DHKTKT'),
						(N'Phạm Ngọc Hân',		'2002-01-15',			'Female',	19,		9,			29,		'VT004',	'DHKHXHNV'),
						(N'Võ Minh Khôi',		'2001-09-09',			'Male',		15,		17,			41,		'VT005',	'DHKT'),
						(N'Đào Thu Trang',		'1998-12-21',			'Female',	10,		18,			15,		'VT006',	'DHKT'),
						(N'Hồ Gia Bảo',			'2000-05-03',			'Male',		12,		19,			38,		'VT007',	'DHDL'),
						(N'Nguyễn Thanh Tâm',	'2002-06-18',			'Unknown',	18,		11,			22,		'VT008',	'DHSG'),
						(N'Mai Bảo Trân',		'1999-04-26',			'Female',	13,		15,			11,		'VT009',	'DHDN'),
						(N'Phan Nhật Quang',	'2001-02-01',			'Male',		17,		10,			49,		'VT0010',	'DHTTH');
                        
SELECT * FROM Trainee;

-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả.
INSERT INTO Trainee ( 		Full_Name, 			Birth_Date, 				Gender, 	ET_IQ, 	ET_Gmath, 	ET_English, Training_Class, Evaluation_Notes)
VALUES
						(N'Phan Nhật Vượng',	'1994-02-11',			'Unknown',		30,		16,			36,		'VT0011',	'DHDTDN');
                        
