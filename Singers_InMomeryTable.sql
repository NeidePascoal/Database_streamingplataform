USE [master]
GO

ALTER DATABASE [MusicStreaming1] ADD FILEGROUP [MusicStreaming_ memory_optimized_filegroup_0 ] CONTAINS MEMORY_OPTIMIZED_DATA 
GO

ALTER DATABASE [MusicStreaming1] ADD FILE ( NAME = N'MusicStreaming_memory_optimized_file_', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MusicStreaming_memory_optimized_file_' ) TO FILEGROUP [MusicStreaming_ memory_optimized_filegroup_0 ]
GO

USE [MusicStreaming1]
GO

EXEC dbo.sp_rename @objname = N'[dbo].[Singers]', @newname = N'Singers_old', @objtype = N'OBJECT'
GO

USE [MusicStreaming1]
GO

EXEC [MusicStreaming1].dbo.sp_rename @objname = N'[dbo].[DF__Singers__Created__32E0915F]', @newname = N'DF__Singers__Created__32E0915FOnSingers_old', @objtype = N'OBJECT'
GO

USE [MusicStreaming1]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Singers]
(
	[SingersID] [int] IDENTITY(1,1) NOT NULL,
	[SingerName] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[CountriesID] [int] NULL,
	[Created] [datetime] NOT NULL,

 CONSTRAINT [Singers_primaryKey]  PRIMARY KEY NONCLUSTERED HASH 
(
	[SingersID]
)WITH ( BUCKET_COUNT = 1024)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO

ALTER TABLE [dbo].[Singers] ADD  CONSTRAINT [DF__Singers__Created__32E0915F]  DEFAULT (getdate()) FOR [Created]
GO


