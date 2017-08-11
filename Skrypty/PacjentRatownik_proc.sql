CREATE PROC PacjentRatownikProc ( @PESEL NVARCHAR(11) )
AS
	SELECT P.Id [Id pacjenta], P.Imie, P.Nazwisko, P.PESEL, SUB.Id_ratownika, SUB.[Imie ratownika], SUB.[Nazwisko ratownika] FROM Pacjent P JOIN
	(SELECT * FROM PacjentRatownik WHERE [Pesel pacjenta] = @PESEL) AS SUB ON SUB.[Id pacjenta] = P.Id

GO
