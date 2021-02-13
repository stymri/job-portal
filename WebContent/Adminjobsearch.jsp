<%@page import="admin.Jobcontroller"%>
<%@page import="admin.Jobean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Search.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>Job search</title>
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
		String msg = request.getParameter("msg");
		if(msg==null){
			msg="";
		}
		String keyword = request.getParameter("keyword");
		String sortby = request.getParameter("sortby");
		int index,id = 0;
		Jobean jbi;
		Vector<Jobean> ls;
		Jobcontroller jbc = new Jobcontroller();
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(Exception e){
			index = 0;
		}
		try {
			id = Integer.parseInt(request.getParameter("jobid"));
			ls = new Vector<Jobean>();
			ls.add(jbc.getjobean(id));
		} catch (Exception e) {
			ls = jbc.getjob(keyword, sortby, "");
		}
		int size = ls.size();
		%>
		<div class="admin">
		<span class="msg"><%=msg %></span>
		<h4>Total search result : <%=size %></h4>
		<%
		if(size !=0){
		int no = size / 20;
		%>
		<table bordercolor="red" border=2; style="margin: 10px;" class="app">
		<th>JOB id</th>
		<th>Company Mail</th>
		<th>Name</th>
		<th>lastdate</th>
		<th>State</th>
		<% 
		for (int i = index; i < size && i < 21; i++) {
			jbi = ls.elementAt(i);
	%>
	<tr><td><%=jbi.getId() %></td>
	<td><%=jbi.getCmail() %></td>
	<td><%=jbi.getName() %></td>
	<td><%=jbi.getLastdate() %></td>
	<td><%=jbi.getState() %></td>
	<td><a href="Adminveiwjob.jsp?id=<%=jbi.getId()%>&keyword=<%=keyword%>&sortby=<%=sortby%>&index=<%=index%>">Veiw</a></td>
	<td><a href="Admindeletejob.jsp?id=<%=id %>&keyword=<%=keyword %>&sortby=<%=sortby%>&index=<%=index%>">Delete</a></td>
	</tr>
	<%
		}
	%>
	</table>
	<div style="background-color:  #3589C8; margin: 0% 40%; padding: 5px;">
		<%
			if (index != 0) {
		%>
		<a
			href="Adminjobsearch.jsp?keyword=<%=keyword%>&index=<%=index - 10%>&sortby=<%=sortby%>">prev</a>
		<%
			}
			for (int j = 0; j < no ; j++) {
		%><a
			href="Adminjobsearch.jsp?keyword=<%=keyword%>&index=<%=j * 10%>&sortby=<%=sortby%>"><%=j%></a>
		<%
			}
			if (index + 10 < size) {
		%><a
			href="Adminjobsearch.jsp?keyword=<%=keyword%>&index=<%=index + 10%>&sortby=<%=sortby%>">next</a>
		<%
			}}
		%>
	</div>
</div>
</body>
</html>