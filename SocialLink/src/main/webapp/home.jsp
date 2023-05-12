<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="database.Conector"%>
<!DOCTYPE html>
<html lang="es">

<head>
<%
String usuario = "";
int idUsuario;
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
<link rel="stylesheet" href="common/css/home.css">
<script src="common/js/main.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">SocialLink</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">
          <i class="fa fa-home"></i>
          Home
          <span class="sr-only">(current)</span>
          </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="friends.jsp">
          <i class="fa fa-user">
<!--           Para poner el numero de mensajes y solicitudes -->
            <span class="badge badge-danger"></span>
          </i>
          Amigos
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fa fa-envelope">
            <span class="badge badge-danger"></span>
          </i>
          Mensajes
        </a>
      </li>
    </ul>
<!--     <form class="form-inline my-2 my-lg-0"> -->
<!--       <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"> -->
<!--       <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
<!--     </form> -->
  </div>
</nav>

<!-- 	<form method="post" action="/publicar"> -->
<!-- 		<label for="titulo">Título:</label> <input type="text" id="titulo" -->
<!-- 			name="titulo"><br> <label for="contenido">Contenido:</label> -->
<!-- 		<textarea id="contenido" name="contenido"></textarea> -->
<!-- 		<br> <input type="submit" value="Publicar"> -->
<!-- 	</form> -->
</body>

</html>