package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/User")
public class Userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String email=request.getParameter("mail");
		String pass=request.getParameter("password");
		out.print(email+pass);
		UserBean ub=new UserBean();
		ub.setEmail(email);
		ub.setPass(pass);
		Usercontroller lc=new Usercontroller();
		int x=lc.check(ub);
		if (x==0) {
			out.print("Login fail"
					+ "<a href=login.html>click here</a>");
		}
		else{
			HttpSession session=request.getSession();
			session.setAttribute("usermail", email);
			response.sendRedirect("appliedjob.jsp");
		}
	
	}

}
