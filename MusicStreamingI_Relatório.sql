--1 Lista alfab�tica de utilizadores 

SELECT * FROM Users
ORDER BY UserName ASC;
GO

--2 Lista alfab�tica de G�neros musicais 

SELECT * FROM MusicalGenres
ORDER BY MusicalName  ASC;
GO

--3 Lista alfab�tica de Etiquetas/Labels 

SELECT *FROM Labels
ORDER BY LabelsFirstName ASC;
GO

--4 Lista alfab�tica de bandas, por pa�ses

SELECT SingersID, CountriesName, SingerName
FROM  Singers
 INNER JOIN Countries 
 ON Singers.CountriesID = Countries.CountriesID
 ORDER BY CountriesName ASC;
GO

--5 Lista alfab�tica de banda, label, g�nero, nome �lbum 

SELECT SingerName, AlbumName, ( Concat( LabelsFirstName, '  ',  LabelsLastName)) as LabelsName,  MusicalName

FROM Album
INNER JOIN Labels
ON Album.LabelsID = Labels.LabelsID

INNER JOIN Singers
ON Album.SingersID = Singers.SingersID

INNER JOIN Tracks
ON Album.AlbumID = Tracks.AlbumID

INNER JOIN MusicalGenres
ON Tracks.AlbumID = MusicalGenres.MusicalGenresID
ORDER BY SingerName DESC

GO

--6 Lista dos 5 pa�ses com mais bandas ? 

SELECT CountriesName,
Count(SingerName) as NumberSingers,
RANK ()OVER (ORDER BY CountriesName Desc) as CountriesRanking

FROM Singers AS S

INNER JOIN Countries AS C
ON S.CountriesID = C.CountriesID
GROUP BY CountriesName;
GO

--7 Lista das 10 bandas com mais �lbuns ? 

SELECT Count( AlbumName) as AlbumNumber, AlbumName, SingerName, 

RANK ()OVER (ORDER BY AlbumName Desc) as SingerRanking

FROM Album as A

INNER JOIN Singers as S
ON A.AlbumID = S.SingersID
GROUP BY SingerName, AlbumName;
GO

--8 Lista das 5 etiquetas com mais �lbuns ?

SELECT TOP (5) ( Concat( LabelsFirstName, '  ',  LabelsLastName)) as LabelsName, COUNT(A.AlbumName) as TAlbum
FROM Album as A

INNER JOIN Labels as L
ON A.LabelsID = L.LabelsID
GROUP By  LabelsFirstName,LabelsLastName
ORDER BY TAlbum;
GO

--9 Lista dos 5 g�neros musicais com mais �lbuns ? --- 

SELECT  MusicalName, (Count(Distinct A.AlbumName)) as ATotal

FROM  Tracks as T

INNER JOIN Album as A
ON T.AlbumID = A.AlbumID

INNER JOIN  MusicalGenres as MG
ON T.MusicalGenresID = MG.MusicalGenresID

GROUP BY MusicalName
ORDER BY MusicalName;
GO

----10 Lista dos 20 temas de �lbuns mais longos ? 

SELECT TOP (20)TrackName, AlbumName, TrackDuration
FROM Tracks as T
INNER JOIN Album as A
ON T.AlbumID = A.AlbumID
ORDER BY TrackDuration DESC;
GO

--11 Lista dos 20 temas de �lbuns mais r�pidos ? 

SELECT TOP (20)TrackName, AlbumName, TrackDuration
FROM Tracks as T
INNER JOIN Album as A
ON T.AlbumID = A.AlbumID
ORDER BY TrackDuration ASC;
GO

--12 Lista dos 10 �lbuns que demoram mais tempo ? 

SELECT AlbumName, SUM(DATEDIFF(MINUTE, '00:00:00',TrackDuration)) as TDTOTAL

FROM Tracks as T

INNER JOIN Album as A
ON T.AlbumID = A.AlbumID
GROUP BY AlbumName;
GO

--13 Quantos temas tem cada �lbum ? 

