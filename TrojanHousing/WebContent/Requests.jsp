<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Roommate Requests</title>
<link rel="stylesheet" type="text/css" href="css/styleRequests.css" />
<script>
	// call showLinks on page load
	window.onload = function() {
		showRequests();
	}

	function signOut() {
		// call servlet to set session attribute username to null
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "SignOut", false);
		xhttp.send();
		return true;
	}
	
	function showRequests() {
		/* // call servlet to get requests for user
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "GetRequests", false);
		xhttp.send();
		
		var html = "";
		
		if(xhttp.responseText.trim().length > 0) {
			// ajax call returns a list of usernames that requested to be the logged in user's roommate
			var usernames = xhttp.responseText;
			var usernamesList = JSON.parse(requests);
			
			for(i = 0; i < usernamesList.length; i++) {
				var username = usernamesList[i];
				
				html += "<div id=\"requestContainer" + i + "\" class=\"requestContainer\">";
				html += "<span class=\"subtitle2\"><span class=\"subtitle\">" + username + "</span> sent you a request";
				html += "</span> <span style=\"float: right\">";
				html += "<button class=\"highlightedButtonSmall\" onclick=\"accept(" + i + ", " + username + ");\">Accept</button>";
				html += "<button class=\"normalButtonSmall\" style=\"margin-left: 10px\" onclick=\"reject(" + i + ");\">Reject</button>";
				html += "</span></div>";
			}
		} else {
			html = "There are no roommate requests to display."		
		}
			
		document.getElementById("requests").innerHTML = html; */
	}

	function addRoommate() {
		/* // call servlet to validate roommate request
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "AddRoommate?username=" + document.addForm.username.value, false);
		xhttp.send();

		if(xhttp.responseText.trim() != "Request submitted successfully") {
			document.getElementById("errorMsg").innerHTML = xhttp.responseText;
			return false;
		} else {
			document.getElementById("successMsg").innerHTML = xhttp.responseText;
		} */

		return true;
	}
	
	function accept(index, username) {
		// add new roommate to group
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "AddRoommate?username=" + username, false);
		xhttp.send();

		// set container for that book to not display
		var id = "requestContainer" + index;
		var container = document.getElementById(id);
		container.style.display = "none";
	}
	
	function reject(index) {
		// set container for that book to not display
		var id = "requestContainer" + index;
		var container = document.getElementById(id);
		container.style.display = "none";
	}
</script>
</head>
<body class="font">
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
			<span id="links" style="float: right">
				<a style="margin-right: 20px" href="Profile.jsp">Profile</a>
				<a href="HomePage.jsp" onclick="return signOut();">Sign Out</a>
			</span>
		</div>
	</header>
	<div class="leftContainer">
		<div class="title3" style="text-align: center">Add Roommates</div>
		<form name="addForm" style="margin-top: 30px" onclick="return addRoomate();">
			<div class="subtitle">
				Enter your roommate's username: <span id="errorMsg"
					style="font-style: italic; font-size: 12px; color: red;"></span>
			</div>
			<input class="formField" type="text" name="username" /> <br />
			<div id="successMsg" style="font-style: italic; font-size: 12px;"></div>
			<input
				class="normalButton" style="margin-top: 50px" type="submit"
				name="search" value="Send Roommate Request" />
		</form>
	</div>
	<div class="rightContainer">
		<div class="title3" style="text-align: center">Roommate Requests</div>
		<div id="requests" class="requestsContainer"></div>
	</div>
</body>
</html>