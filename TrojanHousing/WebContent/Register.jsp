<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=css/styleLogin.css>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<script>
function ValidateRegister(){
	var xhttp = new XMLHttpRequest();
	//open request
	xhttp.open("POST","userRegister?username=" + document.registerForm.username.value + "&password=" + document.registerForm.password.value + 
			"&confirmPassword=" + document.registerForm.confirmPassword.value, false);
	//send request for form
	xhttp.send();
	//check for form errors
	if(xhttp.responseText.trim().length > 0){
		document.getElementById("errorPassword").innerHTML = xhttp.responseText;
		return false;
	}
	return true;
}

</script>
<body>
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
        <form name="registerForm" method="POST" action="Search.jsp"
            onsubmit="return ValidateRegister();">
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
             <div class="subtitle" style="margin-top: 30px;">
                Confirm Password <span id="errorPassword"
                    style="font-style: italic; font-size: 12px; color: red;"></span>
            </div>
            <input class="formField" type="password" name="confirmPassword" /> <br />
            
            <input class="signin" type="submit" name="signin" value="Sign In" />
        </form>
    </div>
	
</body>
</html>