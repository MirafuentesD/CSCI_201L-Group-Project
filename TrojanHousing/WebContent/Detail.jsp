<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/DetailsStyle.css">
<meta charset="ISO-8859-1">
<title>Details</title>
<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%;
	/* The width is the width of the web page when width = 100% */
}
</style>
</head>

<body class="font">
	<header>
		<div class="headerContainer1">
			<form action="Search.jsp">
				<input style="position: relative; display: inline-block; height: 125px" type="image" src="img/Tommy.png" alt="Submit" />
			</form>
		</div>
		<div class="headerContainer2">
			<div class="title">Trojan Housing</div>
			<div class="title2">Don't just find a place to live, find a home.</div>
		</div>
		<div class="headerContainer3">
			<span id="links" style="float: right"></span>
		</div>
	</header>
	<div id="results">
		<table>
			<tr>
				<td><img src="Example_Property.jpg" class="property"></td>
				<td>
					<p>3030 Shrine Pl.</p>
					<p>Price (per month): $1200</p>
					<p>Bedrooms: 4</p>
					<p>Bathrooms: 2</p>
					<p>Distance from campus: 0.5 miles</p>
					<button class="fav">Favorite</button>
				</td>
			</tr>

			<tr>
				<td><br></td>
			</tr>

		</table>
		<div id="map"></div>
	</div>
	<script>
	var geocoder;
	function codeAddress() {
		geocoder = new google.maps.Geocoder();
		  var address = "3030 Shrine Pl., Los Angeles, CA";

		  geocoder.geocode( { 'address': address}, function(results, status) {
		    if (status == 'OK') {
		      
		      var marker = new google.maps.Marker({
		          map: map,
		          position: results[0].geometry.location
		      });
		    } else {
		      alert('Geocode was not successful for the following reason: ' + status);
		    }
	    });
	 }
	</script>
	<script>
// Initialize and add the map
function initMap() {
      var latlng = new google.maps.LatLng(34.0224, -118.2851);
      var mapOptions = {
        zoom: 15,
        center: latlng
      }
      map = new google.maps.Map(document.getElementById('map'), mapOptions);
      codeAddress();
}
    </script>
	<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChSuAlZw2Do7kuBsnP9Ao2v9cx-D_8V_Y&callback=initMap">
    </script>
    <script>
//call showLinks on page load
window.onload = function() {
	showLinks();		
}

// determine if a user is logged to display links
function showLinks() {
	var username = "<%=(String) session.getAttribute("username")%>";
	var html = "";

	if (username != "null") { // a user is logged in
		html += "<a style=\"margin-right: 20px\" href=\"Profile.jsp\">Profile</a>";
		html += "<a href=\"HomePage.jsp\" onclick=\"return signOut();\">Sign Out</a>";
	} else { // no user logged in
		html += "<a style=\"margin-right: 20px\" href=\"Login.jsp\">Login</a>";
		html += "<a href=\"Register.jsp\">Register</a>";
	}

	document.getElementById("links").innerHTML = html;
}

function signOut() {
	// call servlet to set session attribute username to null
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "SignOut", false);
	xhttp.send();
	return true;
}

</script>
</body>
</html>