<%@page import="java.util.Vector"%>
<%@page import="user.Userexp"%>
<%@page import="user.Userexpcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonsytle.css">
<title>Insert title here</title>
</head>
<body>
	<div class="profile">
		<%
			String usermail = request.getParameter("usermail");
			String user = request.getParameter("user");
			Userexpcontroller uec = new Userexpcontroller();
			Userexp ue;
			Vector<Userexp> ls;
			ls = uec.getUserexp(usermail, "n");
			if (!ls.isEmpty()) {
		%>

		<h2>Experience details</h2>
		<table bordercolor="red" border=2; style="margin: 10px;">
			<tr>
				<td>POST/ Desgination</td>
				<td>Company</td>
				<td>Address</td>
				<td>Number of years</td>
			</tr>
			<%
				for (int j = 0; j < ls.size(); j++) {
						ue = ls.get(j);
			%><tr>
				<td class="green">
					<div class="wide">
						<%=ue.getType()%>
					</div>
				</td>
				<td class="green"><div class="wide"><%=ue.getWhere()%></div></td>
				<td class="green"><div class="wide"><%=ue.getAdd()%></div></td>
				<td class="green"><div class="wide"><%=ue.getPercentage()%></div>
				<%if(user.equalsIgnoreCase("true")){%>
				<td><a href="Editeducation.jsp?edu=<%=ue.getEducational()%>&type=<%=ue.getType()%>&expname=<%=ue.getWhere()%>">EDIT</a></td></td>
			<%} %>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>
		<p>NO experience detail available</p>
		<%
			}
		%>
		<%if(user.equalsIgnoreCase("true")){%>
		<div style="margin: 20px;">
			<a href="Editeducation.jsp?edu=n&type=&expname=">Add experience</a>
		</div>
		<%} %>
	</div>
</body>
</html>