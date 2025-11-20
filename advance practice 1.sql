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


-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20
USE Fresher;
SELECT * FROM Trainee 
WHERE
(ET_IQ >= 12 AND ET_Gmath >=12 AND ET_English >=20)
ORDER BY Birth_Date DESC;


-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc bằng chữ C
SELECT * FROM Trainee WHERE (Full_Name LIKE 'N%c');

-- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G
SELECT * FROM Trainee WHERE (Full_Name LIKE '_g%');

-- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C
SELECT * FROM Trainee WHERE  length(Full_Name)  > 10 AND Full_Name LIKE '%c';

-- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau.
SELECT DISTINCT(Full_Name) FROM Trainee;

-- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này theo thứ tự từ A-Z
SELECT (Full_Name) FROM Trainee ORDER BY Full_Name;

-- Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
SELECT * FROM Trainee WHERE length(Full_Name)=(SELECT max(length(Full_Name)) FROM Trainee);

-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT TraineeID,Full_Name,Birth_Date FROM Trainee WHERE length(Full_Name)=(SELECT max(length(Full_Name)) FROM Trainee);

-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất
SELECT * FROM Trainee;
SELECT Full_Name,ET_IQ,ET_Gmath,ET_English FROM Trainee WHERE length(Full_Name)= (SELECT max(length(Full_Name)) FROM Trainee);

-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT * FROM Trainee WHERE Birth_Date = (SELECT MIN(Birth_Date) FROM Trainee);

-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người thỏa mãn số điểm như sau:
-- • ET_IQ + ET_Gmath>=20
-- • ET_IQ>=8
-- • ET_Gmath>=8
-- • ET_English>=18
SELECT * FROM Trainee WHERE ET_IQ >=20 AND ET_Gmath >=20;
SELECT * FROM Trainee WHERE ET_IQ >=8;
SELECT * FROM Trainee WHERE ET_Gmath >=8;
SELECT * FROM Trainee WHERE ET_English >=18;

-- Question 15: Xóa thực tập sinh có TraineeID = 5
DELETE FROM Trainee WHERE TraineeID = 5;

-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15
DELETE FROM Trainee WHERE ET_IQ <=15 AND ET_Gmath <=15;

-- Question 17: Xóa thực tập sinh quá 30 tuổi.
