CREATE TRIGGER TR_PrzepZabiegInsert ON PrzeprowadzonyZabieg
AFTER INSERT
AS
BEGIN
	DECLARE @OpiekaId INT
	DECLARE @WezwanieId INT
	DECLARE @Koszt INT
	DECLARE @ZabiegId INT
	SELECT @OpiekaId = Id_opieki FROM INSERTED
	SET @WezwanieId = (SELECT Id_wezwania FROM Opieka WHERE Id = @OpiekaId)
	SELECT @Koszt = Ilosc FROM INSERTED
	SELECT @ZabiegId = Id_zabiegu FROM INSERTED
	SET @Koszt =  @Koszt * (SELECT Koszt FROM Zabieg WHERE Id = @ZabiegId)
	SET @Koszt = @Koszt + (SELECT Koszt_zabiegow FROM Koszty WHERE Id_wezwania = @WezwanieId)
	UPDATE Koszty SET Koszt_zabiegow = @Koszt WHERE Id_wezwania = @WezwanieId 
END
GO