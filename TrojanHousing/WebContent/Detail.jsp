<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="DetailsStyle.css">
	<meta charset="ISO-8859-1">
	<title>Details</title>

</head>
<body class="font">
	<header>
	<div id="switch_buttons"></div>
		<table>
			<tr>
				<td><a href="HomePage.jsp"><img class="logo" src="Tommy.png"/></a></td>
				<td><h1>Trojan Housing</h1></td>
				<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
				<td><button class="sbutton">Profile</button><button class="sbutton">Sign Out</button></td>
			</tr>
		</table>
	</header>
	<hr>
	<div id="results">
		<table>
		<tr>
			<td>
				<img src="Example_Property.jpg" class="property">
				
			</td>
			<td>
					<p>2147 Adams Blvd.</p>
					<p>Price (per month): $1200</p>
					<p>Bedrooms: 4</p>
					<p>Bathrooms: 2</p>
					<p>Distance from campus: 0.5 miles</p>
					<button class="fav">Favorite</button>
			</td>
		</tr>
		
		</table>
	</div>
</body>
<script>
<%-- function addhtml(id) {
	<% String test = (String) session.getAttribute("user"); 
	//boolean alreadyfavorite = false;
	//if user logged in
	System.out.println("in add html");
	if(test != null && test != "") { %>
		//check if user favorited book
		var xhttp = new XMLHttpRequest();
		var len = xhttp.responseText.trim().length;
		xhttp.open("GET", "CheckFavoriteServlet?usernameText='" + sessionStorage.getItem("u") + "'&bookidText='" + sessionStorage.getItem("bi") + "'", false);
		xhttp.send();
		console.log(xhttp.responseText)
		if(xhttp.responseText.trim().length <= len && !(xhttp.responseText).contentEquals("good")) {
			console.log("in error. favored book")
			var append = "<tr><td><form class=&quotremove_form&quot method=&quotGET&quot action=&quotRemoveFavoriteServlet&quot><button class=&quotremove_button&quot>Remove</button></td></tr></table>"
		}
	    else{
		   var append = "<tr><td><form class='favorite_form' method='GET' action='Details.jsp' onsubmit='return MakeFav();'><button class='favorite_button'>Favorite</button></form></td></tr></table>"
	    }
    <%}else{ %>
		var append = "<tr><td><form class='favorite_form' method='GET' action='Details.jsp' onsubmit='return MakeFav();'><button class='favorite_button'>Favorite</button></form></td></tr></table>"
	<%}%>
	$("#switch_buttons").append(append);
} --%>
</script>
</html>