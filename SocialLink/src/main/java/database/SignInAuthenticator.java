package database;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SignInAuthenticator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("./index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Conector db = new Conector();
		
		db.connect();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String[][] user = db.getData("SELECT username, AES_DECRYPT(password,'14564rec.'), id_user FROM Users WHERE username LIKE '" + username + "';");
		
		if(user == null){
			db.disconnect();
			response.sendRedirect("index.jsp");
			return;
		}
		
		if (username.equals(user[0][0]) && password.equals(user[0][1])) {
			session.setAttribute("atributo1", username);
			session.setAttribute("atributo2", "1");
			session.setAttribute("atributo3", user[0][2]); 

			response.sendRedirect("home.jsp");
		} else
			response.sendRedirect("index.jsp");
		
		db.disconnect();
	}

}
