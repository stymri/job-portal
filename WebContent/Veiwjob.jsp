<%@page import="java.util.Vector"%>
<%@page import="admin.Jobean"%>
<%@page import="admin.Jobcontroller"%>
<%@page import="java.lang.Integer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="usersytle.css">
<style type="text/css">
body {
	background-color: #555999;
}
</style>
<title>VIEW JOBs</title>
</head>
<body>
	<div>
		<%
			String mail = (String) session.getAttribute("usermail");
			if (mail != null) {
		%>
		<jsp:include page="Userheader.html"></jsp:include>
		<%
			} else {
		%>
		<jsp:include page="Header.html"></jsp:include>
		<jsp:include page="Jobsearch.jsp"></jsp:include>
		<%
			}
		%>
	</div>
<%-- 	<div style="margin-top: 100px;">
		<jsp:include page="Jobsearch.html"></jsp:include>
	</div> --%>
	<%
		String keyword = null;
		String state = null;
		int index = 0;
		String sortby = null;
		try {
			keyword = request.getParameter("keyword");
			state = request.getParameter("state");
			index = Integer.parseInt(request.getParameter("index"));
			sortby = request.getParameter("sortby");
		} catch (Exception e) {
			if (state.equals("")) {
				state = "xxx";
			}
			if (sortby.equals("")) {
				sortby = "lastdate";
			}
		}
		%>
		<% 
		Jobcontroller jbc = new Jobcontroller();
		Jobean jbi;
		Vector<Jobean> jb = jbc.getjob(keyword, state, sortby);

		int size = jb.size();
		/* out.print(size); */
		%>
		<h4>Total search result : <%=size %></h4>
		<% 
		int no = size / 10;
		for (int i = index; i < size && i < 11; i++) {
			jbi = jb.elementAt(i);
	%>
	<div class="block">
		<div style="font-size: 1.5em;"><%=jbi.getName()%></div>
		<div style="margin: 10px;">
			<%=jbi.getCategory()%><br>
			<%=jbi.getInfo()%>
			<br><%=jbi.getSalary()%><br> <a
				href="Jobdetail.jsp?id=<%=jbi.getId()%>&value=true">APPLY Job</a>
		</div>
	</div>
	<%
		}
	%>
	<div style="background-color:  #3589C8; margin: 0% 40%; padding: 5px;">
		<%
			if (index != 0) {
		%>
		<a
			href="Veiwjob.jsp?keyword=<%=keyword%>&index=<%=index - 10%>&state=<%=state%>&sortby=<%=sortby%>">prev</a>
		<%
			}
			for (int j = 0; j < no + 1; j++) {
		%><a
			href="Veiwjob.jsp?keyword=<%=keyword%>&index=<%=j * 10%>&state=<%=state%>&sortby=<%=sortby%>"><%=j%></a>
		<%
			}
			if (index + 10 < size) {
		%><a
			href="Veiwjob.jsp?keyword=<%=keyword%>&index=<%=index + 10%>&state=<%=state%>&sortby=<%=sortby%>">next</a>
		<%
			}
		%>
	</div>
</body>
</html>