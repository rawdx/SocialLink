<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="database.Conector"%>
<!DOCTYPE html>
<html>
<%
session.invalidate();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cerrar Sesión</title>
</head>
<body>
Sesión Cerrada.<br/>
<a href="login.jsp">Volver</a>
</body>
</html>