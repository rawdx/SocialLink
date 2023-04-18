<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"></script>
    <link rel="stylesheet" href="common/css/style.css">
    <script src="common/js/main.js"></script>
    <title>SocialLink</title>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="./SignInAuthenticator" method="post" class="sign-in-form" name="signIn">
            <h2 class="title">Sign in</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="username" onkeypress="return validarEntrada(event)" placeholder="Username" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="password" onkeypress="return validarEntrada(event)" placeholder="Password" />
            </div>
            <input type="button" value="Sign in" class="btn solid" onclick="enviarSignIn()" />
          </form>
          <form action="./SignUpAuthenticator" method="post" class="sign-up-form" name="signUp">
            <h2 class="title">Sign up</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="username" onkeypress="return validarEntrada(event)" placeholder="Username" />
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" name="email" onkeypress="return validarEntrada(event)" placeholder="Email" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="password" onkeypress="return validarEntrada(event)" placeholder="Password" />
            </div>
            <input type="button" value="Sign up" class="btn" onclick="enviarSignUp()" />
            <% if (request.getParameter("error") != null) { %>
  <div class="error-message">
    <%= request.getParameter("error") %>
  </div>
<% } %>
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
              Join our growing community by creating an account today.
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Sign up
            </button>
          </div>
          <img src="common/img/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>Already have an account ?</h3>
            <p>
              Sign in to your account to continue where you left off.
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="common/img/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="common/js/app.js"></script>
  </body>
</html>
