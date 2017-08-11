CREATE TABLE Karetka(
Id INT IDENTITY(1,1) PRIMARY KEY,
Numer_rejestracji NVARCHAR(7) NOT NULL UNIQUE,
Numer_boczny INT NOT NULL UNIQUE,
Typ NVARCHAR(50) NOT NULL,
CONSTRAINT Karetka_typ CHECK (Typ IN ('Podstawowa', 'Specjalistyczna', 'Neonatologiczna', 'Transportowa', 'Helikopter'))
)