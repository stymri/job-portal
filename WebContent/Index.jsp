<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
.register {
	min-width: 125px;
	background-color: red;
	padding: 10px;
	border-radius: 10px;
}
.register:HOVER{
background: transparent;
}
.job {
	width: 250px;
	margin:20px;
}
.link{
color:blue;
}
.link:HOVER {
	color:red;
}
</style>
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Search.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>Insert title here</title>
</head>
<body>
	<div class="topbar">
		<div class="fixed">
			<div style="padding: 4px 100px;">
				JOBS FOR YOU
				<div style="float: right;">
					<a href=aboutus.html class="header">About Us</a>
				</div>
			</div>
		</div>
		<div style="float: left;"><jsp:include page="Jobsearch.jsp"></jsp:include></div>
		<div style="float: right;">
			<div style="margin: 10px;">
				<h4 style="color: purple;">LOGIN as</h4>
				<form action="Login.jsp">
					<select name="use">
						<option selected="selected">User</option>
						<option>Company</option>
						<option>Admin</option>
					</select> <input type="submit" value="LOGIN" class="add">
				</form>
			</div>
		</div>
	</div>
	<div style="padding: 50px;">
		<table style="width: 500px;">
			<tr>
				<td><img src="Images\Index1.png"
					style="margin: 0px; min-width: 500px;"></td>
				<td>
					<table>
						<tr>
							<td><h1 Style="color: blue; font-size: 2.1em;">Empowering</h1>
							<td>
						</tr>
						<tr>
							<td><h1
									Style="color: red; font-size: 2.0em; font-style: italic;">Young</h1>
								<h1 Style="color: blue; font-size: 2.1em; font-style: italic;">India</h1></td>
						</tr>
						<tr>
							<td><div class="register">
									<a href="Registration.jsp"
										style="color: white; font-size: 1.5em;"> REGISTER <sub>with
											us</sub></a>
								</div></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table><tr><td>
		<div class="job">
			<h4 Style="color: red; font-size: 1.5em; font-style: italic;">
				Job By Location</h4>
			<hr>
			<table>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=&state=delhi&index=0" class="link">Delhi</a></td>
					<td><a href="Veiwjob.jsp?keyword=&state=Maharashtra&index=0" class="link">Maharashtra</a></td>
				</tr>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=&state=Harayana&index=0" class="link">Harayana</a></td>
					<td><a href="Veiwjob.jsp?keyword=&state=Bihar&index=0" class="link">Bihar</a></td>
				</tr>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=&state=Uttar+pradesh&index=0" class="link">Uttar
							Pradesh</a></td>
					<td><a href="Veiwjob.jsp?keyword=&state=Punjab&index=0" class="link">Punjab</a></td>
				</tr>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=&state=Punjab&index=0" class="link">Rajasthan</a></td>
					<td><a href="Veiwjob.jsp?keyword=&state=Madhya+pradesh&index=0" class="link">Madhya
							Pradesh</a></td>
				</tr>
			</table>
		</div>
		</td><td>
<div class="job">
			<h4 Style="color: red; font-size: 1.5em; font-style: italic;">
				Job By Industry</h4>
			<hr>
			<table>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=Computer&state=&index=0" class="link">Computer</a></td>
					<td><a href="Veiwjob.jsp?keyword=Management&state=&index=0" class="link">Management</a></td>
				</tr>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=Mechanical&state=&index=0" class="link">Mechanical</a></td>
					<td><a href="Veiwjob.jsp?keyword=Civil&state=&index=0" class="link">Civil</a></td>
				</tr>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=Hotel+management&state=&index=0" class="link">Hotel Management</a></td>
					<td><a href="Veiwjob.jsp?keyword=Automobile&state=&index=0" class="link">Automobile</a></td>
				</tr>
				<tr>
					<td><a href="Veiwjob.jsp?keyword=Security&state=&index=0" class="link">Security</a></td>
					<td><a href="Veiwjob.jsp?keyword=Call+center&state=&index=0" class="link">Call center</a></td>
				</tr>
			</table>
		</div>
		</td></tr></table>
	</div>
</body>
</html>