CREATE TABLE Zespol(
Id INT IDENTITY(1,1) PRIMARY KEY,
Typ NVARCHAR(50) NOT NULL,
Ilosc_osob INT NOT NULL,
Id_karetki INT NOT NULL,
CONSTRAINT Zespol_typ CHECK (Typ IN ('Podstawowy', 'Specjalistyczny', 'Lotniczy'))
)