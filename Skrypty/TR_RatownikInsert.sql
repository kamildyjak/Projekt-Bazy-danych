CREATE TRIGGER TR_RatownikInsert ON Ratownik
AFTER INSERT
AS
	DECLARE @ZespolId INT
	SELECT @ZespolId = (SELECT Id_zespolu FROM INSERTED)
	UPDATE Zespol SET Ilosc_osob = Ilosc_osob + 1 WHERE Id = @ZespolId
GO