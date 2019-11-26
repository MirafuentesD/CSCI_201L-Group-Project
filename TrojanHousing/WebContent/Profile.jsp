<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="css/styleResults.css" />
<script>
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
				<a style="margin-right: 20px" href="Requests.jsp">Requests</a>
				<a href="HomePage.jsp" onclick="return signOut();">Sign Out</a>
			</span>
		</div>
	</header>
	<div>
		<div class="title3" style="text-align: center">username's
			favorites:</div>
		<div id="favorites">
			<div class="resultContainer">
				<div class="resultContainer1">
					<form>
						<input class="img" type="image" src="img/img1.jpg" />
					</form>
				</div>
				<div class="resultContainer2">
					<div class="address">2147 W Adams Blvd</div>
					<div class="subtitle" style="padding-top: 20px">
						<span style="font-weight: bold">Bedrooms: 4</span>
					</div>
					<div class="subtitle" style="padding-top: 10px">
						<span style="font-weight: bold">Bathrooms: 3</span>
					</div>
					<div id="favorite">
						<button class="button">Remove</button>
					</div>
				</div>
			</div>
			<div class="resultContainer">
				<div class="resultContainer1">
					<form>
						<input class="img" type="image" src="img/img2.jpg" />
					</form>
				</div>
				<div class="resultContainer2">
					<div class="address">2718 Ellendale Pl</div>
					<div class="subtitle" style="padding-top: 20px">
						<span style="font-weight: bold">Bedrooms: 3</span>
					</div>
					<div class="subtitle" style="padding-top: 10px">
						<span style="font-weight: bold">Bathrooms: 3</span>
					</div>
					<div id="favorite">
						<button class="button">Remove</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>