CREATE TABLE [dbo].[Tracks]
(
	[trackId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [name] VARCHAR(50) NULL, 
    [city] VARCHAR(581) NULL, 
    [country] VARCHAR(50) NULL, 
    [layout] VARCHAR(MAX) NULL 
)
