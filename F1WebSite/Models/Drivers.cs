namespace F1WebSite.Models
{
    public class Drivers
    {
        public int Id {  get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string Number { get; set; }
        public string Nationality { get; set; }
        public int teamId { get; set; }
        public int DriverTeamId {  get; set; }
        
    }
}
