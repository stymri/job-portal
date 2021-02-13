
<%@page import="admin.Jobcontroller"%>
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
		int id = Integer.parseInt(request.getParameter("id"));
		String selected = request.getParameter("selected");
		Jobcontroller jbc = new Jobcontroller();
		boolean is = jbc.deletejob(id);
		String msg;
		if (is) {
			msg = "job deleted";
		} else {
			msg = "job not deleted";
		}
	%>
	<jsp:forward page="Companyjobs.jsp">
		<jsp:param value="0" name="index" />
		<jsp:param value="<%=selected%>" name="selected" />
		<jsp:param value="<%=msg%>" name="msg" />
	</jsp:forward>
</body>
</html>