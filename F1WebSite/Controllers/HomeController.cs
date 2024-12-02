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
            foreach (DriverTeam d in driverTeamList) 
            {
                if (d.driver == null)
                {
                    Team currentTeam = teamsList.FirstOrDefault(t => t.teamId == d.teamId);
                    currentTeam.isDeletable = true;
                }
            }
            var model = new DriversViewModel
            {
                Drivers = driversList,
                Teams = teamsList,
            };

            return View(model);
        }
        public IActionResult RemoveTeam(string teamName)
        {
            _dbAccess.RemoveTeam(teamName);

            List<Drivers> driversList = _dbAccess.GetDriverList();
            List<DriverTeam> driverTeamList = _dbAccess.GetDriverTeams();
            List<Team> teamsList = _dbAccess.GetTeamList();
            foreach (DriverTeam d in driverTeamList)
            {
                if (d.driver == null)
                {
                    Team currentTeam = teamsList.FirstOrDefault(t => t.teamId == d.teamId);
                    currentTeam.isDeletable = true;
                }
            }
            var model = new DriversViewModel
            {
                Drivers = driversList,
                Teams = teamsList,
            };

            return View("Teams", model);
        }

        [HttpGet]
        public IActionResult AddTeam(string teamName)
        {
            _dbAccess.InsertNewTeam(teamName);

            List<Drivers> driversList = _dbAccess.GetDriverList();
            List<DriverTeam> driverTeamList = _dbAccess.GetDriverTeams();
            List<Team> teamsList = _dbAccess.GetTeamList();
            foreach (DriverTeam d in driverTeamList)
            {
                if (d.driver == null)
                {
                    Team currentTeam = teamsList.FirstOrDefault(t => t.teamId == d.teamId);
                    currentTeam.isDeletable = true;
                }
            }
            var model = new DriversViewModel
            {
                Drivers = driversList,
                Teams = teamsList,
            };

            return View("Teams", model);
        }
        [HttpGet]
        public IActionResult AddDriver(string name, string surname, string number, string nationality, int teamID)
        {
            Drivers driverToAdd= new Drivers();
            driverToAdd.name = name;
            driverToAdd.surname = surname;
            driverToAdd.Nationality = nationality;
            driverToAdd.Number = number;
            driverToAdd.teamId = teamID;
            _dbAccess.InsertNewDriver(driverToAdd);

            List<Drivers> driversList = _dbAccess.GetDriverList();
            List<DriverTeam> driverTeamList = _dbAccess.GetDriverTeams();
            List<Team> teamsList = _dbAccess.GetTeamList();
            foreach (DriverTeam d in driverTeamList)
            {
                if (d.driver == null)
                {
                    Team currentTeam = teamsList.FirstOrDefault(t => t.teamId == d.teamId);
                    currentTeam.isDeletable = true;
                }
            }
            var model = new DriversViewModel
            {
                Drivers = driversList,
                Teams = teamsList,
            };

            return View("Drivers", model);
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

            var model = new DriversViewModel
            {
                Tracks = tracksList,
                Races = racesList,
                Seasons = seasonsList,
            };

            return View("races",model);
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
        public IActionResult Results()
        {
            return View();
        }
        public IActionResult Drivers(int? teamId)
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
        public IActionResult Races()
        {

            List<Tracks> tracksList = _dbAccess.GetTracksList();
            List<Races> racesList = _dbAccess.GetRaceList();
            List<Season> seasonsList= _dbAccess.GetSeasonList();
     
            var model = new DriversViewModel
            {
                Tracks = tracksList,
                Races = racesList,
                Seasons = seasonsList,
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

            RaceResult currRaceResult = RaceResultsList.FirstOrDefault(d => d.race == Id);//

            List<int> availablePositions = Enumerable.Range(1, driversList.Count).ToList();
            if (currRaceResult == null || currRaceResult.result == null)
            {
                Random random = new Random();

                foreach (Drivers driver in driversList)
                {
                    if(driver.name!=null)
                    {
                        Result currentResult = new Result();
                        currentResult.DriverTeam = driver.DriverTeamId;
                        currentResult.NPitStops = random.Next(1, 4);
                        Races currentRace = racesList.FirstOrDefault(r => r.Id == Id);
                        if (currentRace.laps > 0)
                            currentResult.Laps = random.Next(1, currentRace.laps);

                        int randomIndex = random.Next(0, availablePositions.Count);
                        currentResult.FinishingPosition = availablePositions[randomIndex];
                        availablePositions.RemoveAt(randomIndex);

                        _dbAccess.InsertNewResult(driver.DriverTeamId, currentResult.NPitStops, currentResult.Laps, currentResult.FinishingPosition);
                        _dbAccess.InsertNewRaceResult(Id);
                    }
                }
                
            }
                results = _dbAccess.GetResults();
                RaceResultsList = _dbAccess.GetRaceResult();
            var sortedRaceResults = RaceResultsList.Where(r => r.race == Id).OrderBy(r => results.FirstOrDefault(res => res.resultId == r.result)?.FinishingPosition)
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
                DriverTeam = driverTeamList,
                RaceId = Id
            };
                return View("RaceResults", model);
            
        }
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        
    }
}
