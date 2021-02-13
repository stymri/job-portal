<%@page import="company.Companycontroller"%>
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
		int index;
		String mail = request.getParameter("mail");
		String cmail = request.getParameter("cmail");
		String name = request.getParameter("name");
		String sortby = request.getParameter("sortby");
		try {
			index = Integer.parseInt(request.getParameter("index"));
		} catch (Exception e) {
			e.printStackTrace();
			index = 0;
		}
		Companycontroller cc = new Companycontroller();
		String msg = cc.deletecompany(cmail);
	%>
	<jsp:forward page="AdminSearchCompany.jsp">
		<jsp:param value="<%=mail%>" name="mail" />
		<jsp:param value="<%=name%>" name="name" />
		<jsp:param value="<%=sortby%>" name="sortby" />
		<jsp:param value="<%=msg%>" name="msg" />
	</jsp:forward>
</body>
</html>