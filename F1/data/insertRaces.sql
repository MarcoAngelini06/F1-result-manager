SELECT DISTINCT  Teams.[name], Teams.totPoints
FROM Teams INNER JOIN(
	DriverTeam inner join(
		CarSeason inner join Season ON(
			CarSeason.season=Season.Id))
			ON(DriverTeam.CarSeason = CarSeason.Id) 
			ON(DriverTeam.Driver = Drivers.Id)
			)ON(Teams.Id=DriverTeam.Team)
WHERE Season.year ='2024' ORDER BY Teams.totPoints DESC;
