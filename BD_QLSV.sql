CREATE DATABASE QLSV
USE QLSV

CREATE TABLE CT_Daotao
(
MaCTDT varchar(10)NOT NULL,
TenCTDT nvarchar(50)
)



CREATE TABLE KhoaHoc
(
MaKH varchar(10)NOT NULL,
MaCTDT varchar(10)NOT NULL,
TenKH nvarchar(50)
)



CREATE TABLE Lophoc
(
MaLop varchar(10)NOT NULL,
MaKH varchar(10)NOT NULL,
TenLop nvarchar(50)
)


CREATE TABLE MonHoc
(
 MaMH varchar(10)NOT NULL,
 TenMH nvarchar(50)
 )


CREATE TABLE SinhVien
(
MaSV varchar(10)NOT NULL,
HoTen nvarchar(50)not null,
GioiTinh nvarchar(10)not null,
NgaySinh Datetime,
NoiSinh nvarchar(30)not null,
MaLop varchar(10)NOT NULL,
)


CREATE TABLE KetQuaThi
(
MaSV varchar(10)NOT NULL,
 MaMH varchar(10)NOT NULL,
 LanThi int not null,
 DiemThi float,
)
SELECT *
FROM CT_Daotao
SELECT *
FROM KhoaHoc
SELECT *
FROM Lophoc
 SELECT *
FROM MonHoc
  SELECT *
FROM SinhVien
  SELECT *
FROM KetQuaThi

--RB khoa chinh

ALTER TABLE CT_DaoTao ADD CONSTRAINT PK_CTDaoTao PRIMARY KEY(MaCTDT)
ALTER TABLE KhoaHoc ADD CONSTRAINT PK_KhoaHoc PRIMARY KEY(MaKH)
ALTER TABLE Lophoc ADD CONSTRAINT PK_LopHoc PRIMARY KEY(MaLop)
ALTER TABLE MonHoc ADD CONSTRAINT PK_MONHOC PRIMARY KEY(MaMH)
ALTER TABLE SinhVien ADD CONSTRAINT PK_SINHVIEN PRIMARY KEY(MaSV)
ALTER TABLE KetQuaThi ADD CONSTRAINT PK_KetQuaThi PRIMARY KEY(MaSV,MaMH,LanThi)

--kiem tra ran buoc khoa chinh
SP_PKEYS CT_DaoTao
SP_PKEYS KhoaHoc
SP_PKEYS LopHoc
SP_PKEYS MONHOC
SP_PKEYS SINHVIEN
SP_PKEYS KetQuaThi

--ran buoc khoa ngoai
ALTER TABLE KhoaHoc ADD CONSTRAINT FK_KH_MaCTDT FOREIGN KEY(MaCTDT) REFERENCES CT_DaoTao(MaCTDT)
ALTER TABLE Lophoc ADD CONSTRAINT FK_LopHoc_MaKH FOREIGN KEY(MaKH) REFERENCES KhoaHoc(MAKH)
ALTER TABLE SinhVien ADD CONSTRAINT FK_SinhVien_MaLop FOREIGN KEY(MaLop) REFERENCES Lophoc(MaLop)
ALTER TABLE KetQuaThi ADD CONSTRAINT FK_KetQuaThi_MaMH FOREIGN KEY(MaMH) REFERENCES MonHoc(MaMH)
ALTER TABLE KetQuaThi ADD CONSTRAINT FK_KetQuaThi_MaSV FOREIGN KEY(MaSV) REFERENCES SinhVien(MaSV)

-- xoa ran buoc 
--ALTER TABLE SinhVien DROP CONSTRAINT FK_SinhVien_MaSV;

--them du lieu vao bang CTDT

INSERT INTO CT_Daotao VALUES ('1',N'Cử Nhân')

INSERT INTO CT_Daotao VALUES ('2',N'Cao đẳng')

INSERT INTO CT_Daotao VALUES ('3',N'Trung Cấp')


-- xoa du lieu
DELETE FROM CT_Daotao WHERE MaCTDT ='3'

