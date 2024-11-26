INSERT INTO [dbo].[Season] ([Year])
VALUES 
(2024),
(2023),
(2022),
(2021),
(2020),
(2019),
(2018),
(2017),
(2016),
(2015),
(2014),
(2013),
(2012),
(2011),
(2010),
(2009),
(2008),
(2007),
(2006),
(2005),
(2004),
(2003),
(2002),
(2001),
(2000),
(1999),
(1998),
(1997),
(1996),
(1995),
(1994),
(1993),
(1992),
(1991),
(1990),
(1989),
(1988),
(1987),
(1986),
(1985),
(1984),
(1983),
(1982),
(1981),
(1980),
(1979),
(1978),
(1977),
(1976),
(1975),
(1974),
(1973),
(1972),
(1971),
(1970);


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

INSERT INTO dbo.Tracks([name],city,country,layout)
VALUES
('Monza Circuit', 'Monza', 'Italy', NULL),
('Silverstone Circuit', 'Silverstone', 'United Kingdom', NULL),
('Circuit de Monaco', 'Monte Carlo', 'Monaco', NULL),
('Spa-Francorchamps', 'Stavelot', 'Belgium', NULL),
('Suzuka Circuit', 'Suzuka', 'Japan', NULL),
('Circuit Gilles Villeneuve', 'Montreal', 'Canada', NULL),
('Interlagos', 'São Paulo', 'Brazil', NULL),
('Imola Circuit', 'Imola', 'Italy', NULL),
('Hungaroring', 'Mogyoród', 'Hungary', NULL),
('Red Bull Ring', 'Spielberg', 'Austria', NULL),
('Zandvoort Circuit', 'Zandvoort', 'Netherlands', NULL),
('Circuit of the Americas', 'Austin', 'United States', NULL),
('Albert Park Circuit', 'Melbourne', 'Australia', NULL),
('Bahrain International Circuit', 'Sakhir', 'Bahrain', NULL),
('Shanghai International Circuit', 'Shanghai', 'China', NULL),
('Marina Bay Street Circuit', 'Singapore', 'Singapore', NULL),
('Yas Marina Circuit', 'Abu Dhabi', 'United Arab Emirates', NULL),
('Jeddah Corniche Circuit', 'Jeddah', 'Saudi Arabia', NULL),
('Las Vegas Street Circuit', 'Las Vegas', 'United States', NULL),
('Miami International Autodrome', 'Miami', 'United States', NULL),
('Hockenheimring', 'Hockenheim', 'Germany', NULL),
('Nürburgring', 'Nürburg', 'Germany', NULL),
('Kyalami', 'Midrand', 'South Africa', NULL),
('Circuit Paul Ricard', 'Le Castellet', 'France', NULL),
('Sepang International Circuit', 'Sepang', 'Malaysia', NULL),
('Istanbul Park', 'Istanbul', 'Turkey', NULL),
('Valencia Street Circuit', 'Valencia', 'Spain', NULL),
('Indianapolis Motor Speedway', 'Indianapolis', 'United States', NULL),
('Sochi Autodrom', 'Sochi', 'Russia', NULL),
('Magny-Cours', 'Magny-Cours', 'France', NULL),
('Adelaide Street Circuit', 'Adelaide', 'Australia', NULL),
('Aida Circuit', 'Aida', 'Japan', NULL),
('Baku City Circuit', 'Baku', 'Azerbaijan', NULL),
('Las Vegas Street Circuit', 'Las Vegas', 'United States', NULL),
('Phoenix Street Circuit', 'Phoenix', 'United States', NULL),
('Dallas Street Circuit', 'Dallas', 'United States', NULL),
('Long Beach Street Circuit', 'Long Beach', 'United States', NULL),
('Detroit Street Circuit', 'Detroit', 'United States', NULL),
('Watkins Glen International', 'Watkins Glen', 'United States', NULL),
('Zolder Circuit', 'Heusden-Zolder', 'Belgium', NULL),
('Buenos Aires Circuit', 'Buenos Aires', 'Argentina', NULL),
('Jarama Circuit', 'San Sebastián de los Reyes', 'Spain', NULL),
('Estoril Circuit', 'Estoril', 'Portugal', NULL),
('Jerez Circuit', 'Jerez de la Frontera', 'Spain', NULL),
('Fuji Speedway', 'Oyama', 'Japan', NULL),
('Okayama International Circuit', 'Mimasaka', 'Japan', NULL),
('Dijon-Prenois Circuit', 'Dijon', 'France', NULL),
('Riverside International Raceway', 'Riverside', 'United States', NULL),
('Las Vegas (Caesars Palace)', 'Las Vegas', 'United States', NULL),
('Reims-Gueux Circuit', 'Reims', 'France', NULL),
('Montjuïc Circuit', 'Barcelona', 'Spain', NULL),
('Rouen-Les-Essarts', 'Rouen', 'France', NULL),
('Ain-Diab Circuit', 'Casablanca', 'Morocco', NULL),
('Pedralbes Circuit', 'Barcelona', 'Spain', NULL),
('Pescara Circuit', 'Pescara', 'Italy', NULL),
('Clermont-Ferrand Circuit', 'Clermont-Ferrand', 'France', NULL),
('Osterreichring', 'Spielberg', 'Austria', NULL),
('Las Vegas Grand Prix Circuit', 'Las Vegas', 'United States', NULL);

INSERT INTO dbo.Races (season, track, date)
VALUES
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2005), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Bahrain International Circuit'), '2005-03-06'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2010), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Monza Circuit'), '2010-09-12'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2020), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Silverstone Circuit'), '2020-08-02'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2015), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Circuit of the Americas'), '2015-10-25'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2000), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Suzuka Circuit'), '2000-10-08'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1995), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Circuit de Monaco'), '1995-05-28'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2018), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Spa-Francorchamps'), '2018-08-26'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1990), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Interlagos'), '1990-03-25'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2008), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Hungaroring'), '2008-08-03'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1998), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Albert Park Circuit'), '1998-03-08'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2021), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Zandvoort Circuit'), '2021-09-05'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1987), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Adelaide Street Circuit'), '1987-11-15'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1999), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Sepang International Circuit'), '1999-10-17'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2022), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Yas Marina Circuit'), '2022-11-20'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1980), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Kyalami'), '1980-03-01'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2003), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Shanghai International Circuit'), '2003-10-12'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1985), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Estoril Circuit'), '1985-04-21'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1975), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Watkins Glen International'), '1975-10-05'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2019), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Baku City Circuit'), '2019-04-28'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1997), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Nürburgring'), '1997-09-28'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1982), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Circuit Paul Ricard'), '1982-07-25'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2002), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Indianapolis Motor Speedway'), '2002-09-29'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1984), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Dallas Street Circuit'), '1984-07-08'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2001), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Hockenheimring'), '2001-07-29'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2013), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Marina Bay Street Circuit'), '2013-09-22'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1993), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Magny-Cours'), '1993-07-04'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 1972), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Rouen-Les-Essarts'), '1972-07-02'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2017), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Las Vegas Street Circuit'), '2017-11-12'),
((SELECT TOP 1 Id FROM dbo.Season WHERE [Year] = 2007), (SELECT TOP 1 Id FROM dbo.Tracks WHERE name = 'Fuji Speedway'), '2007-09-30');


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



INSERT INTO Car (immage)
SELECT BulkColumn 
FROM OPENROWSET(BULK 'C:\Users\stage\Downloads\wiliams.png', SINGLE_BLOB) AS img;

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;