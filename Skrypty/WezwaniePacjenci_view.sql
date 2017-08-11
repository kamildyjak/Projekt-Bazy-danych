CREATE VIEW WezwaniePacjenci
AS
	SELECT Id_wezwania, P.Imie [Imie pacjenta], P.Nazwisko [Nazwisko pacjenta], P.PESEL [PESEL pacjenta], P.Id [Id pacjenta] FROM Opieka O JOIN Pacjent P ON O.Id_pacjenta =  P.Id

GO