SELECT AlbumName, Count (TrackName) as NTracks

FROM Tracks as T

INNER JOIN Album AS A
ON T.AlbumID = A.AlbumID
group BY AlbumName;
GO



---14 Quantos temas de �lbuns demoram mais que 5 minutos ?

SELECT TrackName, AlbumName, TrackDuration

FROM Tracks as T

INNER JOIN Album AS A
ON T.AlbumID = A.AlbumID
WHERE DATEDIFF (SECOND, '00:00:00',TrackDuration) >( 60*5 )
ORDER BY TrackName;
GO

---15 Quais s�o as m�sicas mais ouvidas ? 

SELECT  TrackName, Count (TrackName) as RepNumber

FROM MusicHistoric as MH

INNER JOIN Tracks as T
ON T.TracksID = MH.TracksID

INNER jOIN  Users U
ON MH.UsersID = U.UsersID
GROUP BY TrackName;
GO

---16 Quais s�o as m�sicas mais ouvidas, por pa�s, entre as 0000AM e as 08AM ? 
SELECT CountriesName,TrackName, Count (*) as RepNumber 

FROM MusicHistoric AS MH

INNER JOIN Tracks as T
ON MH.TracksID = T.TracksID 

INNER JOIN Countries as C
ON MH.CountriesID = C.CountriesID

WHERE ListenTime BETWEEN '00:00:00' AND '08:00:00'
GROUP BY CountriesName, TrackName
ORDER BY CountriesName, TrackName ;
GO

 ---17 Quais s�o as m�sicas mais ouvidas, por pa�s, entre as 08:00 e as 16:00 ? 

SELECT  CountriesName, TrackName, Count (*) as RepNumber
FROM MusicHistoric AS MH

INNER JOIN Tracks as T
ON MH.TracksID = T.TracksID 


INNER JOIN Countries as C
ON MH.CountriesID = C.CountriesID

WHERE ListenTime BETWEEN '08:00:00' AND '16:00:00'
GROUP BY CountriesName,TrackName
ORDER BY CountriesName, TrackName DESC; 
GO

---18 Qual o g�nero musical mais ouvido por pa�s ?

SELECT C.CountriesName,  MG.MusicalName, Count (*) as TTOTAL
FROM MusicHistoric as MH

INNER JOIN Countries as C
ON MH.CountriesID = C.CountriesID

INNER JOIN Tracks as T
ON MH.TracksID = T.TracksID

INNER JOIN MusicalGenres as MG
ON T.MusicalGenresID = MG.MusicalGenresID


Group by  CountriesName, MusicalName
ORDER BY CountriesName, TTOTAL DESC;
GO


---19 Qual o g�nero musical mais ouvido por pa�s, entre as 0000AM e as 08AM ? 
SELECT C.CountriesName,  MG.MusicalName, Count (*) as TTOTAL 
FROM MusicHistoric as MH

INNER JOIN Countries as C
ON MH.CountriesID = C.CountriesID

INNER JOIN Tracks as T
ON MH.TracksID = T.TracksID

INNER JOIN MusicalGenres as MG
ON T.MusicalGenresID = MG.MusicalGenresID

WHERE ListenTime BETWEEN '00:00:00' AND '08:00:00'

Group by  CountriesName, MusicalName
ORDER BY CountriesName, TTOTAL DESC;
GO

----20 Qual o g�nero musical mais ouvido por pa�s, entre as 16:00 e as 24:00 ?
SELECT C.CountriesName,  MG.MusicalName, Count (*) as TTOTAL 
FROM MusicHistoric as MH

INNER JOIN Countries as C
ON MH.CountriesID = C.CountriesID

INNER JOIN Tracks as T
ON MH.TracksID = T.TracksID

INNER JOIN MusicalGenres as MG
ON T.MusicalGenresID = MG.MusicalGenresID

WHERE ListenTime BETWEEN '16:00:00' AND '23:59:59'

Group by  CountriesName, MusicalName
ORDER BY CountriesName, TTOTAL DESC;
GO