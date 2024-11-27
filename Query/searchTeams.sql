SELECT DISTINCT Teams.[name], Teams.totPoints,Drivers.[name],Drivers.[surname]
FROM Teams
INNER JOIN DriverTeam ON Teams.Id = DriverTeam.Team
INNER JOIN CarSeason ON DriverTeam.CarSeason = CarSeason.Id
INNER JOIN Season ON CarSeason.season = Season.Id
INNER JOIN Drivers ON DriverTeam.Driver = Drivers.Id
INNER JOIN Car ON CarSeason.car = Car

WHERE Season.year = '2024'
ORDER BY Teams.totPoints DESC;
