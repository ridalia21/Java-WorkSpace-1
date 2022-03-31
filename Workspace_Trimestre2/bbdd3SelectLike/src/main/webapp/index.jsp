<%@page import="modelo.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro a un curso</title>
</head>
<body>
	<%
	String advertencia = (String) request.getAttribute("advertencia");
	if (advertencia != null) {
		out.print("<p>" + advertencia + "</p>");
	}
	%>
	<h1>Formulario de b�squeda de ciclos por n� de horas</h1>

	<form action="controladConsulta" method="get">
		<h4>Select</h4>
		<select name="campoTabla" required>
			<%
			for (int i = 0; i < Select.campoSeleccionado.length; i++) {
			%>
			<option><%=Select.campoSeleccionado[i]%></option>
			<%
			}
			%>
		</select> <br>
		<br>

		<h4>Like</h4>
		<input type="text" name="consultaTexto" required> <br>
		<br> <input type="submit" name="enviar" value="Enviar">
	</form>
</body>
</html>