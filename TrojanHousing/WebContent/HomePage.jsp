<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trojan Housing</title>
<link rel="stylesheet" type="text/css" href="css/styleHome.css" />
</head>
<body class="font">
	<div class="leftContainer">
		<div class="title">Trojan Housing</div>
		<div class="subtitle">Don't just find a place to live,</div>
		<div class="subtitle" style="margin-top: 5px;">find a home.</div>
	</div>
	<div id="links" class="rightContainer">
		<div style="padding-left: 150px">
			<form action="Login.jsp">
				<input class="highlightedButton" type="submit" name="action"
					value="Login" />
			</form>
		</div>
		<div style="padding-left: 150px">
			<form action="Register.jsp">
				<input class="highlightedButton" type="submit" name="action"
					value="Register" />
			</form>
		</div>
		<div style="padding-left: 150px">
			<form action="Search.jsp">
				<input class="normalButton" style="font-size: 15px;" type="submit"
					name="action" value="Continue As Guest" />
			</form>
		</div>
	</div>
</body>
</html>