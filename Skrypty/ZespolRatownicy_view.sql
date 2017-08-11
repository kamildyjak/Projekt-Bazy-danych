CREATE VIEW ZespolRatownicy
AS
SELECT Z.Id [Id zespolu], Typ, R.Imie, R.Nazwisko, R.Funkcja FROM Zespol Z JOIN
Ratownik R ON Z.Id = R.Id_zespolu
GO