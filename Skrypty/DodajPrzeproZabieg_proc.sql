CREATE PROC DodajPrzeproZabieg(@Data DATE, @Miejscowosc NVARCHAR(80), @Adres NVARCHAR(80), @PESEL NVARCHAR(11), @Id_ratownika INT, @Zabieg NVARCHAR(50), @Ilosc INT)
AS
	DECLARE @resultWezw INT
	DECLARE @resultPac INT
	DECLARE @resultOp INT
	DECLARE @resultZab INT
	SET @resultWezw = (SELECT * FROM IdWezwania(@Data, @Miejscowosc, @Adres))
	IF(@resultWezw IS NULL) RAISERROR('Nie istnieje takie wezwanie',16,1) 
	ELSE BEGIN
		SET @resultPac = (SELECT Id FROM Pacjent WHERE PESEL = @PESEL)
		IF(@resultPac IS NULL) RAISERROR('Nie istnieje taki pacjent',16,1) 
		ELSE BEGIN
			SET @resultOp = (SELECT Id FROM Opieka WHERE Id_ratownika = @Id_ratownika AND Id_pacjenta = @resultPac) 
			IF (@resultOp IS NULL) RAISERROR('Wskazany ratownik nie udziala³ pomocy temu pacjentowi',16,1) 
			ELSE BEGIN
				SET @resultZab = (SELECT Id FROM Zabieg WHERE Nazwa = @Zabieg)
				IF (@resultZab IS NULL) RAISERROR('Nie istnieje taki zabieg',16,1) 
				ELSE
					INSERT INTO PrzeprowadzonyZabieg VALUES(@resultOp, @resultZab, @ilosc)
			END
		END
	END

GO
