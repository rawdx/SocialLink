package database;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignUpAuthenticator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("./index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Conector db = new Conector();
		
		db.connect();
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		String[][] existingUser = db.getData("SELECT username FROM Users WHERE username LIKE '" + username + "';");
		
		if(existingUser != null){
			db.disconnect();
			response.sendRedirect("index.jsp?error=El nombre de usuario ya ha sido registrado. Por favor, elija otro.");
			return;
		}
		
		db.execute("INSERT INTO Users (username, email, password) VALUES ('" + username + "','" + email + "', AES_ENCRYPT('" + password + "', '14564rec.'))");
		
		response.sendRedirect("index.jsp");
		
		db.disconnect();
	}
}
