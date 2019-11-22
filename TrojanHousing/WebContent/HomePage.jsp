 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="HomePage.css">
		<title>HomePage</title>
</head>

<%
	while(false){
		out.println("hi");
	}
%>

<body>
		<div class="header">
			<table>
				<tr>
					<td><img class="logo" src="trojan.png" /></td>
				</tr>
			</table>	
			<form method="GET" action="Login.jsp" style = "float:right;margin-top:-100px;margin-right:100px;">
				<input type="submit" name="Login" value = "Login">
			</form> 
			<form method="GET" action="Register.jsp" style = "float:right;margin-top:-100px;">
				<input type="submit" name="Register" value = "Register">
			</form> 
			<form method="GET" action="Search.jsp" style = "float:right;margin-top:-50px;">
				<input type="submit" name="Guest" value = "Continue As Guest">
			</form> 
			<h1>Trojan Housing</h1>
			
		</div>
</html>