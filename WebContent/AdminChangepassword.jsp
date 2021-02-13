<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>Change password</title>
</head>
<body>
<%
		String adminmail = (String) session.getAttribute("adminmail");
		if (adminmail != null) {
	%>
	<jsp:include page="adminheader.html"></jsp:include>
	<%
		} else {
	%>
	<jsp:forward page="Login.jsp?use=admin"></jsp:forward>
	<%
		}
		String msg =request.getParameter("msg");
		%>
		<div class="admin">
		<jsp:include page="Changepasswordveiw.jsp">
		<jsp:param value="admin" name="user"/>
		<jsp:param value="<%=msg %>" name="msg"/>
		</jsp:include>
		</div>
</body>
</html>