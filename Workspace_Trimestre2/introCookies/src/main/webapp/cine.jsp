<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String publicidad="cine";
	Cookie miCookie=new Cookie("publi",publicidad);
response.addCookie(miCookie);

%>
<p>tarantino otro rollo</p>

<a href="publicidad.jsp">Volver al indice</a>
</body>
</html>