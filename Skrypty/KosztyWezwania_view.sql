CREATE VIEW KosztyWezwania
AS
SELECT W.Id [Id wezwania], W.Data, W.Miejscowosc, W.Adres, W.Ile_poszkodowanych, K.Koszt_zabiegow FROM Koszty K JOIN Wezwanie W ON K.Id_wezwania = W.Id
GO
