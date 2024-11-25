CREATE TABLE [dbo].[RaceResult]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [race] INT NULL, 
    [result] INT NULL
    FOREIGN KEY (race) REFERENCES Races(Id)
    FOREIGN KEY (result) REFERENCES Results(Id)
)
