<%@page import="company.CompanyBean"%>
<%@page import="company.Companycontroller"%>
<%@page import="admin.Jobean"%>
<%@page import="admin.Jobcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="usersytle.css">
<style type="text/css">
.inner {
	margin: 10px;
	width: 95%;
	padding: 5px;
}

.hidden {
	border: 2px black solid;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		String mail = (String) session.getAttribute("usermail");
		if (mail != null) {
	%>
	<jsp:include page="Userheader.html"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="Header.html"></jsp:include>
	<%
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String value = request.getParameter("value");
		Jobcontroller jbc = new Jobcontroller();
		Jobean jb = jbc.getjobean(id);
		String cmail = jb.getCmail();
		Companycontroller cc = new Companycontroller();
		CompanyBean cb = cc.getcompanyunsure(cmail);
	%>
	<div class="block">
		<h2><%=jb.getName()%></h2>
		<div class="inner">
			<%=jb.getInfo()%>
			<br> Salary<%=jb.getSalary()%><br> Last date :
			<%=jb.getLastdate()%><br>
			<hr>
			Criteria <br>
			<%=jb.getCriteria()%><br>
			<div class="hidden">
				COMPANY DETAILS <br><%=cb.getName()%>
				<br><%=cb.getPhno()%>
				<br><%=cb.getAdd()%>
				<br>for more information <a href="<%=cb.getLink()%>"><%=cb.getLink()%></a>
			</div>
		</div>
		<%
			if (value.equalsIgnoreCase("true")) {
		%>
		<a href="Applyjob?id=<%=jb.getId()%>">APPLY NOW</a>
		<%
			}
		%>
	</div>
</body>
</html>