--them du lieu MONHOC
INSERT INTO MonHoc VALUES ('TH101',N'TIN Học Đại Cương')
INSERT INTO MonHoc VALUES ('TH110',N'TOÁN Rời  Rạc')
INSERT INTO MonHoc VALUES ('TH102',N'Cơ Sở Dử Liệu')
--KHOA HOC
INSERT INTO KhoaHoc VALUES ('1','1',N'KHÓA 1 Năm 2005')
INSERT INTO KhoaHoc VALUES ('2','1',N'KHÓA 2 Năm 2006')
INSERT INTO KhoaHoc VALUES ('3','2',N'KHÓA 1 Năm 2007')
INSERT INTO KhoaHoc VALUES ('4','3',N'KHÓA 1 Năm 2008')
INSERT INTO KhoaHoc VALUES ('5','2',N'KHÓA 2 Năm 2008')
-- LOP
INSERT INTO Lophoc VALUES ('1','1','K1_1')
INSERT INTO Lophoc VALUES ('2','1','K2_1')
INSERT INTO Lophoc VALUES ('3','1','K3_1')
INSERT INTO Lophoc VALUES ('4','2','K3_2')
--SINH VIÊN

INSERT INTO SinhVien VALUES ('K116',N'ĐINH NGUYỄN VÂN ANH',N'NỬ','1985-12-18',N'BÌNH THUẬN ','1')
INSERT INTO SinhVien VALUES ('K117',N'TRẦN HOÀNG ANH',N'NỬ','1986-8-4',N'BÌNH DƯƠNG ','1')
INSERT INTO SinhVien VALUES ('K118',N'BÙI THANH BÌNH',N'NAM','1985-10-23',N'ĐÒNG NAI ','1')
INSERT INTO SinhVien VALUES ('K119',N'PHẠM NHẬT TÂN',N'NAM','1985-1-15',N'ĐỒNG THÁP ','2')
INSERT INTO SinhVien VALUES ('K120',N'ĐINH THIỆN HÒA',N'NAM','1985-12-8',N'VĨNH LONG ','3')
INSERT INTO SinhVien VALUES ('K121',N'NGUYỄN ANH KHOA',N'NAM','1985-11-14',N'VŨNG TÀO ','3')
INSERT INTO SinhVien VALUES ('K122',N'TRƯƠNG MỘNG THUÝ',N'NỬ','1986-12-15',N'CẦN THƠ  ','2')
INSERT INTO SinhVien VALUES ('K123',N'VÕ ANH THI',N'NỬ','1986-5-23',N'BẾN TRE ','2')

DELETE SinhVien
DELETE KetQuaThi

--KET QUA THI

INSERT INTO KetQuaThi VALUES ('K116','TH101','1','8')
INSERT INTO KetQuaThi VALUES ('K117','TH101','1','4')
INSERT INTO KetQuaThi VALUES ('K118','TH101','1','6.5')
INSERT INTO KetQuaThi VALUES ('K119','TH102','1','5')
INSERT INTO KetQuaThi VALUES ('K120','TH102','1','7')
INSERT INTO KetQuaThi VALUES ('K116','TH110','1','7')
INSERT INTO KetQuaThi VALUES ('K118','TH102','1','9')
INSERT INTO KetQuaThi VALUES ('K119','TH101','1','6')


--them cot ghi chu

ALTER TABLE Sinhvien ADD ghichu nvarchar(50)

--them vao bang monhoc maMH va TENMH

INSERT INTO MonHoc VALUES ('TH112',N'Kiến Trúc Máy Tính')
-- sửa đổi bảng ,diem thi cua k116
UPDATE KetQuaThi SET  DiemThi = 7.5 WHERE MaSV = 'K116' AND MaMH = 'TH101';

--liệt kê masv và họ tên all sv
SELECT MaSv, Hoten FROM SinhVien 

--Liệt kê danh sách môn hc
SELECT TenMH FROM MonHoc 

--in ra danh sach sinh vien lop 'K1_1'

