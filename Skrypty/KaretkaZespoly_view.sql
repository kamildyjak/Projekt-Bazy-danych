CREATE VIEW KaretkaZespoly
AS
SELECT K.Id [Id karetki], K.Numer_boczny, Z.Id [Id zespolu], Z.Typ [Typ zespolu] FROM Karetka K JOIN
Zespol Z ON K.Id = Z.Id_karetki
GO