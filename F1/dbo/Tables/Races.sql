CREATE TABLE [dbo].[Races]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [season] INT NULL, 
    [track] INT NULL, 
    [date] DATE NULL
    FOREIGN KEY (season) REFERENCES Season(Id)
    FOREIGN KEY (track) REFERENCES Tracks(Id)
)
