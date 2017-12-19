<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	table {
    	border-collapse: collapse;
	}

	table, td, th {
    	border: 1px solid black;
	}
	tr:hover {background-color:#87CEFA;}
	th {
    	background-color: #DB7093;
    	color: white;
	}
</style>
</head>
<body>
<div align="left">
	<h1 style="color: #708090">List of Hotels in ${city}</h1>
	<div class="container">
	    <div class="list-group">
		 <c:forEach var="hotel" items="${hotellist}">
		    <a href="#" class="list-group-item active">
		    <h1><p class="list-group-item-heading">${hotel.hotelName} Hotel</p></h1>
            <p style="display:inline"" class="list-group-item-heading">Hotel ID: ${hotel.hotelId}</p>
            <p class="list-group-item-heading">City : ${hotel.city}</p>
			
			<p class="list-group-item-heading">Address ${hotel.address}</p>
			<p class="list-group-item-heading">Description ${hotel.description}</p>
			<p class="list-group-item-heading">Average Rate Per Night  ${hotel.arpn}</p>
			<p class="list-group-item-heading">Phone Number ${hotel.phoneNum1}</p>
			<p class="list-group-item-heading">Phone Number ${hotel.phoneNum2}</p>
			<p class="list-group-item-heading">Rating ${hotel.rating}</p>
			<p class="list-group-item-heading">Email ${hotel.email}</p>
			<p class="list-group-item-heading">Fax ${hotel.fax}</p>
			<a href="roomdetails.do?hotelId=${hotel.hotelId}" style="color: red">Details</a>
			</a>	
		</c:forEach> 
		</div>
		</div>
	</div>
</body>
</html>