CREATE DATABASE VNTravel
USE  VNTravel


/*----------------Bảng Account-------------*/
	drop table [Account]
	CREATE TABLE [Account](
	[id] INT IDENTITY(1,1) Primary key,
	[email] [varchar](255) UNIQUE  NOT NULL,
	[username] [Nvarchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role] [int] NOT NULL,
    [address] [NVARCHAR](max),
    [phoneNumber] [varchar](20) NULL,
	[cmnd] [varchar](12) NULL,
	);

	select * from Account


