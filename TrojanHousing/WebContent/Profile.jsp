<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="css/styleResults.css" />
</head>
<body class="font">
	<header>
		<img src="img/Tommy.png" height="150"> <span
			style="font-size: 30px;">Trojan Housing</span> <span id="links"
			style="float: right; margin-top: 5.5%;"><a
			style="margin-right: 20px" href="HomePage.jsp">Sign Out</a></span>
	</header>
	<div>
		<div class="title" style="text-align: center">username's
			favorites:</div>
		<div id="favorites">
			<div class="resultContainer">
				<div class="resultContainer1">
					<form>
						<input class="img" type="image" src="img/img1.jpg" />
					</form>
				</div>
				<div class="resultContainer2">
					<div class="bookTitle">2147 W Adams Blvd</div>
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
					<div class="bookTitle">2718 Ellendale Pl</div>
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