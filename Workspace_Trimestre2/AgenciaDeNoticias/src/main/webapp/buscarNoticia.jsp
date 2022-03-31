<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, modelo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buscador</title>
</head>
<body>
	<h2>Buscador de noticias</h2>
	<form action="buscaNoticia" method="get">
		<select name="campo" required="required">
			<option value="titulo">Titulo</option>
			<option value="cuerpoNoticia">Cuerpo</option>
			<option value="usuarioEditor">Autor</option>
		</select>
		<input type="text" name="dato" required="required"> 
		<input type="submit" name="enviar" value="Buscar">
	</form>
	
	<%
	if (request.getAttribute("listaL") != null) {
		ArrayList<Noticia> noti = (ArrayList<Noticia>) request.getAttribute("listaL");
		if (noti.size() == 0) {
			out.print("<p>No se han encontrado noticias con los parámetros que solicitas</p>");
		} else {
			for (Noticia n : noti) {
				String r = n.dameReg();
				System.out.println(r);
			%>
			<p><%=n %></p>
			<% 
			}
		}
	}
	%>
	
	<p><a href="index.jsp">Volver al index</a></p>
</body>
</html>