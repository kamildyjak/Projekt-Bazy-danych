CREATE FUNCTION IdWezwania(@Data DATE, @Miejscowosc NVARCHAR(80), @Adres NVARCHAR(80))
RETURNS @return TABLE
(
	Id INT
)
AS
BEGIN
	INSERT INTO @return
	SELECT ID FROM Wezwanie WHERE Data = @Data AND Miejscowosc = @Miejscowosc AND Adres = @Adres
RETURN
END
GO

