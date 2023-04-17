<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="database.Conector"%>
<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<title>SocialLink</title>
<link rel="stylesheet" href="common/css/main.css">
<script src="common/js/functions.js"></script>
</head>

<body>
	<p>Login</p>
	<form action="./LoginAuthenticator" method="post" name="login" id="login">
	<input type="text" name="user" onkeypress="return comprobarLogin(event)"/>
	<input type="password" name="pass" onkeypress="return comprobarLogin(event)"/>
	<input type="button" name="send" value="Enviar" onclick="enviarLogin()" />
	</form>
	<a href="signup.jsp">Sign up</a>
</body>

</html>