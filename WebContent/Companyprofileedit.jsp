<%@page import="common.Address"%>
<%@page import="company.CompanyBean"%>
<%@page import="company.Companycontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	Address add = cb.getAdd();
	%>
	<div class="profile">
					<h2>Edit detail</h2>
					<form action="Companyedit.jsp" method="post">
					<table style="padding: 10px 50px; text-align: right;">
						<tr>
							<td>Name:</td>
							<td class="green"><input type="text" value="<%=cb.getName()%>" name="name"></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td class="green"><%=cb.getMail()%></td>
						</tr>
						<tr>
							<td>phone number:</td>
							<td class="green"><input type="text" value="<%=cb.getPhno()%>" name="phno"></td>
						</tr>
						<tr>
							<td>Information:</td>
							<td class="green"><input type="text" value="<%=cb.getInfo()%>" name="info"></td>
						</tr>
						<tr>
							<td>Website:</td>
							<td class="green"><input type="text" value="<%=cb.getLink()%>" name="link"></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td class="green"><input type="text" value="<%=add.getAddress()%>" name="address"></td>
						</tr>
						<tr>
							<td>City:</td>
							<td class="green"><input type="text" value="<%=add.getCity()%>" name="city"></td>
						</tr>
						<tr>
							<td>State:</td>
							<td class="green"><input type="text" value="<%=add.getState()%>" name="state"></td>
						</tr>
						<tr>
							<td>Pin:</td>
							<td class="green"><input type="text" value="<%=add.getPin()%>" name="pin"></td>
						</tr>
						<tr><td></td><td><input type="submit" value="UPDATE"></td></tr>
					</table>
					</form>
				</div>
</body>
</html>