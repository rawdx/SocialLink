function validarEntrada(evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if ((keycode < 48 || keycode > 57) && (keycode < 64 || keycode > 90) && (keycode < 97 || keycode > 122)) //Rango ASCII de números y letras
		if (keycode != 8 && keycode != 13 && keycode != 27 && keycode != 0) { //Caracteres especiales permitidos
			alert('Sólo puedes introducir letras y números');
			return false;
		} else if (keycode == 13)
			enviarLogin();
		else return true;
	else return true;
}

function enviarSignIn() {
	datos = document.signIn;
	if (datos.username.value == '' || datos.password.value == '')
		alert('¡Tienes que rellenar todos los campos!');
	else datos.submit();
}

function enviarSignUp() {
	datos = document.signUp;
	if (datos.username.value == '' || datos.password.value == '' || datos.email.value == '') {
		alert('¡Tienes que rellenar todos los campos!');
	} else if (!/.*@.*/.test(datos.email.value)) {
		alert('El campo de email debe contener "@"');
	}
	else datos.submit();
}