IF OBJECT_ID('dbo.Rat_Zesp') IS NOT NULL
	ALTER TABLE Ratownik DROP CONSTRAINT Rat_Zesp
ALTER TABLE Ratownik
ADD CONSTRAINT Rat_Zesp
FOREIGN KEY(Id_zespolu) REFERENCES Zespol(Id)


IF OBJECT_ID('dbo.Zesp_Karet') IS NOT NULL
	ALTER TABLE Zespol DROP CONSTRAINT Zesp_Karet
ALTER TABLE Zespol
ADD CONSTRAINT Zesp_Karet
FOREIGN KEY(Id_karetki) REFERENCES Karetka(Id)


IF OBJECT_ID('dbo.Przydz_Zesp') IS NOT NULL
	ALTER TABLE Przydzial DROP CONSTRAINT Przydz_Zesp
ALTER TABLE Przydzial
ADD CONSTRAINT Przydz_Zesp
FOREIGN KEY(Id_zespolu) REFERENCES Zespol(Id)


IF OBJECT_ID('dbo.Przydz_Wez') IS NOT NULL
	ALTER TABLE Przydzial DROP CONSTRAINT Przydz_Wez
ALTER TABLE Przydzial
ADD CONSTRAINT Przydz_Wez
FOREIGN KEY(Id_wezwania) REFERENCES Wezwanie(Id)


IF OBJECT_ID('dbo.Opiek_Pac') IS NOT NULL
	ALTER TABLE Opieka DROP CONSTRAINT Opiek_Pac
ALTER TABLE Opieka
ADD CONSTRAINT Opiek_Pac
FOREIGN KEY(Id_pacjenta) REFERENCES Pacjent(Id)


IF OBJECT_ID('dbo.Opiek_Rat') IS NOT NULL
	ALTER TABLE Opieka DROP CONSTRAINT Opiek_Rat
ALTER TABLE Opieka
ADD CONSTRAINT Opiek_Rat
FOREIGN KEY(Id_ratownika) REFERENCES Ratownik(Id)


IF OBJECT_ID('dbo.Opiek_Wez') IS NOT NULL
	ALTER TABLE Opieka DROP CONSTRAINT Opiek_Wez
ALTER TABLE Opieka
ADD CONSTRAINT Opiek_Wez
FOREIGN KEY(Id_wezwania) REFERENCES Wezwanie(Id)


IF OBJECT_ID('dbo.Przepro_Opiek') IS NOT NULL
	ALTER TABLE PrzeprowadzonyZabieg DROP CONSTRAINT Przepro_Opiek
ALTER TABLE PrzeprowadzonyZabieg
ADD CONSTRAINT Przepro_Opiek
FOREIGN KEY(Id_opieki) REFERENCES Opieka(Id)


IF OBJECT_ID('dbo.Przepro_Zab') IS NOT NULL
	ALTER TABLE PrzeprowadzonyZabieg DROP CONSTRAINT Przepro_Zab
ALTER TABLE PrzeprowadzonyZabieg
ADD CONSTRAINT Przepro_Zab
FOREIGN KEY(Id_zabiegu) REFERENCES Zabieg(Id)


IF OBJECT_ID('dbo.Koszt_Wez') IS NOT NULL
	ALTER TABLE Koszty DROP CONSTRAINT Koszt_Wez
ALTER TABLE Koszty
ADD CONSTRAINT Koszt_Wez
FOREIGN KEY(Id_wezwania) REFERENCES Wezwanie(Id)