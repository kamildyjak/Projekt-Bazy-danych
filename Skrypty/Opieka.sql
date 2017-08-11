CREATE TABLE Opieka(
Id INT IDENTITY(1,1) UNIQUE,
Id_pacjenta INT,
Id_ratownika INT,
Id_wezwania INT,
PRIMARY KEY (Id_pacjenta, Id_ratownika, Id_wezwania)
)