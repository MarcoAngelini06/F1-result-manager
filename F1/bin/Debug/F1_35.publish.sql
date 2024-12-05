﻿/*
Deployment script for F1

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar F1 "F1"
:setvar DatabaseName "F1"
:setvar DefaultFilePrefix "F1"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
PRINT N'Dropping Foreign Key [dbo].[FK_Races_Tracks_Id]...';


GO
ALTER TABLE [dbo].[Races] DROP CONSTRAINT [FK_Races_Tracks_Id];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF OBJECT_ID(N'tempdb..#tmpErrors') IS NULL
    CREATE TABLE [#tmpErrors] (
        Error INT
    );

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Starting rebuilding table [dbo].[Tracks]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Tracks] (
    [trackId] INT           IDENTITY (1, 1) NOT NULL,
    [name]    VARCHAR (50)  NULL,
    [city]    VARCHAR (581) NULL,
    [country] VARCHAR (50)  NULL,
    [layout]  VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([trackId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Tracks])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Tracks] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Tracks] ([trackId], [name], [city], [country], [layout])
        SELECT   [trackId],
                 [name],
                 [city],
                 [country],
                 [layout]
        FROM     [dbo].[Tracks]
        ORDER BY [trackId] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Tracks] OFF;
    END

DROP TABLE [dbo].[Tracks];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Tracks]', N'Tracks';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF OBJECT_ID(N'tempdb..#tmpErrors') IS NULL
    CREATE TABLE [#tmpErrors] (
        Error INT
    );

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creating Foreign Key [dbo].[FK_Races_Tracks_Id]...';


GO
ALTER TABLE [dbo].[Races] WITH NOCHECK
    ADD CONSTRAINT [FK_Races_Tracks_Id] FOREIGN KEY ([track]) REFERENCES [dbo].[Tracks] ([trackId]);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF OBJECT_ID(N'tempdb..#tmpErrors') IS NULL
    CREATE TABLE [#tmpErrors] (
        Error INT
    );

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'The transacted portion of the database update succeeded.'
COMMIT TRANSACTION
END
ELSE PRINT N'The transacted portion of the database update failed.'
GO
IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Races] WITH CHECK CHECK CONSTRAINT [FK_Races_Tracks_Id];


GO
PRINT N'Update complete.';


GO
