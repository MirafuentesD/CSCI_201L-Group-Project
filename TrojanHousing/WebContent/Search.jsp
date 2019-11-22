<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="css/styleSearch.css" />
<script>

// call showProfile on page load
window.onload = function() {
	showProfile();		
}

//determine if a user is logged to display profile link
function showProfile() {
	var username = "<%=(String) session.getAttribute("username")%>";
	var html = "";
	
	if (username != "null") { // a user is logged in
		html += "<a style=\"margin-right: 20px\" href=\"Profile.jsp\">Profile</a>";
		html += "<a href=\"HomePage.jsp\">Sign Out</a>";
	} else {
		html += "<a style=\"margin-right: 20px\" href=\"Login.jsp\">Login</a>";
		html += "<a href=\"Register.jsp\">Register</a>";
	}
	
	document.getElementById("links").innerHTML = html;
}

</script>
</head>
<body class="font">
	<header>
		<img src="img/Tommy.png" height="150"> <span
			style="font-size: 30px;">Trojan Housing</span>
		<span id="links" style="float: right; margin-top: 5.5%;"></span>
	</header>
	<div class="mainContainer">
		<form name="searchForm" method="POST" action="SearchResults.jsp">
			<div class="subtitle" style="margin-top: 30px;">Price</div>
			<input class="formField" type="text" name="price" /> <br />
			<div class="subtitle" style="margin-top: 30px;">Number of
				bedrooms</div>
			<span class="buttonContainer"> <input type="radio"
				name="queryType" value="all" checked /> <span class="subtitle">All</span>
			</span> <span class="buttonContainer"> <input type="radio"
				name="queryType" value="studio" /> <span class="subtitle">Studio</span>
			</span> <span class="buttonContainer"> <input type="radio"
				name="queryType" value="1" /> <span class="subtitle">1</span>
			</span> <span class="buttonContainer"> <input type="radio"
				name="queryType" value="2" /> <span class="subtitle">2</span>
			</span> <span class="buttonContainer"> <input type="radio"
				name="queryType" value="3" /> <span class="subtitle">3</span>
			</span> <span class="buttonContainer"> <input type="radio"
				name="queryType" value="4" /> <span class="subtitle">4</span>
			</span> <span class="buttonContainer"> <input type="radio"
				name="queryType" value="5" /> <span class="subtitle">5+</span>
			</span> <br />
			<div class="subtitle" style="margin-top: 30px;">Number of
				bathrooms</div>
			<span class="buttonContainer">
				<input type="radio" name="queryType" value="all" checked /> <span
					class="subtitle">All</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="queryType" value="1" /> <span
					class="subtitle">1</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="queryType" value="2" /> <span
					class="subtitle">2</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="queryType" value="3" /> <span
					class="subtitle">3+</span>
			</span> <br />
			<div class="subtitle" style="margin-top: 30px;">Direction from campus</div>
			<span class="buttonContainer">
				<input type="radio" name="queryType" value="all" checked /> <span
					class="subtitle">All</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="queryType" value="north" /> <span
					class="subtitle">North</span>
			</span>
			<span class="buttonContainer">
				<input type="radio" name="queryType" value="west" /> <span
					class="subtitle">West</span>
			</span> <br />
			<div class="subtitle" style="margin-top: 30px;">Maximum distance from campus (miles)</div>
			<input class="formField" type="text" name="distance" /> <br />
			<input class="signin" type="submit" name="search"
				value="Search" />
		</form>
	</div>
</body>
</html>