<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="database.Conector"%>
<!DOCTYPE html>
<html lang="es">

<head>
<%
String usuario = "";
try {
	usuario = session.getAttribute("atributo1").toString();
	String acceso = session.getAttribute("atributo2").toString();
	if (!acceso.equals("1"))
		response.sendRedirect("cerrarSesion.jsp");
} catch (Exception e) {
	response.sendRedirect("cerrarSesion.jsp");
}
%>
<meta charset="UTF-8">
<title>SocialLink</title>
<link rel="stylesheet" href="common/css/main.css">
</head>

<body>
	<p>Principal</p>
</body>

</html>