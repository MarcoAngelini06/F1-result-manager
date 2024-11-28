using F1WebSite.Models;
using Microsoft.Data.SqlClient;
using Dapper;
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
        public void InsertNewTeam(Team team)
        {
            var teams = new List<Team>();

            string query = "INSERT INTO dbo.Teams VALUE (@name,@totPoints,@teamColor)";

            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Execute(query, new { team.TeamName, team.totPoints, team.teamColor});
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
