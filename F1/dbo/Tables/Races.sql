CREATE TABLE [dbo].[Races]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [season] INT NULL, 
    [track] INT NULL, 
    [date] DATE NULL
     CONSTRAINT FK_Races_Season_Id FOREIGN KEY (season) REFERENCES Season(Id)
     CONSTRAINT FK_Races_Tracks_Id FOREIGN KEY (track) REFERENCES Tracks(Id)
)
