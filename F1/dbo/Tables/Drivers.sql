CREATE TABLE [dbo].[Drivers]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [name] VARCHAR(50) NOT NULL, 
    [surname] VARCHAR(50) NOT NULL, 
    [number] VARCHAR(50) NULL, 
    [nationality] VARCHAR(50) NULL
)
