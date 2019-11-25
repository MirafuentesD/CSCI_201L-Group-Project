<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" type="text/css" href="css/styleSearch.css" />
<script>
	// call showLinks on page load
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
	
	// set action of form to details page of random property
	function randomProperty() {
		// uncomment lines
		/* var randomPropertyID = 0 // get random property ID
		var action = "Details.jsp?id=" + randomPropertyID */
		var action = "Details.jsp" // delete line
		document.getElementById("feelingLucky").action = action;
	}
</script>
</head>
<body class="font" style="overflow: hidden">
	<header>
		<div class="headerContainer1">
		<form action="Search.jsp">
				<input
					style="position: relative; display: inline-block; height: 125px"
					type="image" src="img/Tommy.png" alt="Submit" />
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
	<div class="mainContainer">
		<form name="searchForm" method="GET" action="SearchResults.jsp">
			<div class="subtitle">Price <span class="subtitle2">(per month)</span></div>
			<input class="formField" type="text" name="price" /> <br />
			
			<div class="subtitle" style="margin-top: 25px">Bedrooms</div>
			<span class="buttonContainer">
				<input type="radio" name="bedrooms" value="all" checked />
				<span class="subtitle2">All</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bedrooms" value="studio" />
				<span class="subtitle2">Studio</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bedrooms" value="1" />
				<span class="subtitle2">1</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bedrooms" value="2" />
				<span class="subtitle2">2</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bedrooms" value="3" />
				<span class="subtitle2">3</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bedrooms" value="4" />
				<span class="subtitle2">4</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bedrooms" value="5" />
				<span class="subtitle2">5+</span>
			</span> <br />
			
			<div class="subtitle" style="margin-top: 25px">Bathrooms</div>
			<span class="buttonContainer">
				<input type="radio" name="bathrooms" value="all" checked />
				<span class="subtitle2">All</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bathrooms" value="1" />
				<span class="subtitle2">1</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bathrooms" value="2" />
				<span class="subtitle2">2</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="bathrooms" value="3" />
				<span class="subtitle2">3+</span>
			</span> <br />
			
			<div class="subtitle" style="margin-top: 25px">Direction from campus</div>
			<span class="buttonContainer">
				<input type="radio" name="direction" value="all" checked />
				<span class="subtitle2">All</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="direction" value="north" />
				<span class="subtitle2">North</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="direction" value="west" />
				<span class="subtitle2">West</span>
			</span> <br />
			
			<div class="subtitle" style="margin-top: 25px">Maximum distance from campus <span class="subtitle2">(miles)</span></div>
			<input class="formField" type="text" name="distance" /> <br />
			
			<input class="normalButton" type="submit" name="search" value="Search" />
		</form>
		<form id="feelingLucky" onclick="randomProperty()">
			<input class="highlightedButton" type="submit" name="search" value="I'm Feeling Lucky!" />
		</form>
	</div>
</body>
</html>