namespace F1WebSite.Models
{
    public class Result
    {
        public int resultId { get; set; }
        public int DriverTeam { get; set; } // Team and driver details
        public int FinishingPosition { get; set; } // Finishing position in the race
        public string FinishingTime { get; set; } // Time taken to finish the race
        public int Laps { get; set; } // Number of laps completed
        public int NPitStops { get; set; } // Number of pit stops made
        public int Points { get; set; }
    }
}
