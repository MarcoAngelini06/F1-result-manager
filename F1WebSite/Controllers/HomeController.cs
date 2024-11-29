using System.Diagnostics;
using F1WebSite.Models;
using Microsoft.AspNetCore.Mvc;
using F1WebSite.Database;
using F1WebSite.ViewModels;
using System.Reflection;

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
            _dbAccess.InsertNewRace(name, date, laps, trackId);

            List<Tracks> tracksList = _dbAccess.GetTracksList();
            List<Races> racesList = _dbAccess.GetRaceList();
            var model = new DriversViewModel
            {
                Tracks = tracksList,
                Races = racesList,
            };

            return View("Race",model);
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

            var model = new DriversViewModel
            {
                Tracks = tracksList,
                Races = racesList,
            };

            return View(model);
        }
        public IActionResult liveTiming()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
