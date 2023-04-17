package database;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginAuthenticator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String usuvalido = "admin";
	private String pwdvalida = "1357";
	
    public LoginAuthenticator() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("./login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//Conector db = new Conector();
		HttpSession session = request.getSession();

		String user = request.getParameter("user");
		String pass = request.getParameter("pass");

		if (user == null)
			user = "";
		if (pass == null)
			pass = "";

		if (user.equals(usuvalido) && pass.equals(pwdvalida)) {
			session.setAttribute("atributo1", user);
			session.setAttribute("atributo2", "1");

			response.sendRedirect("home.jsp");
		} else
			response.sendRedirect("login.jsp");
	}
	
}
