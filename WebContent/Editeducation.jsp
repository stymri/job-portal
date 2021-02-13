<%@page import="common.UserbreifController"%>
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

td {
	text-align: right;
}

.red {
	color: red;
	font-size: 1.2em;
	text-align: right;
	padding: 5px 20px;
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
		 	<%
			}
		%>
		<jsp:include page="Userheader.html"></jsp:include>
		
	</div>
	<%
		String type = request.getParameter("type");
		String expname = request.getParameter("expname");
		String educational = request.getParameter("edu");
		Userexpcontroller uec = new Userexpcontroller();
		UserbreifController ubc = new UserbreifController();
		int sno;
		Userexp ue = new Userexp();
		Address add = new Address();
		boolean is, edit;
		if (type.equalsIgnoreCase("") | expname.equalsIgnoreCase("")) {
			edit = false;
		} else {
			edit = true;
		}
		if (edit) {
			ue = uec.getexp(mail, type, expname);
			add = ue.getAdd();
			sno = ue.getSno();
		}else{
			sno = ubc.getMaxsno(mail, educational);
		}
		if (educational.equalsIgnoreCase("y")) {
			is = true;
		} else {
			is = false;
		}
	%>
	<table>
		<tr>
			<td id="menu"><jsp:include page="Profilemenu.html"></jsp:include></td>
			<td>
				<div class="profile">
					<form action="Edituserexp.jsp" method="post">
						<%
							if (edit) {
								if (is) {
						%><h2>EDIT EDUCATIONAL DETAILs :</h2>
						<%
							} else {
						%><h2>EDIT EXPERIENCE DETAILs :</h2>
						<%
							}
							} else {
								//sno = uec.getMaxsno(mail,educational);
								//created a function in userexpcontroller to find max sno
								if (is) {
						%><h2>Add EDUCATIONAL DETAILs :</h2>
						<%
							} else {
						%><h2>Add EXPERIENCE DETAILs :</h2>
						<%
							}
							}
						%>
						<input type="hidden" name="ptype" value=<%=type%>> 
						<input type="hidden" name="pexpname" value=<%=expname%>> 
						<input type="hidden" name="educational" value=<%=educational%>>
						<input type="hidden" name="sno" value=<%=sno %>>
						<table>
							<tr>
								<td class="red">
									<%
										if (is) {
									%>Qualification : <%
										} else {
									%>Destination : <%
										}
									%>
								</td>
								<td><input type="text" name="type" required="required"
									<%if (edit) {%> value=<%=ue.getType()%> <%}%>></td>
							</tr>
							<tr>
								<td class="red">
									<%
										if (is) {
									%>Institute name : <%
										} else {
									%>Company name : <%
										}
									%>
								</td>
								<td><input type="text" name="from" required="required"
									<%if (edit) {%> value=<%=ue.getWhere()%> <%}%>></td>
							</tr>
							<tr>
								<td class="red">
									<%
										if (is) {
									%>Percentage : <%
										} else {
									%>Number of years: <%
										}
									%>
								</td>
								<td><input type="number" name="percent" required="required"
									<%if (edit) {%> value=<%=ue.getPercentage()%> <%}%>></td>
							</tr>
							<tr>
								<td class="red">
									<%
										if (is) {
									%>Institute Address : <%
										} else {
									%>Company Address : <%
										}
									%>
								</td>
								<td><input type="text" name="add" required="required"
									<%if (edit) {%> value=<%=add.getAddress()%> <%}%>></td>
							</tr>
							<tr>
								<td class="red">City :</td>
								<td><input type="text" name="city" required="required"
									<%if (edit) {%> value=<%=add.getCity()%> <%}%>></td>
							</tr>
							<tr>
								<td class="red">State:</td>
								<td><input type="text" name="state" required="required"
									<%if (edit) {%> value=<%=add.getState()%> <%}%>></td>
							</tr>
							<tr>
								<td class="red">Pin code:</td>
								<td><input type="text" name="pin" required="required"
									<%if (edit) {%> value=<%=add.getPin()%> <%}%>></td>
							</tr>
							<tr>
								<td></td>
								<td style="padding: 20px;"><input type="submit"
									<%if (edit) {%> value="UPDATE" <%} else {%> value="ADD DETAIL">
									<%
										}
									%></td>
							</tr>
						</table>
					</form>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>