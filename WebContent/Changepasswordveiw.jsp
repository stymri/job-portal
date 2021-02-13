<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<title>Insert title here</title>
</head>
<body>
	<%
		String msg = request.getParameter("msg");
		String user  = request.getParameter("user");
		String form = "Password.jsp";
		if(user.equalsIgnoreCase("admin")){
			form = "Adminpassword";
		}
		if(msg.equalsIgnoreCase("null")){
			msg = "";
		}
	%>
	<div class="profile">
		<table>
			<tr>
				<td width="5%"></td>
				<td>
					<div class="main">
						<span class="msg"><%=msg%></span>
						<form action="<%=form %>" method="post">
							<table>
								<tr>
									<td>old password:</td>
									<td><input type="password" name="oldpass"> <input
										type="hidden" name="user" value=<%=user%>></td>
								</tr>
								<tr>
									<td>New password:</td>
									<td><input type="password" name="newpass"></td>
								</tr>
								<tr>
									<td>Retype password:</td>
									<td><input type="password" name="repass"></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="change password"></td>
								</tr>
							</table>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>