package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Address;

@WebServlet("/Qualification")
public class Qualification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			boolean right;
			PrintWriter out = response.getWriter();
			Userexp aue, bue, cue, due;
			Userexpcontroller uec = new Userexpcontroller();
			Userexpcontroller uec1 = new Userexpcontroller();
			Userexpcontroller uec2 = new Userexpcontroller();
			Userexpcontroller uec3 = new Userexpcontroller();
			Address add1, add2, add3, add4;
			HttpSession session = request.getSession(false);
			String mail = (String) session.getAttribute("usermail");
			session.setAttribute("useremail", mail);
			// String mail="satyamrai@gmail.com";
			String atype = request.getParameter("atype");
			String awhere = request.getParameter("afrom");
			String apercent = request.getParameter("apercent");
			String aadd = request.getParameter("aadd");
			String acity = request.getParameter("acity");
			String astate = request.getParameter("astate");
			String apin = request.getParameter("apin");
			if (!(awhere.isEmpty()) & !(apercent.isEmpty()) & !(aadd.isEmpty()) & !(acity.isEmpty())
					& !(astate.isEmpty()) & !(apin.isEmpty())) {
				add1 = new Address(aadd, acity, astate, apin);
				aue = new Userexp(mail, "y", 1, atype, awhere, apercent, add1);
				right = uec.addexperience(aue);
				if (!right) {
					out.print("10th detail addition fail");
				}
			}
			String btype = request.getParameter("btype");
			String bwhere = request.getParameter("bfrom");
			String bpercent = request.getParameter("bpercent");
			String badd = request.getParameter("badd");
			String bcity = request.getParameter("bcity");
			String bstate = request.getParameter("bstate");
			String bpin = request.getParameter("bpin");
			if (!(bwhere.isEmpty()) & !(bpercent.isEmpty()) & !(badd.isEmpty()) & !(bcity.isEmpty())
					& !(bstate.isEmpty()) & !(bpin.isEmpty())) {
				add2 = new Address(badd, bcity, bstate, bpin);
				bue = new Userexp(mail, "y", 2, btype, bwhere, bpercent, add2);
				right = uec1.addexperience(bue);
				if (!right) {
					out.print("12th detail addition fail");
				}
			}
			String ctype = request.getParameter("ctype");
			String cwhere = request.getParameter("cfrom");
			String cpercent = request.getParameter("cpercent");
			String cadd = request.getParameter("cadd");
			String ccity = request.getParameter("ccity");
			String cstate = request.getParameter("cstate");
			String cpin = request.getParameter("cpin");
			if (!(cwhere.isEmpty()) & !(cpercent.isEmpty()) & !(cadd.isEmpty()) & !(ccity.isEmpty())
					& !(cstate.isEmpty()) & !(cpin.isEmpty())) {
				add3 = new Address(cadd, ccity, cstate, cpin);
				cue = new Userexp(mail, "y", 3, ctype, cwhere, cpercent, add3);
				right = uec2.addexperience(cue);
				if (!right) {
					out.print("Graduation detail addition fail");
				}
			}
			String dtype = request.getParameter("dtype");
			String dfrom = request.getParameter("dfrom");
			String dpercent = request.getParameter("dpercent");
			String dadd = request.getParameter("dadd");
			String dcity = request.getParameter("dcity");
			String dstate = request.getParameter("dstate");
			String dpin = request.getParameter("dpin");
			if (!(dfrom.isEmpty()) & !(dpercent.isEmpty()) & !(dadd.isEmpty()) & !(dcity.isEmpty())
					& !(dstate.isEmpty()) & !(dpin.isEmpty())) {
				add4 = new Address(dadd, dcity, dstate, dpin);
				due = new Userexp(mail, "y", 4, dtype, dfrom, dpercent, add4);
				right = uec3.addexperience(due);
				if (!right) {
					out.print("Post Graduation detail addition fail");
				}
			}

		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		response.sendRedirect("Veiwuserprofile.jsp?page=Userexperience.jsp&msg=Registration process complete");
	}

}
