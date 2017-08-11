CREATE VIEW PacjentRatownik
AS
SELECT SUB.Id [Id pacjenta], SUB.Imie [Imie pacjenta], SUB.Nazwisko [Nazwisko pacjenta], SUB.PESEL [Pesel Pacjenta], SUB.Id_ratownika, R.Imie [Imie ratownika], R.Nazwisko [Nazwisko ratownika], SUB.Ile [Iloœæ interwencji] FROM Ratownik R JOIN
(SELECT P.Id,  P.PESEL, P.Imie, P.Nazwisko, O.Id_ratownika, COUNT(*) Ile FROM Pacjent P JOIN Opieka O
ON P.Id = O.Id_pacjenta
GROUP BY P.Id, P.Imie, P.Nazwisko, O.Id_ratownika, P.PESEL) AS SUB ON R.Id = SUB.Id_ratownika
GO
