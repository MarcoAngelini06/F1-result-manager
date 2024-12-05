using F1WebSite.Models;

namespace F1WebSite.ViewModels
{
    public class DriversViewModel
    {
        public List<Drivers> Drivers { get; set; }
        public Drivers NewDriver { get; set; }
        public List<Team> Teams { get; set; }
        public List<Tracks> Tracks { get; set; }
        public List<Races> Races { get; set; }
        public List<Season> Seasons { get; set; }
        public List<RaceResult> RaceResults { get; set; }
        public List<Result> Results { get; set; }
        public List<DriverTeam> DriverTeams {  get; set; }
        public int RaceId { get; set; }


        public string AddRaceCommandLink()
            => "Races/Add";
    }
}
