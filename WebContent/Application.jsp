<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="companystyle.css">
<style type="text/css">
#actionfor{
padding : 20px 30px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<%
		boolean acted;
			String cmail = (String) session.getAttribute("cmail");
			String usermail = request.getParameter("mail");
			int id = Integer.parseInt(request.getParameter("id"));
			String msg = request.getParameter("msg");
			if(msg==null || msg.equalsIgnoreCase("")){
				acted = false;
				msg="";
			}else{
				acted = true;
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
	<div class="oreintation">
	<h2><%=msg %></h2>
		<jsp:include page="Userprofile.jsp">
			<jsp:param value="<%=usermail%>" name="usermail" />
			<jsp:param value="false" name="user" />
		</jsp:include>
		<jsp:include page="Usereducation.jsp">
			<jsp:param value="<%=usermail%>" name="usermail" />
			<jsp:param value="false" name="user" />
		</jsp:include>
		<jsp:include page="Userexperience.jsp">
			<jsp:param value="<%=usermail%>" name="usermail" />
			<jsp:param value="false" name="user" />
		</jsp:include>
	</div>
	<% if(!acted){ %>
	<div class="selection">
	<div class="left"><a href="Shortlistapp.jsp?id=<%=id%>&mail=<%=usermail%>&shor=yes">Shortlist Application</a></div>
	<div class="right"><a href="Shortlistapp.jsp?id=<%=id%>&mail=<%=usermail%>&shor=no">Delete Application</a></div>
	</div>
	<%} %>
</body>
</html>