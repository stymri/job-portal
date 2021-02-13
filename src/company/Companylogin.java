package company;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Company")
public class Companylogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Companycontroller cc = new Companycontroller();
		String cmail = request.getParameter("mail");
		String password = request.getParameter("password");
		//System.out.println(cmail + password);
		String msg = cc.checkcompany(cmail, password);
		if (msg.equals("true")) {
			session.setAttribute("cmail", cmail);
			response.sendRedirect("Companyjobs.jsp?index=0&selected=false");
		} else {
			response.sendRedirect("Login.jsp?use=Company&msg=" + msg);
		}
	}

}
