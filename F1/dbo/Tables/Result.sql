CREATE TABLE [dbo].[Results]
(
	[resultId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [DriverTeam] INT NULL, 
    [finishingPosition] VARCHAR(50) NULL, 
    [finishingTime] TIME NULL, 
    [laps] INT NULL, 
    [nPitsops] INT NULL
)
