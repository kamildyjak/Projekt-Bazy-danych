CREATE PROC KaretkaWezwania (@numer INT)
AS
		SELECT SUB.Data, SUB.Miejscowosc, SUB.Adres, SUB.Ile_poszkodowanych FROM Karetka K JOIN
		(SELECT * FROM WezwanieZespoly WZ JOIN Zespol Z ON WZ.[Id zespolu] = Z.Id) AS SUB ON K.Id = SUB.Id_karetki
		WHERE K.Numer_boczny = @numer
GO
