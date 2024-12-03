using System.Diagnostics;
using F1WebSite.Models;
using Microsoft.AspNetCore.Mvc;
using F1WebSite.Database;
using F1WebSite.ViewModels;
using System.Reflection;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace F1WebSite.Controllers
{
    public class HomeController : Controller
    {

        private readonly ILogger<HomeController> _logger;
        private readonly DBAccess _dbAccess;
        public HomeController(ILogger<HomeController> logger, DBAccess dbAccess)
        {
            _logger = logger;
            _dbAccess = dbAccess;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Teams()
        {

            List<Drivers> driversList = _dbAccess.GetDriverList();
            List<DriverTeam> driverTeamList = _dbAccess.GetDriverTeams();
            List<Team> teamsList = _dbAccess.GetTeamList();
            foreach (DriverTeam d in driverTeamList) //checking if the team has relations, if it doesn't it is deletable
            {
                if (d.driver == 0)
                {
                    Team currentTeam = teamsList.FirstOrDefault(t => t.teamId == d.teamId);
                    currentTeam.isDeletable = true;
                }
            }
            var model = new DriversViewModel
            {
                Drivers = driversList,//asigning values to the lists in the viewModel
                Teams = teamsList,
                DriverTeams = driverTeamList,
            };

            return View(model);
        }
        public IActionResult RemoveTeam(string teamName)
        {
            _dbAccess.RemoveTeam(teamName);
            return RedirectToAction("Teams"); // Redirect to the Teams action to refresh the page
        }

        [HttpGet]
        public IActionResult AddTeam(string teamName)
        {
            _dbAccess.InsertNewTeam(teamName);

            return RedirectToAction("Teams"); // Redirect to the Teams action to refresh the page
        }
        public IActionResult Drivers()
        {
            List<Drivers> driversList = _dbAccess.GetDriverList();
            List<Team> teamsList = _dbAccess.GetTeamList();
            List<Season> seasonList = _dbAccess.GetSeasonList();

            var model = new DriversViewModel
            {
                Drivers = driversList,
                Teams = teamsList,
                Seasons = seasonList,
            };

            return View(model);
        }
        [HttpGet]
        public IActionResult AddDriver(string name, string surname, string number, string nationality, int teamID,int seasonId)
        {
            Drivers driverToAdd= new Drivers();
            driverToAdd.name = name;
            driverToAdd.surname = surname;
            driverToAdd.Nationality = nationality;
            driverToAdd.Number = number;
            driverToAdd.teamId = teamID;
            _dbAccess.InsertNewDriver(driverToAdd,seasonId);
            return RedirectToAction("Drivers"); // Redirect to the Teams action to refresh the page
        }

        public IActionResult Races()
        {

            List<Tracks> tracksList = _dbAccess.GetTracksList();
            List<Races> racesList = _dbAccess.GetRaceList();
            List<Season> seasonsList = _dbAccess.GetSeasonList();

            var model = new DriversViewModel
            {
                Tracks = tracksList,
                Races = racesList,
                Seasons = seasonsList,
            };

            return View(model);
        }
        [HttpGet]
        public IActionResult AddRace(string name, string date, int laps,int trackId)
        {

            List<Tracks> tracksList = _dbAccess.GetTracksList();
            List<Races> racesList = _dbAccess.GetRaceList();
            List<Season> seasonsList = _dbAccess.GetSeasonList();
            string dateWithYearOnly = date.Substring(0, 4);
            Season currentSeason = seasonsList.FirstOrDefault(s => s.year == dateWithYearOnly);
            _dbAccess.InsertNewRace(name, date, laps, trackId,currentSeason.seasonId);
            seasonsList = _dbAccess.GetSeasonList();
            racesList = _dbAccess.GetRaceList();

            var model = new DriversViewModel
            {
                Tracks = tracksList,
                Races = racesList,
                Seasons = seasonsList,
            };

            return RedirectToAction("Races"); // Redirect to the Teams action to refresh the page
        }
        public IActionResult Video()
        {
            return View();
        }
        public IActionResult Latest()
        {
            return View();
        }
        public IActionResult F1Unlocked()
        {
            return View();
        }
        public IActionResult Schedule()
        {
            return View();
        }


        public IActionResult DriverTeam(int? teamId)
        {
            List<Drivers> driversList = _dbAccess.GetDriverList();
            List<Team> teamsList = _dbAccess.GetTeamList();


            if (teamId.HasValue)
            {
                driversList = driversList.Where(d => d.teamId == teamId.Value).ToList();
            }
            var model = new DriversViewModel
            {
                Drivers = driversList,
                Teams = teamsList,
            };

            return View(model);
        }
        
        public IActionResult liveTiming()
        {
            return View();
        }
        public IActionResult Result(int Id)
        {
            List<Tracks> tracksList = _dbAccess.GetTracksList();
            List<Races> racesList = _dbAccess.GetRaceList();
            List<Season> seasonsList = _dbAccess.GetSeasonList();
            List<Drivers> driversList = _dbAccess.GetDriverList();
            List<DriverTeam> driverTeamList = _dbAccess.GetDriverTeams();
            List<Team> teamsList = _dbAccess.GetTeamList();
            List<Result> results = _dbAccess.GetResults();
            List<RaceResult> RaceResultsList = _dbAccess.GetRaceResult();

            RaceResult RaceResultMatch = RaceResultsList.FirstOrDefault(d => d.race == Id);
            Random random = new Random();

            if (RaceResultMatch == null)//creating new results only if there aren't any
            {
                Races currentRace = racesList.FirstOrDefault(r => r.Id == Id);
                List<Drivers> availableDrivers = new List<Drivers>();
                List<int> points = new List<int> { 0, 25, 18, 15, 12, 10, 8, 6, 4, 2, 1 };

                foreach (Drivers driver in driversList)// selecting only the drivers in the same season as the race
                {
                    DriverTeam currentDriverTeam = driverTeamList.FirstOrDefault(d => d.driverTeamId == driver.DriverTeamId);

                    if (driver.name != null && currentDriverTeam.season == currentRace.season) 
                    {
                        availableDrivers.Add(driver);
                    }
                    
                }
                availableDrivers = availableDrivers.OrderBy(x => random.Next()).ToList();//shuffling the order
                int i = 1;
                foreach (Drivers d in availableDrivers)//asigning the result to each driver
                {
                    Result currentResult = new Result();
                    currentResult.DriverTeam = d.DriverTeamId;
                    currentResult.NPitStops = random.Next(1, 4);
                    currentResult.FinishingPosition = i;
                    if(i<=10)
                        currentResult.Points = points[i];

                        currentResult.Laps = currentRace.laps;

                        // Insert the result into the database
                        _dbAccess.InsertNewResult(d.DriverTeamId, currentResult.NPitStops, currentResult.Laps, currentResult.FinishingPosition,currentResult.Points);
                    _dbAccess.InsertNewRaceResult(Id);
                    i++;
                }
            }

            results = _dbAccess.GetResults();
            RaceResultsList = _dbAccess.GetRaceResult();
            var sortedRaceResults = RaceResultsList.Where(r => r.race == Id)
                .OrderBy(r => results.FirstOrDefault(res => res.resultId == r.result)?.FinishingPosition)
                .ToList();

            var model = new DriversViewModel
            {
                Tracks = tracksList,
                Races = racesList,
                Seasons = seasonsList,
                Drivers = driversList,
                Teams = teamsList,
                Results = results,
                RaceResults = sortedRaceResults,
                DriverTeams = driverTeamList,
                RaceId = Id
            };
                return View("RaceResults", model);
            
        }
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult itsalltodrivefor()
        {
            return View();
        }
        public IActionResult whatisf1()
        {
            return View();
        }
        public IActionResult F1tv()
        {
            return View();
        }
        public IActionResult GetInvolved()
        {
            return View();
        }


    }
}
