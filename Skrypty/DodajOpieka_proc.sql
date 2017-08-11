CREATE PROC DodajOpieka(@Data DATE, @Miejscowosc NVARCHAR(80), @Adres NVARCHAR(80), @PESEL NVARCHAR(11), @Id_ratownika INT)
AS
	DECLARE @resultWezw INT
	SET @resultWezw = (SELECT * FROM IdWezwania(@Data, @Miejscowosc, @Adres))
	IF(@resultWezw IS NULL) RAISERROR('Nie istnieje takie wezwanie',16,1)
	ELSE BEGIN
		DECLARE @resultPac INT
		SET @resultPac = (SELECT Id FROM Pacjent WHERE PESEL = @PESEL)
		IF(@resultPac IS NULL) RAISERROR('Nie istnieje taki pacjent',16,1)
		ELSE BEGIN
			IF(SELECT Id FROM Ratownik WHERE Id = @Id_ratownika) IS NULL RAISERROR('Nie istnieje taki ratownik',16,1)
			ELSE BEGIN
				DECLARE @ZespolId INT
				SET @ZespolId = (SELECT Id_zespolu FROM Ratownik WHERE Id = @Id_ratownika)
				IF(SELECT Id_wezwania FROM Przydzial WHERE Id_wezwania = @resultWezw AND Id_zespolu = @ZespolId) IS NULL RAISERROR('Ratownik nie bra³ udzia³u przy tym wezwaniu',16,1)
				ELSE 
					INSERT INTO Opieka VALUES (@resultPac, @Id_ratownika, @resultWezw)
			END
		END
	END
GO
