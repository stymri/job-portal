<%@page import="user.Usercontroller"%>
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
String msg;
String usermail = request.getParameter("mail");
String searchmail =request.getParameter("searchmail");
String name = request.getParameter("name");
String sortby = request.getParameter("sortby");
String	index = request.getParameter("index");
Usercontroller uc = new Usercontroller();
int x = uc.delete(usermail);
if(x==0){
	msg="User not deleted";
}else{
	msg = "User Deleted";
}
%>
<jsp:forward page="AdminVeiwUsers.jsp">
<jsp:param value="<%=searchmail %>" name="mail"/>
<jsp:param value="<%=name %>" name="name"/>
<jsp:param value="<%=sortby %>" name="sortby"/>
<jsp:param value="<%=index %>" name="index"/>
<jsp:param value="<%=msg %>" name="msg"/>
</jsp:forward>
</body>
</html>