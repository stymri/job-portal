
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="login.css">
<title>Login page</title>
</head>
<body bgcolor=#aaaacc>
	<%
	String use = request.getParameter("use");
		String msg = request.getParameter("msg");
	if (msg == null) {
		msg = "";
	}
	%>
	<jsp:include page="Header.html"></jsp:include>
		<div class="login">
		<h2><%=use %> Login</h2>
		<h3><%=msg%></h3>
		<form action="<%=use %>" method="post">
			<table>
				<tr>
					<td>Mail</td>
					<td><input type="mail" name="mail"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="LOGIN"
						style="padding: 2px 10px;"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>