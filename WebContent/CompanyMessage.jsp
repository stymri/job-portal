<%@page import="company.Applicationcontroller"%>
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
		String msg = request.getParameter("msg");
		int id = Integer.parseInt(request.getParameter("id"));
		int index = Integer.parseInt(request.getParameter("index"));
		Applicationcontroller appc = new Applicationcontroller();
        System.out.println(msg);
		int x =appc.messageto(id, msg);
		if(x==0){
			msg = "message not sent"; 
		}else{
			msg ="message sent to shortlisted candidate";
		}
	%>
	<jsp:forward page="Veiwapplication.jsp">
	<jsp:param value="<%=msg %>" name="msg"/>
	<jsp:param value="<%=id %>" name="id"/>
	<jsp:param value="<%=index %>" name="index"/>
	<jsp:param value="true" name="selected"/>
	</jsp:forward>
</body>
</html>