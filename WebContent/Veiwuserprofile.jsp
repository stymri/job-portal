<%@page import="user.Userexpcontroller"%>
<%@page import="user.Userexp"%>
<%@page import="java.util.Vector"%>
<%@page import="user.Usercontroller"%>
<%@page import="common.Address"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="usersytle.css">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<style type="text/css">
body {
	background-color: #555996;
}
h2 {
	font-size: 1.9em;
}

hr {
	margin: 0px;
	color: red;
}
.wide {
	padding: 10px 20px;
}

#menu {
	width: 20%;
	height: 100%;
}
</style>
<title>Profile</title>
</head>
<body>
	<div>
		<%
			//String mail = "satyam";
			String mail = (String) session.getAttribute("usermail");
			String pageurl = request.getParameter("page");
			String msg = request.getParameter("msg");
			if (mail == null) {
		%>
		 <jsp:forward page="Login.jsp?use=User"></jsp:forward> 
		 <%
			}
		%> 
		<jsp:include page="Userheader.html"></jsp:include>
	</div>
	<table>
		<tr>
			<td id="menu"><jsp:include page="Profilemenu.html"></jsp:include>
			</td>
			<td>
				<jsp:include page="<%=pageurl%>">
				<jsp:param value="<%=mail %>" name="usermail"/>
				<jsp:param value="true" name="user"/>
				<jsp:param value="<%=msg %>" name="msg"/>
				</jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>