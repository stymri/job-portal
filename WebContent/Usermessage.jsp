<%@page import="user.MessageBean"%>
<%@page import="java.util.Vector"%>
<%@page import="user.MessageController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="usersytle.css">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<style type="text/css">

</style>
<title>Message</title>
</head>
<body>
	<div>
		<%
			String mail = (String) session.getAttribute("usermail");
			//String	mail ="satyam";
			if (mail != null) {
		%>
		<jsp:include page="Userheader.html"></jsp:include>
		<%
			} else {
				out.print("login again");
		%>
		<jsp:forward page="login.html"></jsp:forward>
		<%
			}
		%>
	</div>
	<%
	String msg  = request.getParameter("msg");
	if(msg==null){
		msg = "";
	}
		int index = Integer.parseInt(request.getParameter("index"));
		MessageBean mb;
		MessageController mc = new MessageController();
		Vector<MessageBean> mls = mc.veiwmessages(mail);
		int size = mls.size();
	%>
	<div class="oreintation" style="background-color: #b1d9f2;">
		<div class="msg">
			Total Message :
			<%=size%></div>
			<span class="msg"><%=msg%></span>
		<%
			int no = size / 20;
			for (int i = index; i < size && i < 21; i++) {
				mb = mls.elementAt(i);
		%>
		<div class="block">
			<div style="font-size: 1.2em;">
				<p>
					This message for job reference number<%=mb.getJobid()%></p>
			</div>
			<hr>
			<div style="margin: 10px;">
				<p><%=mb.getMsg()%></p>
				<div class="selection">
	<div class="left"><a class="box" href="Deletemessage.jsp?id=<%=mb.getJobid()%>&deleted=<%=mb.isDeleted()%>&index=<%=index%>">Delete message</a></div>
	<div class="right"><a href="Jobdetail.jsp?id=<%=mb.getJobid()%>&value=false" class="box">Veiw Job detail</a></div>
	</div>
			</div>
		</div>
		<%
			}
		%>
		<div style="background-color: #3589C8; margin: 0% 40%; padding: 5px;">
			<%
				if (index != 0) {
			%>
			<a
				href="Usermessage.jsp?index=<%=index - 20%>">prev</a>
			<%
				}
				for (int j = 0; j < no + 1; j++) {
			%><a
				href="Usermessage.jsp?index=<%=j * 20%>"><%=j%></a>
			<%
				}
				if (index + 10 < size) {
			%><a
				href="Usermessage.jsp?index=<%=index + 20%>&">next</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>