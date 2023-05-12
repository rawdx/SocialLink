<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="database.Conector"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="common/css/friends.css">
<script src="common/js/main.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%
String usuario = "";
int idUsuario = 0;
try {
	usuario = session.getAttribute("atributo1").toString();
	idUsuario = Integer.parseInt(session.getAttribute("atributo3").toString());
	String acceso = session.getAttribute("atributo2").toString();
	if (!acceso.equals("1"))
		response.sendRedirect("cerrarSesion.jsp");
} catch (Exception e) {
	response.sendRedirect("cerrarSesion.jsp");
	System.out.print(e);
}
%>
<meta charset="UTF-8">
<title>SocialLink</title>
</head>
<body>
	<nav
		class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">SocialLink</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="home.jsp"> <i
						class="fa fa-home"></i> Home
				</a></li>
				<li class="nav-item  active"><a class="nav-link"
					href="friends.jsp"> <i class="fa fa-user"> <span
							class="badge badge-danger"></span>
					</i> Amigos
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"> <i
						class="fa fa-envelope"> <span class="badge badge-danger"></span>
					</i> Mensajes
				</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<div class="row">
		<div class="col">
			<h3>Tus amigos</h3>
		</div>
		<div class="col">
			<form method="post" action="./SolicitudAmistad">
				<fieldset>
					<legend>Enviar solicitud de amistad</legend>
					<input type="text" placeholder="Nombre de usuario"> <input
						type="button" value="Enviar">
				</fieldset>
			</form>
			<br>
			<h3>Tus solicitudes</h3>
			<ul>
				<%
				Conector db = new Conector();
				ArrayList<String> solicitudes = new ArrayList<String>();
				db.connect();
				String[][] usuariosPendientes = db
						.getData("SELECT username, user1 FROM Users JOIN Amistades ON(Users.id_user = Amistades.user1) WHERE user2 = "
						+ idUsuario + " AND estado = 1;");

				db.disconnect();

				if (usuariosPendientes != null) {
					for (int i = 0; i < usuariosPendientes.length; i++) {
				%>
				<li>
					<p><%=usuariosPendientes[i][0]%></p>
					<form action="./AceptarSolicitud" method="post" name="solicitud">
						<input type="hidden" value="<%=usuariosPendientes[i][1]%>"
							name="idUsuarioPendiente"> <input type="button"
							value="Aceptar" onclick="enviarSolicitud(2)"> <input
							type="button" value="Rechazar" onclick="enviarSolicitud(0)">
					</form>
				</li>
				<%
				}
				%>
			</ul>
			<%
			} else {
			%>
			<p>No tienes nuevas solicitudes</p>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>