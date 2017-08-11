CREATE PROC DodajPrzydzial (@Data DATE, @Miejscowosc NVARCHAR(80), @Adres NVARCHAR(80), @Id_zespolu INT)
AS
	DECLARE @resultWezw INT
	SET @resultWezw = (SELECT * FROM IdWezwania(@Data, @Miejscowosc, @Adres))
	IF(@resultWezw IS NULL)	RAISERROR('Nie istnieje takie wezwanie',16,1)
	ELSE BEGIN
		IF(SELECT Id FROM Zespol WHERE Id = @Id_zespolu) IS NOT NULL
		INSERT INTO Przydzial VALUES(@resultWezw, @Id_zespolu)
		ELSE RAISERROR('Nie istnieje taki zespol',16,1)
	END
GO 