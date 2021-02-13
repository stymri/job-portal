<%@page import="admin.Jobcontroller"%>
<%@page import="admin.Jobean"%>
<%@page import="common.Dategetter"%>
<%@page import="java.time.format.DateTimeFormatterBuilder"%>
<%@page import="java.sql.Date"%>
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
	String msg;
		String cmail = (String) session.getAttribute("cmail");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String criteria = request.getParameter("criteria");
		String salary = request.getParameter("salary");
		String infomation = request.getParameter("infomation");
		String state = request.getParameter("state");
		String date = request.getParameter("lastdate");
		Date lastdate = Dategetter.toDate(date);
		Jobean jb = new Jobean(cmail,name,category, criteria,lastdate, salary,infomation, state);
		Jobcontroller jbc = new Jobcontroller();
		boolean is = jbc.addjob(jb);
		if(is){
			msg = "job added";
		}else{
			msg = "job not added";
		}
	%>
	<jsp:forward page="Addjobcompany.jsp">
	<jsp:param value="<%=msg %>" name="msg"/>
	</jsp:forward>

</body>
</html>