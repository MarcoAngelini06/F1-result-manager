CREATE TABLE [dbo].[DriverTeam]
(
    [driverTeamId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Team] INT NULL, 
    [Driver] INT NULL, 
    [Season] INT NULL
    CONSTRAINT FK_DriverTeam_Teams_Team FOREIGN KEY  (Team) REFERENCES Teams([teamId])  
    CONSTRAINT FK_DriverTeam_Drivers_Id FOREIGN KEY (Driver) REFERENCES Drivers(Id)
    CONSTRAINT FK_DriverTeam_Season_Id FOREIGN KEY ([Season]) REFERENCES Season(seasonId), 
    [Points] INT NULL
)