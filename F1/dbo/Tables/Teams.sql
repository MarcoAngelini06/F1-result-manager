CREATE TABLE [dbo].[Teams]
(
	[teamId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [TeamName] VARCHAR(50) NOT NULL, 
    [totPoints] INT NULL, 
    [teamColor] VARCHAR(50) NULL,
)
