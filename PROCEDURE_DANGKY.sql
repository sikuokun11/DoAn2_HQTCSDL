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
USE HOLYBIRD_DA2
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
