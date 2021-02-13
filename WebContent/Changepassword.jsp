<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change password</title>
</head>
<link rel="stylesheet" type="text/css" href="usersytle.css">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<style type="text/css">
td {
	padding: 10px;
}
</style>
<body>
	<div>
		<%
			String cmail = (String) session.getAttribute("cmail");
		String msg = request.getParameter("msg");
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
	<jsp:include page="Changepasswordveiw.jsp">
	<jsp:param value="<%=msg %>" name="msg"/>
	<jsp:param value="false" name="user"/>
	</jsp:include>
</body>
</html>