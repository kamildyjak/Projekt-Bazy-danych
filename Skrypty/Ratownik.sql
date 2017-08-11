CREATE TABLE Ratownik(
Id INT PRIMARY KEY,
Imie NVARCHAR(50) NOT NULL,
Nazwisko NVARCHAR(50) NOT NULL,
Data_urodzenia DATE NOT NULL,
Miejsce_urodzenia NVARCHAR(50) NOT NULL,
PESEL NVARCHAR(11) NOT NULL UNIQUE,
Id_zespolu INT NOT NULL,
Funkcja NVARCHAR(50) NOT NULL,
CONSTRAINT Ratownik_funkcja CHECK (Funkcja IN ('Lekarz systemu', 'Pielêgniarka systemu', 'Ratownik medyczny', 'Pilot'))
)