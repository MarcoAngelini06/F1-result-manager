using F1WebSite.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Microsoft.AspNetCore.Mvc;
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
SELECT Distinct Drivers.[name], Drivers.surname, Drivers.number, Drivers.nationality, Teams.teamId
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
    Teams.teamId,
	DriverTeam.driver
FROM [F1].[dbo].[Teams] LEFT JOIN DriverTeam ON(Teams.teamId=DriverTeam.Team);";
            using (var conn = new SqlConnection(_connectionString))
            {
                driverTeam = conn.Query<DriverTeam>(query).ToList();
            }
            return driverTeam;
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

        public void InsertNewDriver(Drivers driver)
        {
            string query = "INSERT INTO Drivers (name, surname, number, nationality) VALUES (@name, @surname, @Number, @Nationality)";
            string queryGetId = @"
SELECT TOP 1 Drivers.Id
FROM Drivers
ORDER BY Drivers.Id DESC;";
            string queryTeam = "INSERT INTO DriverTeam (driver,team) VALUES (@driver, @team)";

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
