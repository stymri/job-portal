<%@page import="company.Applicationcontroller"%>
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
		String usermail = request.getParameter("mail");
		String msg;
		int id = Integer.parseInt(request.getParameter("id"));
		String shor = request.getParameter("shor");
		Applicationcontroller appc = new Applicationcontroller();
		if (shor.equalsIgnoreCase("yes")) {
			msg = appc.shortlist(usermail, id);
		}else{
			msg = appc.deleted(usermail, id);
		}
	%>
	<jsp:forward page="Application.jsp">
		<jsp:param value="<%=usermail%>" name="mail" />
		<jsp:param value="<%=id%>" name="id" />
		<jsp:param value="<%=msg%>" name="msg" />
	</jsp:forward>
</body>
</html>