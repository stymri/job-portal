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
        String keyword = request.getParameter("keyword");
        String sortby = request.getParameter("sortby");
        String index = request.getParameter("index");
		Jobcontroller jbc = new Jobcontroller();
		boolean is = jbc.deletejob(id);
		String msg;
		if (is) {
			msg = "job deleted";
		} else {
			msg = "job not deleted";
		}
	%>
	<jsp:forward page="Adminjobsearch.jsp">
	<jsp:param value="<%=keyword %>" name="keyword"/>
	<jsp:param value="<%=sortby %>" name="sortby"/>
	<jsp:param value="<%=index %>" name="index"/>
	</jsp:forward>
</body>
</html>