<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="modelo.*, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ver votos</title>
</head>
<body>
	<h2>lista de palabras más votadas</h2>
	<table style="border: 1px solid black">
		<tr>
			<th style="border: 1px solid black">Palabra</th>
			<th style="border: 1px solid black">Voto</th>
		</tr>  
	<%
	ArrayList<Palabras> palabras = (ArrayList<Palabras>) request.getAttribute("listaP");

	if (palabras.size() == 0) {
		out.print("<h3>No hay palabras en la base de datos</h3>");
	} else {
		for (int i = 0; i < palabras.size(); i++) {
			%>
			<tr>
				<td style="border: 1px solid black"><%=palabras.get(i).getPalabra()%></td>
				<td style="border: 1px solid black"><%=palabras.get(i).getVotos()%></td>
				<!-- <p><%=palabras.get(i).resul()%></p>  -->
			</tr>
			<%
		}
	}
	%>
	</table>
	<p>
		<a href="index.jsp">Volver a sitio seguro</a>
	</p>
</body>
</html>