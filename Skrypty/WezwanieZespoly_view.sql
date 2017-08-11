CREATE VIEW WezwanieZespoly
AS
SELECT Id [Id wezwania], Data, Miejscowosc, Adres, Ile_poszkodowanych, [Id zespolu], [Typ zespolu] FROM Wezwanie LEFT JOIN 
(SELECT P.Id_wezwania, Z.Id [Id zespolu], Z.Typ [Typ zespolu] FROM Przydzial P JOIN
Zespol Z ON P.Id_zespolu = Z.Id) AS SUB ON Id = SUB.Id_wezwania
GO