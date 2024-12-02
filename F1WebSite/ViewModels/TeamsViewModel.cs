using F1WebSite.Models;

namespace F1WebSite.ViewModels
{
    public class TeamsViewModel
    {
        public List<Team> Teams { get; set; }
        public List<Team> DriverTeam { get; set; }
        public List<Drivers> Drivers { get; set; }
    }
}
