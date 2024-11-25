CREATE TABLE [dbo].[CarSeason]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [car] INT NULL, 
    [season] INT NULL
    FOREIGN KEY (car) REFERENCES Car(Id)
    FOREIGN KEY (season) REFERENCES Season(Id)
)
