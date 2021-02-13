<%@page import="java.util.Vector"%>
<%@page import="admin.Applyjobcontroller"%>
<%@page import="admin.Jobean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="usersytle.css">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%
			String mail = (String) session.getAttribute("usermail");
			//String	mail ="satyam";
			if (mail != null) {
		%>
		<jsp:include page="Userheader.html"></jsp:include>
		<%
			} else {
		%>
		<jsp:forward page="Login.jsp">
		<jsp:param value="User" name="use"/>
		<jsp:param value="login again" name="msg"/>
		</jsp:forward>
		<%
			}
		%>
	</div>
	<%
		Jobean jb;
		Applyjobcontroller jbc = new Applyjobcontroller();
		Vector<Jobean> ls = jbc.veiwjobs(mail);
		int size = ls.size();
		if (size == 0) {
	%>
	<div class="msg" style="margin:25%;">No jobs are applied by you</div>
	<%}
		/* out.print(size); */
		for (int i = 0; i < size; i++) {
			jb = ls.get(i);
	%>
	<div class="block">
		<div style="font-size: 1.5em;"><%=jb.getName()%></div>
		<div style="margin: 10px;">
			<%=jb.getCategory()%><br>
			<%=jb.getInfo()%>
			<br><%=jb.getSalary()%><br> <a
				href="Jobdetail.jsp?id=<%=jb.getId()%>&value=false">MORE details</a>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>