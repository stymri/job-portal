<%@page import="common.Userbreif"%>
<%@page import="java.util.Vector"%>
<%@page import="common.UserbreifController"%>
<%@page import="user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Search.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>Veiw User</title>
</head>
<body>
	<%
		String adminmail = (String) session.getAttribute("adminmail");
		if (adminmail != null) {
	%>
	<jsp:include page="adminheader.html"></jsp:include>
	<%
		} else {
	%>
	<jsp:forward page="Login.jsp?use=admin"></jsp:forward>
	<%
		}
	int index;
		String usermail = request.getParameter("mail");
		String name = request.getParameter("name");
		String sortby = request.getParameter("sortby");
		String msg = request.getParameter("msg");
		if(msg==null){
			msg="";
		}
		try{
			index = Integer.parseInt(request.getParameter("index"));
		}catch(Exception e){
			e.printStackTrace();
			index = 0;
		}
        UserbreifController uc = new UserbreifController();
        Vector<Userbreif> ls = uc.searchUser(usermail, name, sortby);
	%>
	<%
			int noofapp = ls.size();
			int no = noofapp / 20;
		%>
		<div class="admin">
		<span class="msg"><%=msg %></span>
		<h4>
			Total Search result user :
			<%=noofapp%></h4>
		<%
			if( noofapp != 0) {
				 Userbreif ub;
		%>
		<div>
			<table bordercolor="red" border=2; style="margin: 10px;" class="app">
				<tr>
	                <td>Mail</td>			
					<td>Name</td>
					<td>Qualification</td>
					<td>Experience</td>
					<td>Number of years</td>
				</tr>
				<%
					for (int i = index; i < noofapp && i < index + 21; i++) {
							ub = ls.elementAt(i);
				%>
				<tr>
				<td class="blue"><div class="wide"><%=ub.getMail()%></div></td>
					<td class="blue"><div class="wide"><%=ub.getName()%></div></td>
					<td class="blue"><div class="wide"><%=ub.getMaxqualification()%></div></td>
					<td class="blue"><div class="wide"><%=ub.getExptype()%></div></td>
					<td class="blue"><div class="wide"><%=ub.getNoofyear()%></div>
					<td><a href="Adminuserdetails.jsp?mail=<%=ub.getMail()%>&searchmail=<%=usermail%>&name=<%=name%>&sortby=<%=sortby%>&index=<%=index%>">VEIW</a></td>
					<td><a href="DeleteUser.jsp?mail=<%=usermail%>&searchmail=<%=usermail%>&name=<%=name%>&sortby=<%=sortby%>&index=<%=index%>">DELETE</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	<div style="background-color: #3589C8; margin: 0% 40%; padding: 5px;">
		<%
			if (index != 0) {
		%>
		<a href="AdminVeiwUsers.jsp?mail=<%=usermail %>&name=<%=name %>&sortby<%=sortby %>&index=<%=index - 20%>">prev</a>
		<%
			}
			for (int j = 0; j < no; j++) {
		%><a href="AdminVeiwUsers.jsp?mail=<%=usermail %>&name=<%=name %>&sortby<%=sortby %>&index=<%=j * 20%>"><%= j%></a>
		<%
			}
			if (index + 20 < noofapp) {
		%><a href="AdminVeiwUsers.jsp?mail=<%=usermail %>&name=<%=name %>&sortby<%=sortby %>&index=<%= index + 20%>">next</a>
		<%
			}}
		%>
	</div>
	</div>
</body>
</html>