SELECT MaSV, HoTen FROM SinhVien S, Lophoc L 
WHERE S.MaLop = L.MaLop 
AND L.TenLop = 'K1_1'

--In ra danh sach sinh vien sinh năm 1985
SELECT MaSV, HoTen FROM SinhVien WHERE NgaySinh LIKE '%1985%'

--In ra danh sách sinh vien cử nhân
SELECT MaSV, HoTen FROM SinhVien WHERE MaSV IN (SELECT MaSV FROM CT_Daotao WHERE TenCTDT = N'Cử Nhân')

SELECT MaSV, HoTen 
FROM SinhVien S , KhoaHoc K, Lophoc L, CT_Daotao DT 
WHERE DT.MaCTDT = K.MaCTDT AND K.MaKH = L.MaKH 
AND L.MaLop = S.MaLop AND DT.TenCTDT = N'Cử Nhân'

--liet kê danh sach sinh vien có cung đIỂM MON TIN HOC ĐẠI CƯƠNG
SELECT  S.MaSV ,HoTen
FROM  MonHoc M, KetQuaThi K, SinhVien S 
WHERE M.MaMH = K.MaMH 
AND K.MaSV = S.MaSV
AND M.TenMH = N'TIN Học đại cương'
--10
SELECT  COUNT(MaSV) as SVLopK3_1
FROM SinhVien 
JOIN Lophoc ON SinhVien.MaLop = Lophoc.MaLop
WHERE TenLop = 'K3_1'
--11
SELECT TenLop, COUNT(MaSV) as Soluong_SV
FROM Lophoc L, SinhVien S
WHERE L.MaLop = S.MaLop
Group by L.MaLop , L.TenLop

--12
SELECT S.GioiTinh, COUNT(S.GioiTinh) As SL
FROM SinhVien S
Group by S.GioiTinh 
--13
SELECT S.NoiSinh ,COUNT(S.NoiSinh ) AS SL
FROM SinhVien S
Group by S.NoiSinh
--14	 
SELECT DT.TenCTDT, S.MaSV 
FROM CT_Daotao DT, SinhVien S , Lophoc L , KhoaHoc K
WHERE DT.MaCTDT = K.MaCTDT
AND K.MaKH = L.MaKH
and L.MaLop = S.MaLop
GROUP BY DT.TenCTDT, S.MaSV


--15
SELECT L.MaLop, TenLop ,COUNT(MaSV) AS SoLuong
FROM Lophoc L , SinhVien S
WHERE L.MaLop = S.MaLop
GROUP BY L.MaLop, TenLop
HAVING COUNT(MaSV) >= ALL(
						SELECT COUNT(MaSV) 
						FROM SinhVien
						GROUP BY MaSV			
)

--16
SELECT MaSV ,COUNT(DISTINCT MaMH) AS SoLuong
FROM KetQuaThi 
GROUP BY MaSV 
HAVING COUNT(DISTINCT MaMH) = (
								SELECT COUNT(MaMH)
								FROM MonHoc
)

--17
SELECT MaSV 
FROM SinhVien
WHERE MaSV NOT IN (
				SELECT MaSV
				from KetQuaThi
)

--18
UPDATE SinhVien SET ghichu = N'Hoãn học'
WHERE MaSV IN(
		SELECT MaSV 
		FROM SinhVien
		WHERE MaSV NOT IN (
				SELECT MaSV
				from KetQuaThi
				)	


)
	 	 
--19
INSERT INTO KetQuaThi VALUES ('K117','TH101','2','7')
INSERT INTO KetQuaThi VALUES ('K116','TH102','1','7.5')
INSERT INTO KetQuaThi VALUES ('K120','TH101','1','5')
INSERT INTO KetQuaThi VALUES ('K116','TH112','1','7')

SELECT S.MaSV, HoTen
FROM KetQuaThi K, SinhVien S
WHERE K.MaSV = S.MaSV 
AND LanThi >= '2'



SELECT *
FROM KetQuaThi