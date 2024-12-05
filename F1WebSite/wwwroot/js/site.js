function filterRaces() {
    const selectedSeason = document.getElementById("seasonTG").value;
    const raceCards = document.querySelectorAll(".race-card");

    raceCards.forEach(card => {
        const raceSeason = card.getAttribute("data-season");
        if (selectedSeason === "" || raceSeason === selectedSeason) {
            card.style.display = "block"; // Show the card
        } else {
            card.style.display = "none"; // Hide the card
        }
    });
}
function togglePopup() {
    document.getElementById("myPopup").style.display = "block";
    document.querySelector(".overlay").style.display = "block";
}

function submitDriver() {
    var driver = {
        name: document.getElementById('nameOfDriver').value,
        surname: document.getElementById('surnameOfDriver').value,
        number: document.getElementById('number').value,
        nationality: document.getElementById('nationality').value,
        teamId: document.getElementById('team').value,
        seasonId: document.getElementById('season').value

    };

    if (!driver.name || !driver.surname || !driver.number || !driver.nationality || !driver.teamId) {
        alert("All fields are required!");
        return;
    }


    var url = '@Url.Action("AddDriver", "Home")' +   //sends all the data to the home controller wich adds the driver to the DB
        '?name=' + encodeURIComponent(driver.name) +
        '&surname=' + encodeURIComponent(driver.surname) +
        '&number=' + encodeURIComponent(driver.number) +
        '&nationality=' + encodeURIComponent(driver.nationality) +
        '&teamId=' + encodeURIComponent(driver.teamId) +
        '&seasonId=' + encodeURIComponent(driver.seasonId);

    window.location.href = url;

}

function submitRace() {
    var race = {
        name: document.getElementById('name').value,
        laps: document.getElementById('laps').value,
        date: document.getElementById('date').value,
        trackId: document.getElementById('track').value
    };

    // Log all race details for debugging
    console.log("Race Details:", race);

    // Validation to ensure all fields are filled
    if (!race.name || !race.laps || !race.date || !race.trackId) {
        alert("All fields are required!");
        return;
    }

    // Build the URL with query parameters
    const url = `${addRaceUrl}?name=${encodeURIComponent(race.name)}&laps=${encodeURIComponent(race.laps)}&date=${encodeURIComponent(race.date)}&trackId=${encodeURIComponent(race.trackId)}`;

    console.log("Redirecting to:", url); // Log the URL for debugging

    // Redirect to the server endpoint
    window.location.href = url;
}
function submitTeam() {
    var teamName = document.getElementById('nameOfTeam').value;

    if (!teamName) {
        alert('Please enter a team name.');
        return;
    }

    console.log("Team Name:", teamName);  // Log the team name

    var url = `${addTeamUrl}?teamName=${encodeURIComponent(teamName)}`;

    window.location.href = url;
}


function closePopup() {
    document.getElementById("myPopup").style.display = "none";
    document.querySelector(".overlay").style.display = "none";
}