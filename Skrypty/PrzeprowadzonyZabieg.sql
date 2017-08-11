CREATE TABLE PrzeprowadzonyZabieg(
Id_opieki INT,
Id_zabiegu INT,
Ilosc INT NOT NULL,
PRIMARY KEY (Id_opieki, Id_zabiegu)
)