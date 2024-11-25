insert into [dbo].[Season]
values (2024)

insert into dbo.Drivers
values 
('','Bellini'),
('Marco','Angelini'),
('Anrea','Ponghellini')

INSERT INTO dbo.Car
VALUES ('W24',NULL);

INSERT INTO dbo.CarSeason ([Car],[Season])
select
	(select Id from dbo.Car WHERE name = 'W24' ),(select Id from dbo.Season WHERE [year] = 2024)

insert into dbo.Teams (Id,[name])
values
(1,'Ferrari'),
(2,'Redbull'),
(3,'Mercedes')


insert into [dbo].[DriverTeam] ([Driver],[Team],[CarSeason])
select 
	(select Id from dbo.Drivers WHERE Name = 'Giangi' AND surname = 'Bellini'), 
	1, 
	(select Id from dbo.CarSeason WHERE Season =(select Id from dbo.Season WHERE [Year] = 2024))  UNION
select 
	(select Id from dbo.Drivers WHERE Name = 'Marco' AND surname = 'Angelini'), 
	1, 
	(select Id from dbo.CarSeason WHERE Season =(select Id from dbo.Season WHERE [Year] = 2024))  UNION
select 
	(select Id from dbo.Drivers WHERE Name = 'Andrea' AND surname = 'Ponghellini'), 
	1, 
	(select Id from dbo.CarSeason WHERE Season =(select Id from dbo.Season WHERE [Year] = 2024))

--DELETE FROM  dbo.Drivers
--DELETE FROM  dbo.Teams
--DELETE FROM  dbo.CarSeason
--DELETE FROM  dbo.Car
--DELETE FROM  dbo.[DriverTeam]
--DELETE FROM  dbo.[Season]

select * from dbo.Drivers  
select * from dbo.Teams  
select * from [dbo].[DriverTeam]
select * from [dbo].[Season]
select * From  dbo.CarSeason



