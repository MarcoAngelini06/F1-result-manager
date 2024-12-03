using F1WebSite.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using static System.Runtime.InteropServices.JavaScript.JSType;
namespace F1WebSite.Database
{
    public class DBAccess
    {
        private readonly string _connectionString;

        public DBAccess(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public List<Drivers> GetDriverList()
        {
            var drivers = new List<Drivers>();

            string query = @"
SELECT Distinct Drivers.ID,Drivers.[name], Drivers.surname, Drivers.number, Drivers.nationality, Teams.teamId,DriverTeam.DriverTeamId
FROM Teams
LEFT JOIN DriverTeam ON Teams.teamId = DriverTeam.Team
LEFT JOIN Drivers ON DriverTeam.Driver = Drivers.Id";
            using (var conn = new SqlConnection(_connectionString))
            {
                drivers = conn.Query<Drivers>(query).ToList();
            }
            return drivers;
        }

        public List<Team> GetTeamList()
        {
            var teams = new List<Team>();

            string query = @"
SELECT DISTINCT
    Teams.teamId,
    Teams.TeamName, 
    Teams.TeamColor
FROM [F1].[dbo].[Teams];";
            using (var conn = new SqlConnection(_connectionString))
            {
                teams = conn.Query<Team>(query).ToList();
            }
            return teams;
        }
        public List<DriverTeam> GetDriverTeams()
        {
            var driverTeam = new List<DriverTeam>();
            string query = @"
SELECT DISTINCT
    DriverTeam.DriverTeamId,
    Teams.teamId,
	DriverTeam.driver,
    DriverTeam.season,
    DriverTeam.points
FROM [F1].[dbo].[Teams] LEFT JOIN DriverTeam ON(Teams.teamId=DriverTeam.Team);";
            using (var conn = new SqlConnection(_connectionString))
            {
                driverTeam = conn.Query<DriverTeam>(query).ToList();
            }
            return driverTeam;
        }
        public List<Tracks> GetTracksList()
        {
            var tracks = new List<Tracks>();
            string query = @"
SELECT DISTINCT
Tracks.trackId,
 Tracks.[name],
Tracks.city,
Tracks.country,
Tracks.layout
FROM Tracks;";
            using (var conn = new SqlConnection(_connectionString))
            {
                tracks = conn.Query<Tracks>(query).ToList();
            }
            return tracks;
        }
        public List<Races> GetRaceList()
        {
            var races = new List<Races>();
            string query = @"
SELECT DISTINCT
Races.Id,
Races.[name],
Races.date,
Races.laps,
Tracks.trackId,
Races.season
FROM Races INNER JOIN Tracks ON(Tracks.trackId=Races.Track);";
            using (var conn = new SqlConnection(_connectionString))
            {
                races = conn.Query<Races>(query).ToList();
            }
            return races;
        }
        public List<Season> GetSeasonList()
        {
            var seasons = new List<Season>();
            string query = @"
SELECT Season.seasonId,Season.year
FROM Season;";
            using (var conn = new SqlConnection(_connectionString))
            {
                seasons = conn.Query<Season>(query).ToList();
            }
            return seasons;
        }
        public List<Result> GetResults()
        {
            var results = new List<Result>();
            string query = @"
SELECT 
    resultId,
    DriverTeam,
    finishingPosition,
    finishingTime,
    laps,
    nPitSops,
    points
FROM Results;";

            using (var conn = new SqlConnection(_connectionString))
            {
                results = conn.Query<Result>(query).ToList();
            }

            return results;
        }
        public List<RaceResult> GetRaceResult()
        {
            var results = new List<RaceResult>();
            string query = @"
SELECT 
    Id,
    race,
    result
FROM RaceResult;"; 

            using (var conn = new SqlConnection(_connectionString))
            {
                results = conn.Query<RaceResult>(query).ToList();
            }

            return results;
        }


        public void InsertNewTeam(string teamName)
        {
            
                Team newTeam = new Team
                {
                    TeamName = teamName,
                    
                };
            string query = "INSERT INTO Teams (TeamName) VALUES (@TeamName)";
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Execute(query, new { TeamName = newTeam.TeamName });
            }
        }

        public void InsertNewRace(string name, string date, int laps,int track,int seasonId)
        {

            string query = "INSERT INTO Races (name, date, Laps, Track,season) VALUES (@RaceName, @RaceDate, @Laps, @Track,@SeasonId)";
            var newRace = new
            {
                RaceName = name,
                RaceDate = date,
                Laps = laps,
                Track = track,
                SeasonId=seasonId
            };
            // Execute the query
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Execute(query, newRace);
            }
        }
        
        public void InsertNewDriver(Drivers driver,int seasonId)
        {
            string query = "INSERT INTO Drivers (name, surname, number, nationality) VALUES (@name, @surname, @Number, @Nationality)";
            string queryGetId = @"
SELECT TOP 1 Drivers.Id
FROM Drivers
ORDER BY Drivers.Id DESC;";
            string queryTeam = "INSERT INTO DriverTeam (driver,team,season) VALUES (@driver, @team,@Season)";

            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Execute(query, new//inserting new driver into driver table
                {
                    Name = driver.name,
                    Surname = driver.surname,
                    Number = driver.Number,
                    Nationality = driver.Nationality,
                });
                var driverResult = conn.QueryFirstOrDefault<int>("SELECT TOP 1 Id FROM Drivers ORDER BY Id DESC");
                //getting the ID that is asigned to it 
                conn.Execute(queryTeam, new//updating the Driver/Team table
                {
                        driver = driverResult,
                        team = driver.teamId,
                        Season = seasonId
                        
                    });
            }     
        }
        public void InsertNewResult(int driverTeamId, int nPitStops, int laps, int finishingPosition,int points)
        { 
            string query = "INSERT INTO Results (DriverTeam, finishingPosition, laps, nPitSops,points) VALUES ( @DriverTeam, @FinishingPosition, @Laps, @NPitStops,@Ppoints)";
            var newResult = new
            {
                DriverTeam = driverTeamId,
                FinishingPosition = finishingPosition,
                Laps = laps,
                NPitStops = nPitStops,
                Ppoints = points
            };
            List<DriverTeam> driverTeamList = GetDriverTeams();
            DriverTeam currDT = driverTeamList.FirstOrDefault(d => d.driverTeamId == driverTeamId);
            currDT.points = currDT.points + points;

            string queryUpdate = "UPDATE DriverTeam SET points = @Points WHERE driverTeamId=@ID;";
            var updateDriverTeam = new
            {
                Points = currDT.points,
                ID = driverTeamId,
            };
            using (var conn = new SqlConnection(_connectionString))
            {

                conn.Execute(query, newResult);
                conn.Execute(queryUpdate,updateDriverTeam);
            }
        }
        public void InsertNewRaceResult(int raceId)
        {
            
            string query = "INSERT INTO RaceResult (race,result) VALUES (@race, @result)";

            using (var conn = new SqlConnection(_connectionString))
            {
                var resultId = conn.QueryFirstOrDefault<int>("SELECT TOP 1 Results.resultId FROM Results ORDER BY Results.resultId DESC;");

                conn.Execute(query, new//inserting new driver into driver table
                {
                    race = raceId,
                    result=resultId,
                });
               
            }
        }
        public void RemoveTeam(string teamName)
        {
            string query = "DELETE FROM Teams WHERE TeamName = @teamName;";

            using (var conn = new SqlConnection(_connectionString))
            {
               
                conn.Execute(query, new { teamName }); 
            }
        }


    }
}
