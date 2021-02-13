package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/admin")
public class Adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		Admincontroller ac = new Admincontroller();
		String msg = ac.login(mail, password);
		if (msg.equalsIgnoreCase("login")) {
			response.sendRedirect("Adminjobsearch.jsp");
		} else {
			response.sendRedirect("Login.jsp?use=admin&msg="+msg);
		}
	}

}
