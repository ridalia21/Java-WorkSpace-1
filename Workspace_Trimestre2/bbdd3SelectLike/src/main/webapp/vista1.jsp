<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="modelo.*,java.util.ArrayList"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vista Uno</title>
</head>
<body>
	<%
	ArrayList<AlumnoEspecialidad> especialidades = (ArrayList<AlumnoEspecialidad>) request.getAttribute("tablaAlumEspecialidades");

	if (especialidades.size() == 0) {
		out.print("<h1>No hay coincidencias especialidades</h1>");
	} else {

		for (int i = 0; i < especialidades.size(); i++) {
	%>
	<p><%=especialidades.get(i)%></p>
	<%
	}
	}
	%>
	<p>
		<a href="index.jsp">Nueva b�squeda</a>
	</p>
</body>
</html>