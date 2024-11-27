namespace F1WebSite.Models
{
    public class Team
    {
        public int Id { get; set; }
        public string TeamName { get; set; }
        public int totPoints { get; set; }
        public string teamColor { get; set; }

        public string DriverName { get; set; }

        public bool isDeletable { get; set; }
    }
}
