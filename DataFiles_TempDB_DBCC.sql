Use MusicStreaming1
DBCC CHECKDB ([MusicStreaming1]) WITH NO_INFOMSGS;

DBCC TRACEON(1117, -1);
DBCC TRACEON(1118, -1);

DBCC TRACESTATUS(1117, 1118);

USE tempdb;
GO

EXEC sp_helpfile;


ALTER DATABASE tempdb 
ADD FILE (
    NAME = N'tempdb_datafile2',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA/tempdb_datafile2.ndf',
    SIZE = 500MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 50MB
),
(
    NAME = N'tempdb_datafile3',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tempdb_datafile3.ndf',
    SIZE = 500MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 50MB
);

GO