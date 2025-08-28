--1  Permite-nos todas as informações relevantes contidaS na tabela Album.


CREATE PROCEDURE SP_InfAlbum
@AlbumName nvarchar (50)

AS

SELECT TrackName, AlbumName, SingerName, MusicalName

FROM Tracks T

INNER JOIN Album A ON T.AlbumID = A.AlbumID
INNER JOIN Singers S ON A.SingersID = S.SingersID
INNER JOIN MusicalGenres  MG ON T.MusicalGenresID = MG.MusicalGenresID
WHERE AlbumName= @AlbumName
ORDER BY AlbumName;
GO

EXEC SP_InfAlbum 'Twenty-One'

--2- Insere  novos registos na tabela Labels

CREATE PROCEDURE P_InserTLabels 
@LabelsFirstName nvarchar (50), @LabelsLastName nvarchar (50), @LabelsYear int 
AS 
SET NOCOUNT ON;
BEGIN 
 
 INSERT  Labels(LabelsFirstName, LabelsLastName, LabelsYear, Created)  VALUES (@LabelsFirstName, @LabelsLastName, @LabelsYear, GETDATE());
 END;
 GO

 EXEC P_InserTLabels 'Atlantic', 'Records', '1947'

 SELECT* FROM LABELS

 --3- Insere novos registos na tabela MusicalGenres

 CREATE PROCEDURE  P_InsertMusicalGenres
 @MusicalName nvarchar (50) 

 AS 
 SET NOCOUNT ON;
 BEGIN 
 INSERT MusicalGenres(MusicalName, Created) Values (@MusicalName, GETDATE());
 END;
 GO

EXEC P_InsertMusicalGenres 'Dance'
EXEC P_InsertMusicalGenres 'Jazz'
EXEC P_InsertMusicalGenres 'Hip Hop'
EXEC P_InsertMusicalGenres 'Classic Music'
EXEC P_InsertMusicalGenres 'Bossa Nova'

 SELECT *FROM MusicalGenres 
 
 DELETE  FROM MusicalGenres
 WHERE MusicalGenresID = 12

 DBCC CHECKIDENT (MusicalGenres,RESEED, 9) 
 EXEC P_InsertMusicalGenres 'Bossa Nova'



--3- Retorna o número  email através do Users

CREATE PROCEDURE P_UserDateBirth
@UsersID nvarchar (50), @dateBirth date OUTPUT
AS
BEGIN 
     SET @DATEBIRTH = (Select UserDateBirth from Users
     WHERE UsersID = @UsersID);
END;
GO

 DECLARE @DateVAR date;
 EXECUTE P_UserDateBirth @UserSID = 2,  @dateBirth = @DateVAR OUTPUT;
 PRINT @DateVAR;
 GO

 --4- Retorna as músicas mais ouvidas
 CREATE PROCEDURE P_RankTrack
AS 
SET NOCOUNT ON;
BEGIN 
 SELECT  TrackName, Count (TrackName) as RepNumber

FROM MusicHistoric as MH

INNER JOIN Tracks as T
ON T.TracksID = MH.TracksID

INNER jOIN  Users U
ON MH.UsersID = U.UsersID
GROUP BY TrackName;
END;
GO
EXECUTE P_RankTrack


--5- Insere dados na tabela Users

CREATE PROCEDURE P_InsertUser
(@UserName nvarchar (50), @UserLastName nvarchar (50), @Email nvarchar(50), @UserDateBirth date, @Gender nvarchar(1), @CountriesID int )

AS 
SET NOCOUNT ON;
BEGIN 
 
INSERT Users( UserName, UserLastName, Email, UserDateBirth,	Gender,	CountriesID, Created) VALUES (@UserName, @UserLastName, @Email, @UserDateBirth, @Gender, @CountriesID, GETDATE())
END;
GO
EXECUTE P_InsertUser 'Jonas', 'Teixeira', 'jt@hotmail.com','2020-02-20', 'M', '123' ;
EXECUTE P_InsertUser 'Luan', 'Lopo', 'luanlopo@gmail.com', '1990-03-15', 'M','155';
