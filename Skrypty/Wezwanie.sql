CREATE TABLE Wezwanie(
Id INT IDENTITY(1,1) UNIQUE,
Data DATE NOT NULL,
Miejscowosc NVARCHAR(50) NOT NULL,
Adres NVARCHAR(50) NOT NULL,
Ile_poszkodowanych INT NOT NULL,
PRIMARY KEY(Data, Miejscowosc, Adres)
)