CREATE TABLE [dbo].[Results]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [DriverTeam] INT NULL, 
    [finishingPosition] VARCHAR(50) NULL, 
    [finishingTime] TIME NULL, 
    [laps] INT NULL, 
    [nPitsops] INT NULL
)
