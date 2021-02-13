<%@page import="company.CompanyBean"%>
<%@page import="company.Companycontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Search.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>Company Detail</title>
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
		int index;
		String mail = request.getParameter("mail");
		String cmail = request.getParameter("cmail");
		String name = request.getParameter("name");
		String sortby = request.getParameter("sortby");
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(Exception e){
			e.printStackTrace();
			index = 0;
		}
		Companycontroller cc = new Companycontroller();
		CompanyBean cb = cc.getcompanyunsure(cmail);
		%><div class="admin">
		<div class="block">
			<h2><%=cb.getName()%></h2>
			<div class="inner">
				Company mail :
				<%=cb.getMail()%><br>
				Phone number :<%=cb.getPhno()%><br>
				<p><%=cb.getInfo()%></p>
		 Website :<%=cb.getLink()%><br>
		  Address :<%=cb.getAdd()%>
				<div class= "oreintation">
				<div class="oreintation">
				<div class="right">
					<a href="Admindeletecompany.jsp?mail=<%=mail %>&cmail=<%=cmail %>&sortby=<%=sortby%>&index=<%=index%>">Delete job</a>
				</div>
				</div>
				</div>
			</div>
			</div>
</div>
</body>
</html>