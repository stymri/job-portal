<%@page import="admin.Jobean"%>
<%@page import="admin.Jobcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Search.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>Job details</title>
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
		int id = Integer.parseInt(request.getParameter("id"));
		String keyword = request.getParameter("keyword");
		String sortby = request.getParameter("sortby");
		String index = request.getParameter("index");
		Jobcontroller jbc = new Jobcontroller();
		Jobean jb = jbc.getjobean(id);
	%>
	<div class="block">
		<h2><%=jb.getId()%>
			:	<%=jb.getName()%></h2>
		<div class="inner">
			Company mail :
			<%=jb.getCmail()%><br> Category :
			<%=jb.getCategory()%><br>
			<p><%=jb.getInfo()%></p>
	 Salary :<%=jb.getSalary()%><br> Last date :
			<%=jb.getLastdate()%><br> State :
			<%=jb.getState()%>
			<hr>
			Criteria <br>
			<%=jb.getCriteria()%><br>
			<div class= "oreintation">
			<div class="oreintation">
			<div class="right">
				<a href="Admindeletejob.jsp?id=<%=id %>&keyword=<%=keyword %>&sortby=<%=sortby%>&index=<%=index%>">Delete job</a>
			</div>
			</div>
			</div>
		</div>
</body>
</html>