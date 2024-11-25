CREATE TABLE [dbo].[RaceResult]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [race] INT NULL, 
    [result] INT NULL
     CONSTRAINT FK_RaceResult_Races_Id FOREIGN KEY (race) REFERENCES Races(Id)
     CONSTRAINT FK_RaceResult_Results_Id FOREIGN KEY (result) REFERENCES Results(Id)
)
