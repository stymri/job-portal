package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.Applyjobcontroller;

@WebServlet("/Applyjob")
public class Applyjob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String ids = request.getParameter("id");
		int id = Integer.parseInt(ids);
		HttpSession session = request.getSession(false);
		String mail = (String) session.getAttribute("usermail");
		if (mail != null) {
			Applyjobcontroller ajbc = new Applyjobcontroller();
			boolean right;
			right = ajbc.applyjob(id, mail);
			if (right) {
				response.sendRedirect("Jobdetail.jsp?id="+id+"&value=false");
				//out.print("Successfully apply for job");
			} else {
				out.print("fail to register");
			}
		} else {
			// session.setAttribute("jobid", id);
			response.sendRedirect("Registration.jsp");
		}
	}
}