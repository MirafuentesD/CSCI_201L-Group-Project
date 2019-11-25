<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/styleLogin.css" />
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>	
<script>
    // validate search terms to make sure at least one term is entered
    function validateSearch() {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "Validate?searchTerms="
                + document.searchForm.searchTerms.value, false);
        xhttp.send();
 
        if (xhttp.responseText.trim().length > 0) {
            document.getElementById("errorSearch").innerHTML = xhttp.responseText;
            return false;
        }
        return true;
    }
 
    // validate login information to make sure username exists and password is correct
	function ValidateLogin(){
		var xhttp = new XMLHttpRequest();
		//open request
		xhttp.open("POST","userLogin?username=" + document.loginForm.username.value + "&password=" + document.loginForm.password.value, false);
		//send request for form
		xhttp.send();
		//check for form errors
		if(xhttp.responseText.trim().length > 0){
			document.getElementById("errorUsername").innerHTML = xhttp.responseText;
			return false;
		}
	return true;
	}
    
</script>
</head>
<body class="font">
    <header>
		<div class="headerContainer1">
		<form action="HomePage.jsp">
				<input
					style="position: relative; display: inline-block; height: 125px"
					type="image" src="img/Tommy.png" alt="Submit" />
			</form>
		</div>
		<div class="headerContainer2">
			<div class="title">Trojan Housing</div>
			<div class="title2">Don't just find a place to live, find a home.</div>
		</div>
	</header>
    <div class="mainContainer">
        <form name="loginForm" method="POST" action="Search.jsp"
            onsubmit="return ValidateLogin();">
            <div class="subtitle" style="margin-top: 30px;">
                Username <span id="errorUsername"
                    style="font-style: italic; font-size: 12px; color: red;"></span>
            </div>
            <input class="formField" type="text" name="username" /> <br />
            <div class="subtitle" style="margin-top: 30px;">
                Password <span id="errorPassword"
                    style="font-style: italic; font-size: 12px; color: red;"></span>
            </div>
            <input class="formField" type="password" name="password" /> <br />
            <input class="signin" type="submit" name="signin" value="Sign In" />
        </form>
    </div>
</body>
</html>