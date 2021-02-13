package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Address;
import common.DateformatException;
import common.Dategetter;

@WebServlet("/Reg")
public class Reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("usermail");
		boolean is;
		if (mail == null) {
			is = false;
		} else {
			is = true;
		}
		out = response.getWriter();
		String name = request.getParameter("uname");
		String email = request.getParameter("mail");
		String pass = request.getParameter("password");
		String phno = request.getParameter("uphno");
		String sex = request.getParameter("g");
		String add = request.getParameter("uadd");
		String city = request.getParameter("ucity");
		String state = request.getParameter("state");
		String pin = request.getParameter("upin");
		String dob = request.getParameter("dob");
		Date dateofbirth = null;
		try {
			dateofbirth = Dategetter.toDate(dob);
		} catch (DateformatException e) {
			e.printStackTrace();
			response.sendRedirect("Registration.jsp?msg=enter date in correct format");
		}

		/*
		 * Date lastdate = new Date ; System.out.println(lastdate);
		 */
		Address addr = new Address(add, city, state, pin);
		UserBean ub = new UserBean(email, dateofbirth, pass, name, phno, sex, addr);
		Usercontroller rc = new Usercontroller();
		if (is) {
			boolean res = rc.update(ub);
			if (res) {
				response.sendRedirect("Veiwprofile.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		} else {
			boolean res = rc.register(ub);
			if (res) {
				session.setAttribute("useremail", email);
				response.sendRedirect("qualification.html");
			} else {
				out.print("<html>" + "<body>" + "registration unsucessful" + "<a href=Registration.jsp>click here</a>"
						+ "</body>" + "</html>");
			}
		}
	}
}
