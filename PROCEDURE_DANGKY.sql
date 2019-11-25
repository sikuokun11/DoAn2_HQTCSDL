-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
USE HOLYBIRD_DOAN2
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DangKy 
	-- Add the parameters for the stored procedure here
	@MaDoan VarChar(4),
	@TenDangNhap VarChar(15),
	@MatKhau VarChar(15)
AS
BEGIN
	INSERT INTO dbo.TAIKHOAN VALUES (@MaDoan,@TenDangNhap,@MatKhau,0)
END
GO
EXEC DangKy '001','TAITAN','1234'

GO
DROP PROCEDURE DATPHONG3
CREATE PROCEDURE DATPHONG3 
	@MaDoan VARCHAR(4),
	@Hang VARCHAR(45),
	@Tang INT,
	@HinhThuc VARCHAR(45),
	@SoPhong INT,
	@BatDau DATETIME,
	@KetThuc DATETIME
	
AS
BEGIN
	DECLARE listPhong CURSOR FOR SELECT P.MaPhong FROM PHONG P,CHITIETPHONG CTP WHERE P.MaPhong=CTP.MaPhong AND @Hang = CTP.Hang AND @HinhThuc = CTP.HinhThuc AND @Tang = CTP.Tang
	OPEN listPhong
	DECLARE @MaPhong VARCHAR(3)
	DECLARE @DEM INT
	SET @DEM = 0
	FETCH NEXT FROM listPhong INTO @MaPhong
		WHILE @@FETCH_STATUS =0 
		BEGIN
			SET @DEM = @DEM + 1 
			IF @DEM <=@SoPhong
			BEGIN
				DECLARE @TenPhong VARCHAR(45)
				SELECT @TenPhong=PHONG.TenPhong FROM PHONG
					WHERE PHONG.MaPhong = @MaPhong

				PRINT N'Phòng: '+@TenPhong +' STT  :' +CAST(@DEM AS VARCHAR)
				PRINT '-------------------------------------'
				


			END
			FETCH NEXT FROM listPhong INTO @maPhong
		END
	CLOSE listPhong
	DEALLOCATE listPhong
END
GO
--exec datphong
EXEC DATPHONG3 '001','Phong hang sang',1,'2 nguoi/phong',2,'2007-05-08','2007-05-09'

GO
--DROP PROCEDURE NHAPTHANHVIENDOAN
GO
-- KHI DA THUC HIEN XONG PROCEDURE DATCHO O TREN DO TRUONG PHONG LAM, MAN HINH CONSOLE HOAC MAN HINH WINFORM HIEN RA TEN PHONG VA MA PHONG
--NGUOI TRONG DOAN MUON DANG KY SE THUC HIEN CLICK VAO PHONG DO, LAY DUOC MA PHONG, DUA VAO FUNCTION
--DANG KY CHO TUNG NGUOI NAO MUON VAO PHONG NAO.
CREATE PROCEDURE NHAPGDTHANHVIENDOAN
(@MaGD VARCHAR(4), @MaDoan VARCHAR(45), @HoTen VARCHAR(45),@CMND VARCHAR(45),@TenPhong VARCHAR(45),@MaPhong VARCHAR(3))

AS

BEGIN

DECLARE @KIEMTRA VARCHAR(50)
DECLARE @CHECK INT

--KIEM TRA XEM THONG TIN KHACH HANG CO DUNG VOI CO SO DU LIEU K, TEN, CMND, MaDoan, TenPhong Hop Le
--NEU HOP LE, BIEN KIEM TRA = THANHCONG VA CHECK =1
--NEU CHECK = 1 thi tien hanh nap du lieu vao trong bang ChiTietGiaodich

SET @CHECK =1
IF(@CHECK =1)
	BEGIN
		DECLARE @MaKH VARCHAR(4)
		SELECT @MaKH = MaKH FROM THANHVIENDOAN WHERE @HoTen=HoTen AND @CMND=CMND AND @MaDoan = Doan
		DECLARE @DonGia INT
		SELECT @DonGia = GiaPhong FROM CHITIETPHONG WHERE @MaPhong = MaPhong


		--MA GIAO DICH LAY TU GIAO DICH CUA THANG TRUONG DOAN DA GIAO DICH TRUOC DO
		--CAN VIET FUNCTION TINH TONG TIEN DUA VAO NGAY BATDAU KET THUC VA DON GIA
		-- THE PHONG TU GENERA, GIO NHAP TRUOC NGAU NHIEN LA THE PHONG  'THE01'
 		INSERT INTO dbo.CHITIETGIAODICH VALUES (@MaGD,@MaDoan,@MaPhong,@MaKH,'2007-05-08','2007-05-09',@DonGia,1500000,'THE01')
		SET @KIEMTRA= 'THANH CONG, DA NHAP VAO CO SO DU LIEU'
		PRINT ' '+@KIEMTRA
	END

ELSE
	BEGIN
		PRINT ' DANG KY PHONG CHO BAN KHONG THANH CONG'
	END
END
GO


-- Truoc khi thuc hien can insert Giao dich , Tai Khoan kich hoat cua doan
EXEC NHAPGDTHANHVIENDOAN '001','001','Trinh Tan Tai','251136650','Thunder',4
GO

CREATE PROCEDURE TEST1 
	@T1 VARCHAR(15),
	@T2 VARCHAR(15)
AS 
BEGIN
	PRINT '' +@T1 +' AND ' +@T2 
	PRINT '-------------------'
END
GO
EXEC TEST1 'T', 'TT'
GO

CREATE PROCEDURE TEST2
	@T1 VARCHAR (15),
	@T2 VARCHAR (15)
AS
BEGIN
	EXEC TEST1 @T1,@T2 
END
GO

EXEC TEST2 'TTT','NKL'

