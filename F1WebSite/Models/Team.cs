namespace F1WebSite.Models
{
    public class Team
    {
        public int teamId { get; set; }
        public string TeamName { get; set; }
        public int totPoints { get; set; }
        public string teamColor { get; set; }
        public bool isDeletable { get; set; }
    }
}
