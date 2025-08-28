CREATE TABLE  Tracks_temporal(
	[TrakcsID] [int] PRIMARY KEY CLUSTEREd IDENTITY(1,1) NOT NULL,
	[TrackName] [nvarchar](50) NOT NULL,
	[TrackDuration] [time](7) NOT NULL,
	[AlbumID] [int] NOT NULL,
	[MuicalGenresID] [int] NOT NULL);

	go


INSERT Tracks_temporal 
SELECT TrackName, TrackDuration, AlbumID,	MusicalGenresID
FROM Tracks;

GO

ALTER TABLE Tracks_temporal
ADD 
TracksStartDate datetime2(0) GENERATED ALWAYS AS ROW START HIDDEN CONSTRAINT DF_TracksSysStartDate DEFAULT DATEADD(MINUTE,-1,SYSUTCDATETIME()), 
TracksEndDate datetime2(0) GENERATED ALWAYS AS ROW END HIDDEN CONSTRAINT DF_TracksSysEndDate DEFAULT CONVERT(datetime2(0), '9999-12-31 23:59:59'),
PERIOD FOR SYSTEM_TIME (TracksStartDate, TracksEndDate); 
GO

ALTER TABLE Tracks_temporal
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Tracks_temporal_History));
GO



SELECT * FROM Tracks_temporal
go

