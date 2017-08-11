CREATE TABLE Zabieg(
Id INT IDENTITY(1,1) PRIMARY KEY,
Nazwa NVARCHAR(50) UNIQUE NOT NULL,
Typ NVARCHAR(50) NOT NULL,
Koszt INT NOT NULL,
CONSTRAINT Zabieg_typ CHECK (Typ IN ('Lek', 'Operacja', 'Badanie'))
)