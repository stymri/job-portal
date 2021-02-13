<%@page import="company.Companycontroller"%>
<%@page import="company.CompanyBean"%>
<%@page import="user.Usercontroller"%>
<%@page import="user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String msg;
		boolean can;
		int x;
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String repass = request.getParameter("repass");
		String user = request.getParameter("user");
		if (newpass.equals(repass)) {
			if (user.equalsIgnoreCase("true")) {
				UserBean ub = new UserBean();
				String umail = (String) session.getAttribute("usermail");
				ub.setEmail(umail);
				ub.setPass(oldpass);
				Usercontroller uc = new Usercontroller();
				x = uc.check(ub);
				if (x == 1) {
					ub.setPass(newpass);
					can = uc.change(ub);
				}
			} else {
				CompanyBean cb = new CompanyBean();
				Companycontroller cc = new Companycontroller();
				String cmail = (String) session.getAttribute("cmail");
				String check = cc.checkcompany(cmail, oldpass);
				if (check.equalsIgnoreCase("true")) {
					x = 1;
					can = cc.change(cmail, newpass);
				}
			}
			if (x == 1) {
				if (can) {
					msg = "password successfully changed";
				} else {
					msg = "password not changed";
				}
			} else {
				msg = "wrong password";
			}

		} else {
			msg = "password donot match";
		}
		if (user.equalsIgnoreCase("true")) {
			%> <jsp:forward page="Veiwuserprofile.jsp">
			<jsp:param value="Changepassword.jsp" name="page"/>
			<jsp:param value="<%=msg %>" name="msg"/>
			</jsp:forward>
			<%
		}else{
			%><jsp:forward page="Companyprofile.jsp"></jsp:forward>
			<%
		}
	%>
</body>
</html>