<%@page import="java.util.Vector"%>
<%@page import="admin.Jobean"%>
<%@page import="admin.Jobcontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		int index = 0;
		//index = Integer.parseInt(request.getParameter("index"));
		String indexs = request.getParameter("index");
		String cmail = request.getParameter("cmail");
		String selected = request.getParameter("selected");
		if (indexs != null) {
			index = Integer.parseUnsignedInt(indexs);
		}
		Jobcontroller jbc = new Jobcontroller();
		Jobean jbi;
		Vector<Jobean> jb;
		 jb = jbc.getjob(cmail);
		int size = jb.size();
		/* out.print(size); */
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
				href="Veiwapplication.jsp?id=<%=jbi.getId()%>&index=0&selected=<%=selected%>">Veiw <%if(selected.equalsIgnoreCase("true")){ %>SHORTLISTED<%} %>applications</a>
		</div>
	</div>
	<%
		}
	%>
	<div style="background-color: #3589C8; margin: 0% 40%; padding: 5px;">
		<%
			if (index != 0) {
		%>
		<a href="Companyjobs.jsp?index=<%=index + 10%>&selected=<%=selected%>">prev</a>
		<%
			}
			for (int j = 1; j < no + 1; j++) {
		%><a href="Companyjobs.jsp?index=<%=index + 10%>&selected=<%=selected%>"><%=j%></a>
		<%
			}
			if (index + 10 < size) {
		%><a href="Companyjobs.jsp?index=<%=index + 10%>&selected=<%=selected%>">next</a>
		<%
			}
		%>
	</div>
</body>
</html>