namespace F1WebSite.Models
{
    public class Races
    {
        public int Id { get; set; }
        public string name { get; set; }
        public string date { get; set; }
        public int laps { get; set; }
        public int trackId {  get; set; }
        public int season { get; set; }
    }
}
