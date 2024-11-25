insert into [dbo].[Season]
values (2024)

INSERT INTO dbo.Drivers (name, surname)
VALUES
('Max', 'Verstappen'),
('Sergio', 'Perez'),
('Lewis', 'Hamilton'),
('George', 'Russell'),
('Charles', 'Leclerc'),
('Carlos', 'Sainz'),
('Lando', 'Norris'),
('Oscar', 'Piastri'),
('Esteban', 'Ocon'),
('Pierre', 'Gasly'),
('Fernando', 'Alonso'),
('Lance', 'Stroll'),
('Valtteri', 'Bottas'),
('Zhou', 'Guanyu'),
('Yuki', 'Tsunoda'),
('Daniel', 'Ricciardo'),
('Alexander', 'Albon'),
('Logan', 'Sargeant'),
('Kevin', 'Magnussen'),
('Nico', 'Hulkenberg'),
('Juan Manuel', 'Fangio'),
('Alberto', 'Ascari'),
('Stirling', 'Moss'),
('Mike', 'Hawthorn'),
('Luigi', 'Farina'),
('Jim', 'Clark'),
('Jack', 'Brabham'),
('Graham', 'Hill'),
('Phil', 'Hill'),
('John', 'Surtees'),
('Jackie', 'Stewart'),
('Niki', 'Lauda'),
('Emerson', 'Fittipaldi'),
('James', 'Hunt'),
('Denny', 'Hulme'),
('Alain', 'Prost'),
('Nelson', 'Piquet'),
('Keke', 'Rosberg'),
('Ayrton', 'Senna'),
('Michael', 'Schumacher'),
('Damon', 'Hill'),
('Jacques', 'Villeneuve'),
('Mika', 'Häkkinen'),
('Fernando', 'Alonso'),
('Kimi', 'Räikkönen'),
('Sebastian', 'Vettel'),
('Jenson', 'Button');


INSERT INTO dbo.Car
values
('RB20',NULL),  -- Red Bull Racing
('W14',NULL),   -- Mercedes
('SF-23',NULL), -- Ferrari
('MCL60',NULL), -- McLaren
('AMR23',NULL), -- Aston Martin
('A523',NULL),  -- Alpine
('C43',NULL),   -- Alfa Romeo
('VF-23',NULL), -- Haas
('FW46',NULL);



	INSERT INTO dbo.CarSeason (Car, Season)
VALUES
((SELECT Id FROM dbo.Car WHERE name = 'RB20'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'W14'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'SF-23'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'MCL60'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'AMR23'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'A523'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'C43'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'VF-23'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024)),
((SELECT Id FROM dbo.Car WHERE name = 'FW46'), (SELECT Id FROM dbo.Season WHERE [Year] = 2024));


INSERT INTO dbo.Teams (Id, [name])
VALUES
(1, 'Red Bull Racing'),
(2, 'Mercedes'),
(3, 'Ferrari'),
(4, 'McLaren'),
(5, 'Aston Martin'),
(6, 'Alpine'),
(7, 'Alfa Romeo'),
(8, 'Haas F1 Team'),
(9, 'Williams Racing'),
(10, 'AlphaTauri'),
(11, 'Sauber'),
(12, 'Renault'),
(13, 'Toro Rosso'),
(14, 'Brawn GP'),
(15, 'Lotus'),
(16, 'Minardi'),
(17, 'Jaguar Racing'),
(18, 'Ford'),
(19, 'Benetton'),
(20, 'Brabham');


INSERT INTO [dbo].[DriverTeam] ([Driver], [Team], [CarSeason])
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Max' AND surname = 'Verstappen'), 
    1, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Lewis' AND surname = 'Hamilton'), 
    1, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Sergio' AND surname = 'Perez'), 
    2, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'George' AND surname = 'Russell'), 
    2, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Charles' AND surname = 'Leclerc'), 
    3, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Carlos' AND surname = 'Sainz'), 
    3, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Lando' AND surname = 'Norris'), 
    4, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Oscar' AND surname = 'Piastri'), 
    4, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Esteban' AND surname = 'Ocon'), 
    5, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Pierre' AND surname = 'Gasly'), 
    5, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Fernando' AND surname = 'Alonso'), 
    6, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Lance' AND surname = 'Stroll'), 
    6, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Valtteri' AND surname = 'Bottas'), 
    7, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Zhou' AND surname = 'Guanyu'), 
    7, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Yuki' AND surname = 'Tsunoda'), 
    8, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Daniel' AND surname = 'Ricciardo'), 
    8, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Alexander' AND surname = 'Albon'), 
    9, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Logan' AND surname = 'Sargeant'), 
    9, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Kevin' AND surname = 'Magnussen'), 
    10, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024))
UNION ALL
SELECT 
    (SELECT TOP 1 Id FROM dbo.Drivers WHERE Name = 'Nico' AND surname = 'Hulkenberg'), 
    10, 
    (SELECT TOP 1 Id FROM dbo.CarSeason WHERE Season = (SELECT Id FROM dbo.Season WHERE [Year] = 2024));


DELETE FROM  dbo.Drivers
DELETE FROM  dbo.Teams
DELETE FROM  dbo.CarSeason
DELETE FROM  dbo.Car
DELETE FROM  dbo.[DriverTeam]
DELETE FROM  dbo.[Season]

select * from dbo.Drivers  
select * from dbo.Teams  
select * from [dbo].[DriverTeam]
select * from [dbo].[Season]
select * From  dbo.CarSeason



