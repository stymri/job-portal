<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Search.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>User detail </title>
</head>
<body>
<%
String usermail = request.getParameter("mail");
String searchmail =request.getParameter("searchmail");
String name = request.getParameter("name");
String sortby = request.getParameter("sortby");
String	index = request.getParameter("index");
%>
<jsp:include page="adminheader.html"></jsp:include>
<div class="oreintation">
		<jsp:include page="Userprofile.jsp">
			<jsp:param value="<%=usermail%>" name="usermail" />
			<jsp:param value="false" name="user" />
		</jsp:include>
		<div class="right"><a href="DeleteUser.jsp?mail=<%=usermail%>&searchmail=<%=usermail%>&name=<%=name%>&sortby=<%=sortby%>&index=<%=index%>">Delete User</a></div>
		<jsp:include page="Usereducation.jsp">
			<jsp:param value="<%=usermail%>" name="usermail" />
			<jsp:param value="false" name="user" />
		</jsp:include>
		<jsp:include page="Userexperience.jsp">
			<jsp:param value="<%=usermail%>" name="usermail" />
			<jsp:param value="false" name="user" />
		</jsp:include>
	</div>
</body>
</html>