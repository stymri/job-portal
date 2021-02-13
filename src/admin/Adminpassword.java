package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Adminpassword")
public class Adminpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String adminmail = (String) session.getAttribute("adminmail");
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String repass = request.getParameter("repass");
		Admincontroller ac = new Admincontroller();
		if (newpass.equals(repass)) {
			String msg = ac.login(adminmail, oldpass);
			if (msg.equalsIgnoreCase("login")) {
				boolean can = ac.change(adminmail, newpass);
				if (can) {
					response.sendRedirect("AdminChangepassword.jsp&msg=password+change");
				} else {
					response.sendRedirect("AdminChangepassword.jsp&msg=password+not+change");
				}
			} else {
				response.sendRedirect("AdminChangepassword.jsp&msg=Wrong+password");
			}
		} else {
			response.sendRedirect("AdminChangepassword.jsp&msg=Retype+password+not+match");
		}
	}
}
