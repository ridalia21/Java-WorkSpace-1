<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
<%
	String mensaje = (String) request.getAttribute("m1");
	if (mensaje != null) {
		out.print(mensaje);
	}
%>
	<form action="controlAcceso" method="post">
	<p>El caracter ":" no puede formar parte ni del login ni del passw</p>
		<p>Usuario: <input type="text" name="login" pattern="[^:]+" required> </p>
		<p>Contraseña: <input type="password" name="passw" pattern="[^:]+" required> </p>
		<p><input type="submit" id="enviar" name="enviar" value="Enviar"> </p>
	</form>
	<p><a href="registro.jsp">Si no estás registrado, hazlo aquí</a></p>
</body>
</html>