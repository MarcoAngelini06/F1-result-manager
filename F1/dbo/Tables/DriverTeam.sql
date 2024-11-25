CREATE TABLE [dbo].[DriverTeam]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Team] INT NULL, 
    [Driver] INT NULL, 
    [Season] INT NULL
    FOREIGN KEY (Team) REFERENCES Teams(Id)
    FOREIGN KEY (Driver) REFERENCES Drivers(Id)
    FOREIGN KEY (Season) REFERENCES CarSeason(Id)
)