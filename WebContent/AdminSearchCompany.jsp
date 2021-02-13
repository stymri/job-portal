<%@page import="company.CompanyBean"%>
<%@page import="java.util.Vector"%>
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
<title>Search Company</title>
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
		String cmail = request.getParameter("mail");
		String name = request.getParameter("name");
		String sortby = request.getParameter("sortby");
		String msg = request.getParameter("msg");
		if(msg==null){
			msg="";
		}
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(Exception e){
			e.printStackTrace();
			index = 0;
		}
		Companycontroller cc = new Companycontroller();
		Vector<CompanyBean> ls = cc.searchCompany(cmail, name, sortby);
		CompanyBean cb;
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
		<th>Company Mail</th>
		<th>Name</th>
		<th>Phone number</th>
		<th>Website</th>
		<% 
		for (int i = index; i < size && i < 21; i++) {
			cb = ls.elementAt(i);
	%>
	<tr><td><%=cb.getMail() %></td>
	<td><%=cb.getName() %></td>
	<td><%=cb.getPhno() %></td>
	<td><%=cb.getLink() %></td>
	<td><a href="Adminveiwcompany.jsp?cmail=<%=cb.getMail() %>&mail=<%=cmail %>&name=<%=name %>&sortby=<%=sortby%>&index=<%=index%>">Veiw</a></td>
	<td><a href="Admindeletecompany.jsp?cmail=<%=cb.getMail() %>&mail=<%=cmail %>&name=<%=name %>&sortby=<%=sortby%>&index=<%=index%>">Delete</a></td>
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
			href="AdminSearchCompany.jsp?mail=<%=cmail %>&name=<%=name %>&index=<%=index - 10%> &sortby=<%=sortby%>">prev</a>
		<%
			}
			for (int j = 0; j < no ; j++) {
		%><a
			href="AdminSearchCompany.jsp?mail=<%=cmail %>&name=<%=name %>&index=<%=j * 10%>&sortby=<%=sortby%>"><%=j%></a>
		<%
			}
			if (index + 10 < size) {
		%><a
			href="AdminSearchCompany.jsp?mail=<%=cmail %>&name=<%=name %>&index=<%=index + 10%>&sortby=<%=sortby%>">next</a>
		<%
			}}
		%>
	</div>
</body>
</html>