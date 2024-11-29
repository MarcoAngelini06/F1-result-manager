using F1WebSite.Models;

namespace F1WebSite.ViewModels
{
    public class DriversViewModel
    {
        public List<Drivers> Drivers { get; set; }
        public List<Team> Teams { get; set; }
        public List<Tracks> Tracks { get; set; }
        public List<Races> Races { get; set; }

    }
}
