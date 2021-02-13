<%@page import="user.Usercontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonsytle.css">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ub" class="user.UserBean"></jsp:useBean>
	<%
	String usermail = request.getParameter("usermail");	
	String user = request.getParameter("user");
	Usercontroller uc = new Usercontroller();
		ub = uc.getuser(usermail);
	%>
				<div class="profile">
					<h2>Profile</h2>
					<table style="padding: 10px 50px; text-align: right;">
						<tr>
							<td>Name:</td>
							<td class="green"><%=ub.getName()%></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td class="green"><%=ub.getEmail()%></td>
						</tr>
						<tr>
							<td>phone number:</td>
							<td class="green"><%=ub.getPhno()%></td>
						</tr>
						<tr>
							<td>sex:</td>
							<td class="green"><%=ub.getSex()%></td>
						</tr>
						<tr>
							<td>address:</td>
							<td class="green"><%=ub.getAdd()%></td>
						</tr>
						<tr>
							<td>Date of birth:</td>
							<td class="green"><%=ub.getSDob()%></td>
						</tr>
						<tr>
							<td><br> <br></td>
							<td><br> <br></td>
						</tr>
						<%
						  if(user.equalsIgnoreCase("true")){
						%>
						<tr>
							<td><a href="Registration.jsp">Edit Profile</a></td>
							<td><a href="Veiwuserprofile.jsp?page=Changepasswordveiw.jsp">Change Password</a></td></tr>
							<%} %>
					</table>
				</div>
</body>
</html>