<%@page import="common.Userbreif"%>
<%@page import="java.util.Vector"%>
<%@page import="admin.Applyjobcontroller"%>
<%@page import="admin.Jobean"%>
<%@page import="admin.Jobcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.inner {
	margin: 10px;
	width: 95%;
	padding: 5px;
}
.hidden {
	border: 2px black solid;
}
tr {
	margin: 0px;
	padding: 0px;
}
.wide {
	padding: 10px 20px;
}
#menu {
	width: 20%;
	height: 100%;
}
.h4 {
	font-size: 125%;
}
.delete{
min-width : 70px;
padding:10px;
margin-left: 45%;
margin-right: 45%;
background-color: rgba(214, 139, 110, 0.5);
border-radius: 30px; 
}
</style>
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="companystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Veiw applications</title>
</head>
<body>
	<div>
		<%
			String cmail = (String) session.getAttribute("cmail");
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
		int id = Integer.parseInt(request.getParameter("id"));
		int index = Integer.parseInt(request.getParameter("index"));
		String selected = request.getParameter("selected");
		String msg = request.getParameter("msg");
		if(msg==null){
			msg="";
		}
		Applyjobcontroller ajbc = new Applyjobcontroller();
		Jobcontroller jbc = new Jobcontroller();
		Vector<Userbreif> ls;
		Jobean jb = jbc.getjobean(id);
	%>
	<div class="block">
		<h2><%=jb.getName()%></h2>
		<div class="inner">
			<%=jb.getInfo()%>
			<br> Salary :
			<%=jb.getSalary()%><br> Last date :
			<%=jb.getLastdate()%><br>
			<hr>
			Criteria <br>
			<%=jb.getCriteria()%><br>
		</div>
	</div>
	<div class="delete">
	<a href="Deletejob.jsp?id=<%=id %>&selected=<%=selected%>">Delete Job</a>
	</div>

	<div class="oreintation">
		<span class="msg"><%=msg %></span>
	<%if(selected.equalsIgnoreCase("true")){
	msg = "Shortlisted Application";
	%>
      <form action="CompanyMessage.jsp">
         <table><tr><td>
         <textarea rows="4" cols="50" name="msg">Enter message to shortlisted candidate</textarea></td>
         </tr>
         <tr><td>
         <input type="hidden" name="id" value="<%=id %>">
         <input type="hidden" name="index" value="<%=index %>">
         <input type="submit" value="Send message"></td>
         </tr>
         </table>
      </form>	
	
	<%}else{msg="";}
	%>
		<%
			int noofapp = ajbc.noofapplications(id,selected);
			int no = noofapp / 20;
		%>
		<h4>
			Total <%if(selected.equalsIgnoreCase("true")){%>Shortlisted<%}%>Applications :
			<%=noofapp%></h4>
		<%
			if (noofapp != 0) {
				Userbreif ub;
			    ls = ajbc.getapplications(id, index,selected);
				int size = ls.size();
		%>
		<div class="companycolor">
			<table bordercolor="red" border=2; style="margin: 10px;" class="app">
				<tr>
					<td>Name</td>
					<td>Qualification</td>
					<td>Experience</td>
					<td>Number of years</td>
				</tr>
				<%
					for (int i = 0; i < size && i < 21; i++) {
							ub = ls.elementAt(i);
				%>
				<tr>
					<td class="green"><div class="wide"><%=ub.getName()%></div></td>
					<td class="green"><div class="wide"><%=ub.getMaxqualification()%></div></td>
					<td class="green"><div class="wide"><%=ub.getExptype()%></div></td>
					<td class="green"><div class="wide"><%=ub.getNoofyear()%></div>
					<td><a href="Application.jsp?mail=<%=ub.getMail()%>&id=<%=id%>&msg=<%=msg%>">VEIW</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<%
			}
		%>
	</div>
	<div style="background-color: #3589C8; margin: 0% 40%; padding: 5px;">
		<%
			if (index != 0) {
		%>
		<a href="Veiwapplication.jsp?id=<%=id%>&index=<%=index - 20%>&selected=<%=selected %>">prev</a>
		<%
			}
			for (int j = 0; j < no; j++) {
		%><a href="Veiwapplication.jsp?id=<%=id%>&index=<%=j * 20%>&selected=<%=selected %>"><%=j%></a>
		<%
			}
			if (index + 20 < noofapp) {
		%><a href="Veiwapplication.jsp?id=<%=id%>&index=<%=index + 20%>&selected=<%=selected %>">next</a>
		<%
			}
		%>
	</div>
</body>
</html>