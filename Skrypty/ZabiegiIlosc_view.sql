CREATE VIEW ZabiegiIlosc
AS
SELECT Z.Nazwa [Nazwa zabiegu], COUNT(*) [Ilosc przeprowadzonych] FROM Zabieg Z JOIN PrzeprowadzonyZabieg PZ ON Z.Id = PZ.Id_zabiegu GROUP BY Z.Nazwa
GO