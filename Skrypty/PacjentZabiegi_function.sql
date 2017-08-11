CREATE FUNCTION PacjentZabiegi ( @PESEL NVARCHAR(11) )
RETURNS @ReturnTable TABLE
(
	Id INT,
	Imie NVARCHAR(50),
	Nazwisko NVARCHAR(50),
	NazwaZabiegu NVARCHAR(80),
	Typ NVARCHAR(50),
	Koszt INT,
	Ilosc INT,
	CalkowityKoszt INT,
	Data Date
)
AS
BEGIN
	INSERT INTO @ReturnTable
		SELECT [Id pacjenta], Imie, Nazwisko, Z.Nazwa [Nazwa zabiegu], Z.Typ, Z.Koszt, SUB1.Ilosc [Ilosc], (SUB1.Ilosc*Z.Koszt) [Ca³kowity koszt], (SELECT Data FROM Wezwanie WHERE Id = SUB1.Id_wezwania) FROM Zabieg Z JOIN
		(SELECT [Id pacjenta], Imie, Nazwisko, PESEL, Id_zabiegu, [Id opieki], Ilosc, SUB.Id_wezwania FROM 
		(SELECT P.Id [Id pacjenta], P.Imie, P.Nazwisko, P.PESEL, O.Id [Id opieki], O.Id_wezwania FROM Pacjent P JOIN Opieka O ON P.Id = O.Id_pacjenta) AS SUB JOIN PrzeprowadzonyZabieg PZ ON SUB.[Id opieki] = Pz.Id_opieki) AS SUB1 ON Z.Id = SUB1.Id_zabiegu
		WHERE PESEL = @PESEL
RETURN
END
GO
