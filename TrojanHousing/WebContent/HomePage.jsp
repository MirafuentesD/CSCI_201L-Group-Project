<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trojan Housing</title>
<link rel="stylesheet" type="text/css" href="css/styleHome.css" />
</head>
<body class="font" style="overflow: hidden">
	<div class="leftContainer">
		<div class="title">Trojan Housing</div>
		<div class="subtitle">Don't just find a place to live,</div>
		<div class="subtitle" style="margin-top: 5px;">find a home.</div>
	</div>
	<div class="rightContainer">
		<div style="padding-left: 150px">
			<form action="Login.jsp">
				<input class="buttons" type="submit" name="login" value="Login" />
			</form>
		</div>
		<div style="padding-left: 150px">
			<form action="Register.jsp">
				<input class="buttons" type="submit" name="register" value="Register" />
			</form>
		</div>
		<div style="margin-top:30px; padding-left: 150px">
			<a href="Search.jsp">Continue as guest</a>
		</div>
	</div>
</body>
</html>