<%@page import="company.CompanyBean"%>
<%@page import="company.Companycontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="companystyle.css">
<title>Company Profile</title>
</head>
<body>
<div>
		<%
			String cmail = (String) session.getAttribute("cmail");
			if (cmail != null) {
		%>
		<jsp:include page="cheader.html"></jsp:include>
		<%
			} else {
		%>
		<jsp:forward page="Login.jsp">
		<jsp:param value="Company" name="use"/>
			<jsp:param value="login again" name="msg" />
		</jsp:forward>
		<%
			}
		%>
	</div>
	<%
	Companycontroller cc = new Companycontroller();
	CompanyBean cb = cc.getcompanyunsure(cmail);
	%>
	<div class="profile">
					<h2>Profile</h2>
					<table style="padding: 10px 50px; text-align: right;">
						<tr>
							<td>Name:</td>
							<td class="green"><%=cb.getName()%></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td class="green"><%=cb.getMail()%></td>
						</tr>
						<tr>
							<td>phone number:</td>
							<td class="green"><%=cb.getPhno()%></td>
						</tr>
						<tr>
							<td>Information:</td>
							<td class="green"><%=cb.getInfo()%></td>
						</tr>
						<tr>
							<td>Website:</td>
							<td class="green"><%=cb.getLink()%></td>
						</tr>
						<tr>
							<td>address:</td>
							<td class="green"><%=cb.getAdd()%></td>
						</tr>
						<tr>
							<td><a href="Companyprofileedit.jsp">Edit Profile</a></td>
							<td><a href="Changepassword.jsp">Change Password</a></td></tr>
					</table>
				</div>
</body>
</html>