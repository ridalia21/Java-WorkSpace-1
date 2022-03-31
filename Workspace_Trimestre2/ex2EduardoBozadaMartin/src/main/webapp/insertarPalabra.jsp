<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insertar palabra nueva</title>
</head>
<body>
	<h2>insertar una palabra nueva a la encuesta</h2>
	<%
		String error = (String) request.getAttribute("error");
		String resul = (String) request.getAttribute("resultado");
		if (error != null) {
		%>
			<p><%=error %></p>
		<% 
		} else if(resul != null) {
		%>
			<p><%=resul %></p>
		<%
		}
	%>
	<form action="addPalabra" method="post">
		<p>
			nueva palabra <input type="text" name="palNueva" required>
		</p>
		<p>
			<input type="submit" name="confirmar" value="confirmar">
		</p>
	</form>
	<p>
		<a href="index.jsp">Volver a sitio seguro</a>
	</p>
</body>
</html>