CREATE TRIGGER TR_PrzepZabiegDelete ON PrzeprowadzonyZabieg
AFTER DELETE
AS
BEGIN
	DECLARE @OpiekaId INT
	DECLARE @WezwanieId INT
	DECLARE @Koszt INT
	DECLARE @ZabiegId INT
	SELECT @OpiekaId = Id_opieki FROM DELETED
	SET @WezwanieId = (SELECT Id_wezwania FROM Opieka WHERE Id = @OpiekaId)
	SELECT @Koszt = Ilosc FROM DELETED
	SELECT @ZabiegId = Id_zabiegu FROM DELETED
	SET @Koszt =  @Koszt * (SELECT Koszt FROM Zabieg WHERE Id = @ZabiegId)
	SET @Koszt = (SELECT Koszt_zabiegow FROM Koszty WHERE Id_wezwania = @WezwanieId) - @Koszt
	UPDATE Koszty SET Koszt_zabiegow = @Koszt WHERE Id_wezwania = @WezwanieId 
END
GO