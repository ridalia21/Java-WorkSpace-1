<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%Cookie[]m1=request.getCookies();
String val=null;
if(m1!=null){
	for(Cookie c:m1){
		if(c.getName().equals("bodyColor")){
			val=(String)c.getValue();
			break;
		}
	}
	/*
	* Hacer un foreach pero con un for normal	
	Cookie c1 = null;
	for (int i = 0; i < m1.length; i++) {
		c1 = m1[i];
		if(c1.getName().equals("bodyColor")){
			val=(String)c1.getValue();
			break;
		}
	}
	*/
}
%>
<body style="background-color:<%=val%>">
<p>por favor dios llevame no puedo seguir un día mas en esta carcel de carne que hago un 10 de enero en clase de mercedes que he hecho en mi vida</p>
<p><a href="index.jsp">Volver al indice</a></p>
<p><a href="color.jsp">Volver a seleccion del color</a></p>
</body>
</html>