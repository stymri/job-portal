<%@page import="java.util.Vector"%>
<%@page import="user.Userexp"%>
<%@page import="user.Userexpcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
			ls = uec.getUserexp(usermail, "y");
			if (!ls.isEmpty()) {
		%>

		<h2>Educational details</h2>
		<table bordercolor="red" border=2; style="margin: 10px;">
			<tr>
				<td>Qualification</td>
				<td>School/institute</td>
				<td>Address</td>
				<td>Percentage</td>
				<td></td>
			</tr>
			<%
				for (int i = 0; i < ls.size(); i++) {
						ue = ls.get(i);
			%><tr>
				<td class="green">
					<div class="wide">
						<%=ue.getType()%>
					</div>
				</td>
				<td class="green"><div class="wide"><%=ue.getWhere()%></div></td>
				<td class="green"><div class="wide"><%=ue.getAdd()%></div></td>
				<td class="green"><div class="wide"><%=ue.getPercentage()%></div></td>
				<%
					if (user.equalsIgnoreCase("true")) {
				%>
				<td><a
					href="Editeducation.jsp?edu=<%=ue.getEducational()%>&type=<%=ue.getType()%>&expname=<%=ue.getWhere()%>">EDIT</a></td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>
		<p>NO educational detail available</p>
		<%
			}
		%>
		<%
			if (user.equalsIgnoreCase("true")) {
		%>
		<div style="margin: 20px;">
			<a href="Editeducation.jsp?edu=y&type=&expname=">Add Education</a>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>