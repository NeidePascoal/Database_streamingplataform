
CREATE TRIGGER T_UInsert ON Users
FOR INSERT
AS
  SET NOCOUNT ON;
  SELECT * FROM inserted;
GO

 EXECUTE P_InsertUser 'Isa', 'Bento', 'isab@gmail@.com', '1992-04-03','M', '29'; 


 Select *from Users


-- 2- Criar tabela para  atualizações de email  na tabela Users
CREATE SEQUENCE UsersSeq

AS INT
START WITH 1
INCREMENT BY 1;
GO


 CREATE TABLE Update_EmailUsers
(EmailUsersID INT PRIMARY KEY CONSTRAINT df_update_Users DEFAULT NEXT VALUE FOR UsersSeq,
UsersID INT ,
PreviousEmail nvarchar(50),
NewEmail nvarchar (50),
UpdatedOn DateTime,
ByUserSis VARCHAR(50));
GO

CREATE TRIGGER UpdateUsers
ON Users
FOR UPDATE
AS
BEGIN
	;
	DECLARE @UpdatedOn AS DateTime, @ByUsersis AS VARCHAR(50);
	SET @UpdatedOn = SYSDATETIME();
	SET @ByUsersis = SUSER_NAME();
	INSERT Update_EmailUsers (UsersID, PreviousEmail, NewEmail, UpdatedOn, ByUserSis)
	SELECT i.UsersID, d.Email, i.Email, @UpdatedOn,@ByUsersis
	FROM INSERTED AS i
	INNER JOIN DELETED AS d
	ON i.UsersID = d.UsersID;
END;
GO


UPDATE Users

SET Email = 'joseppp@hotmail.com'
WHERE UsersID = 2;
GO

-- 3- Elimina dados da tabela Users

CREATE TABLE UsersAudit (
 UserAuditID INT PRIMARY KEY CONSTRAINT df_delete_Users DEFAULT NEXT VALUE FOR UsersSeq,
 UsersID NVARCHAR(100),
 Gender NVARCHAR(100),
 Deleted_at DATETIME,
 ByUserSis VARCHAR(50));
GO

CREATE TRIGGER DeleteUsers
ON Users
AFTER DELETE
AS
BEGIN
DECLARE @Deleted_at AS DateTime, @ByUsersis AS VARCHAR(50);
	SET @Deleted_at = SYSDATETIME();
	SET @ByUsersis = SUSER_NAME();
 
    INSERT UsersAudit (UsersID, Gender, Deleted_at,ByUserSis)
    SELECT UsersID, Gender, @Deleted_at, @ByUsersis
    FROM DELETED;
END;


DELETE FROM Users
WHERE UsersID = 1;
GO

select* from Users












SELECT NAME FROM SYS.triggers

