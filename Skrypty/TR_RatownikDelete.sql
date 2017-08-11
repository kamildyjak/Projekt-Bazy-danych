CREATE TRIGGER TR_RatownikDelete ON Ratownik
AFTER DELETE
AS
	DECLARE @ZespolId INT
	SELECT @ZespolId = (SELECT Id_zespolu FROM DELETED)
	UPDATE Zespol SET Ilosc_osob = Ilosc_osob - 1 WHERE Id = @ZespolId
GO