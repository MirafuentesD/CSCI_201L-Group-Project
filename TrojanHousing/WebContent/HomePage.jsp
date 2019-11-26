<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trojan Housing</title>
<link rel="stylesheet" type="text/css" href="css/styleHome.css" />
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
			html += "<div style=\"padding-left: 150px\">";
			html += "<form action=\"Profile.jsp\">";
			html += "<input class=\"normalButton\" type=\"submit\" name=\"action\" value=\"Profile\" />";
			html += "</form></div>";
			html += "<div style=\"padding-left: 150px\">";
			html += "<form action=\"HomePage.jsp\" onclick=\"return signOut();\">";
			html += "<input class=\"normalButton\" type=\"submit\" name=\"action\" value=\"Sign Out\" />";
			html += "</form></div>";
			html += "<div style=\"padding-left: 150px\">";
			html += "<form action=\"Search.jsp\">";
			html += "<input class=\"highlightedButton\" type=\"submit\" name=\"action\" value=\"Search For Properties\" />";
			html += "</form></div>";
		} else { // no user logged in
			html += "<div style=\"padding-left: 150px\">";
			html += "<form action=\"Login.jsp\">";
			html += "<input class=\"highlightedButton\" type=\"submit\" name=\"action\" value=\"Login\" />";
			html += "</form></div>";
			html += "<div style=\"padding-left: 150px\">";
			html += "<form action=\"Register.jsp\">";
			html += "<input class=\"highlightedButton\" type=\"submit\" name=\"action\" value=\"Register\" />";
			html += "</form></div>";
			html += "<div style=\"padding-left: 150px\">";
			html += "<form action=\"Search.jsp\">";
			html += "<input class=\"normalButton\" style=\"font-size: 15px;\" type=\"submit\" name=\"action\" value=\"Continue As Guest\" />";
			html += "</form></div>";
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
</head>
<body class="font">
	<div class="leftContainer">
		<div class="title">Trojan Housing</div>
		<div class="subtitle">Don't just find a place to live,</div>
		<div class="subtitle" style="margin-top: 5px;">find a home.</div>
	</div>
	<div id="links" class="rightContainer"></div>
</body>
</html>