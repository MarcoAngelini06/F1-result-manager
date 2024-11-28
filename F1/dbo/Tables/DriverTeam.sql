CREATE TABLE [dbo].[DriverTeam]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Team] INT NULL, 
    [Driver] INT NULL, 
    [CarSeason] INT NULL
    CONSTRAINT FK_DriverTeam_Teams_Team FOREIGN KEY  (Team) REFERENCES Teams([teamId])  
    CONSTRAINT FK_DriverTeam_Drivers_Id FOREIGN KEY (Driver) REFERENCES Drivers(Id)
    CONSTRAINT FK_DriverTeam_Season_Id FOREIGN KEY ([CarSeason]) REFERENCES CarSeason(Id)
)