using System.Diagnostics;
using F1WebSite.Models;
using Microsoft.AspNetCore.Mvc;
using F1WebSite.Database;
using F1WebSite.ViewModels;

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

           // List<Team> teams  = _dbAccess.GetTeamsList();
            List<Drivers> driversList = _dbAccess.GetDriverList();


            var model = new TeamsViewModel
            {
                //Teams = teams,
                Drivers = driversList,
            };

            return View(model);
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
        public IActionResult Drivers()
        {
            List<Drivers> driversList = _dbAccess.GetDriverList();


            var model = new TeamsViewModel
            {
                //Teams = teams,
                Drivers = driversList,
            };

            return View(model);
        }
        public IActionResult Gaming()
        {
            return View();
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
