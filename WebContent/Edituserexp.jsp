
<%@page import="common.Address"%>
<%@page import="user.Userexpcontroller"%>
<%@page import="user.Userexp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="usersytle.css">
<style type="text/css">
body {
	background-color: #555996;
}

.center {
	margin: 100px;
	text-align: center;
	font-size: 1.8em;
	color: red;
}

h2 {
	font-size: 1.9em;
}

a:visited {
	color: green;
}

a:hover {
	font-size: 150%;
}

#menu {
	width: 20%;
	height: 100%;
}
</style>
<title>EDIT DETAILS</title>
</head>
<body>
	<div>
		<%
			//String mail = "satyam";
			String mail = (String) session.getAttribute("usermail");
			if (mail == null) {
		%>
		 <jsp:forward page="login.html"></jsp:forward> 
		< 	<%
			}
		%> 
		<jsp:include page="Userheader.html"></jsp:include>
	</div>
	<%
		boolean is;
	    int sno = Integer.parseInt(request.getParameter("sno"));
		String ptype = request.getParameter("ptype");
		String expname = request.getParameter("pexpname");
		String educational = request.getParameter("educational");
		String type = request.getParameter("type");
		String from = request.getParameter("from");
		String percent = request.getParameter("percent");
		String address = request.getParameter("add");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pin = request.getParameter("pin");
		Userexpcontroller uec = new Userexpcontroller();
		Address add1 = new Address(address, city, state, pin);
		Userexp ue = new Userexp(mail, educational,sno, type, from, percent, add1);
		if (ptype.equalsIgnoreCase("") | expname.equalsIgnoreCase("")) {
			is = uec.addexperience(ue);
		} else {
			is = uec.setexp(ue, ptype, expname);
		}
		if (is) {
			if (educational.equalsIgnoreCase("y")) {
	%><jsp:forward page="Veiwuserprofile.jsp?page=Usereducation.jsp"></jsp:forward>
	<%
		} else {
	%><jsp:forward page="Veiwuserprofile.jsp?page=Userexperience.jsp"></jsp:forward>
	<%
		}
		} else {
	%>
	<table>
		<tr>
			<td id="menu"><jsp:include page="Profilemenu.html"></jsp:include>
			</td>
			<td>
				<div class="profile">
					<div class="center">UPDATION FAIL</div>
				</div>
			</td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>