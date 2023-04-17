function enviarLogin() {
	datos = document.login;
	if (datos.user.value == '' || datos.pass.value == '')
		alert('¡Tienes que rellenar todos los campos!');
	else datos.submit();
}

function comprobarLogin(evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if ((keycode < 48 || keycode > 57) && (keycode < 64 || keycode > 90) && (keycode < 97 || keycode > 122)) //Rango ASCII de números y letras
		if (keycode != 8 && keycode != 13 && keycode != 27 && keycode != 0) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		} else if (keycode == 13)
			enviarLogin();
		else return true;
	else return true;
}
