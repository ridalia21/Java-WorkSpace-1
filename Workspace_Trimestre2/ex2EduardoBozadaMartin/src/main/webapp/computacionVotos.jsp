<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Computación de votos</title>
</head>
<body>
	<h2>computacion de votos</h2>
	<% 
		String error = (String) request.getAttribute("error");
		if (error != null) {
			%><p><%=error %></p><% 
		}
	%>
	<p>
		<a href="votarPalabra">Volver a votar</a>
	</p>
</body>
</html>