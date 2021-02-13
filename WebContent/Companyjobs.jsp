<%@page import="java.util.Vector"%>
<%@page import="admin.Jobean"%>
<%@page import="admin.Jobcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="companystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>POSTED Jobs</title>
</head>
<body>
	<div>
		<%
			String cmail = (String) session.getAttribute("cmail");
		String msg = request.getParameter("msg");
		if(msg==null){
			msg = "";
		}
			if (cmail != null) {
		%>
		<jsp:include page="cheader.html"></jsp:include>
		<%
			} else {
		%>
		<jsp:forward page="Login.jsp">
		<jsp:param value="Company" name="use"/>
			<jsp:param value="login again" name="msg" />
		</jsp:forward>
		<%
			}
		%>
	</div>
	<%   
	      String index = request.getParameter("index");
	String selected = request.getParameter("selected");
	%><span class="msg"><%=msg%></span>
	<jsp:include page="Companyjobveiw.jsp">
	   <jsp:param value="<%=index %>" name="index"/>
	   <jsp:param value="<%=selected %>" name="selected"/>
	   <jsp:param value="<%=cmail %>" name="cmail"/>
	</jsp:include>
</body>
</html>