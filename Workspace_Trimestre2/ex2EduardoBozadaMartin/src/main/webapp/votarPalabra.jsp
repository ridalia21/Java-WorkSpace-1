<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelo.*, java.util.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Votar palabra</title>
</head>
<body>
	<h2>vota por la palabra que más te guste</h2>
	<form action="votarPalabra" method="post">
	<%
	ArrayList<Palabras> palabras = (ArrayList<Palabras>) request.getAttribute("listaP");
	if (palabras.size() == 0 || palabras == null) {
		out.print("<h3>No hay palabras en la base de datos</h3>");
	} else {
		for (int i = 0; i < palabras.size(); i++) {
			%>
			<p><input type="radio" name="pal" value="<%=palabras.get(i)%>"><%=palabras.get(i)%></p>
			<%
		}
	}
	%>
	<input type="submit" name="enviar" value="enviar">
	</form>
	<p>
		<a href="index.jsp">Volver a sitio seguro</a>
	</p>
</body>
</html>