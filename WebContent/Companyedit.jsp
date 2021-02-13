<%@page import="company.Companycontroller"%>
<%@page import="company.CompanyBean"%>
<%@page import="common.Address"%>
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
		String cmail = (String) session.getAttribute("cmail");
		String name = request.getParameter("name");
		String phno = request.getParameter("phno");
		String info = request.getParameter("info");
		String link = request.getParameter("link");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String pin = request.getParameter("pin");
	    Address add = new Address(address,city,state,pin);
	    CompanyBean cb =new CompanyBean(cmail,name, "password",phno, link,info, add);
	    Companycontroller cc = new Companycontroller();
	    boolean update = cc.update(cb);
	    if(update){
	%><jsp:forward page="Companyprofile.jsp"></jsp:forward>
	<%} else{%><jsp:forward page="Companyprofileedit.jsp"></jsp:forward>               
	<% }%>
</body>
</html>