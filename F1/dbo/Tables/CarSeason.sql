CREATE TABLE [dbo].[CarSeason]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [car] INT NULL, 
    [season] INT NULL
     CONSTRAINT FK_CarSeason_Car_Id FOREIGN KEY (car) REFERENCES Car(Id)
     CONSTRAINT FK_CarSeason_Season_Id FOREIGN KEY (season) REFERENCES Season([seasonId])

)
