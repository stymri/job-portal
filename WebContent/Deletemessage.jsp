<%@page import="user.MessageController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<%
		String mail = (String) session.getAttribute("usermail");
		//String	mail ="satyam";
		if (mail == null) {
			out.print("login again");
	%>
	<jsp:forward page="login.html"></jsp:forward>
	<%
		}
		String msg;
		int index = Integer.parseInt(request.getParameter("index"));
		int jobid = Integer.parseInt(request.getParameter("id"));
		String deleted = request.getParameter("deleted");
		MessageController mc = new MessageController();
		int x = mc.delete(mail, deleted, jobid);
		if(x==1){
			msg = "message deleted";
		}else{
			msg = "message not deleted";
		}
	%>
	<jsp:forward page="Usermessage.jsp">
	<jsp:param value="<%=msg %>" name="msg"/>
	<jsp:param value="<%=index %>" name="index"/>
	</jsp:forward>
</body>
</html>