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
        public List<Team> GetTeamsList()
        {
            var teams = new List<Team>();

            //            string query = 
            //@"select  distinct t.[Id],[name],[totPoints],[teamColor], [isDeletable]  = CASE WHEN Dt.id is null then 1 else 0 end
            //from Teams t left join  DriverTeam dt on dt.Team = t.Id";  
            string query = @"
SELECT 
    Teams.[Id], 
    Teams.[name], 
    Teams.[totPoints], 
    Teams.[teamColor], 
    STRING_AGG(Drivers.[name], ', ') AS DriverNames, -- Combines driver names into one field
    [isDeletable] = CASE WHEN DriverTeam.Id IS NULL THEN 1 ELSE 0 END
FROM 
    Teams
INNER JOIN 
    DriverTeam ON Teams.Id = DriverTeam.Team
INNER JOIN 
    CarSeason ON DriverTeam.CarSeason = CarSeason.Id
INNER JOIN 
    Season ON CarSeason.Season = Season.Id
INNER JOIN 
    Drivers ON DriverTeam.Driver = Drivers.Id
INNER JOIN 
    Car ON CarSeason.Car = Car.Id
WHERE 
    Season.year = 2024
GROUP BY 
    Teams.[Id], Teams.[name], Teams.[totPoints], Teams.[teamColor], DriverTeam.Id
ORDER BY 
    Teams.totPoints DESC;";

            using (var conn = new SqlConnection(_connectionString))
            {
                teams = conn.Query<Team>(query).ToList();
            }
            return teams;
        }
        public List<Drivers> GetDriverList()
        {
            var drivers = new List<Drivers>();

            string query = @"
SELECT Distinct Drivers.[name], Drivers.surname, Teams.[name]
FROM Teams
INNER JOIN DriverTeam ON Teams.Id = DriverTeam.Team
INNER JOIN CarSeason ON DriverTeam.CarSeason = CarSeason.Id
INNER JOIN Season ON CarSeason.season = Season.Id
INNER JOIN Drivers ON DriverTeam.Driver = Drivers.Id
INNER JOIN Car ON CarSeason.car = Car
WHERE Season.[year]='2024';";
            using (var conn = new SqlConnection(_connectionString))
            {
                drivers = conn.Query<Drivers>(query).ToList();
            }
            return drivers;
        }

        public void InsertNewTeam(Team team)
        {
            var teams = new List<Team>();

            string query = "INSERT INTO dbo.Teams VALUE (@name,@totPoints,@teamColor)";

            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Execute(query, new { team.name, team.totPoints, team.teamColor});
            }
        }
    }
}
