<%@page import="common.Address"%>
<%@page import="user.Usercontroller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="usersytle.css">
<link rel="stylesheet" type="text/css" href="commonsytle.css">
<style type="text/css">
#block {
	background-color: #ffff22;
	padding: 25px;
	border: 2px red dotted;
	border-radius: 150px;
	width: 400px;
}
.left{text-align:left;}
td {
	text-align: right;
}
</style>
<title>User registration</title>
</head>
<body bgcolor=#aaaacc>
	<%
		//String mail = "satyam";
		String mail = (String) session.getAttribute("usermail");
		
		boolean is;
		if (mail == null) {
			is = false;
	%>
	<jsp:include page="Header.html"></jsp:include>
	<%
		} else {
			is = true;
	%>
	<jsp:include page="Userheader.html"></jsp:include>
	<%
		}
	%>
	<div class="fixed" style="padding: 0px 100px 50px 10px;">
		<div id="block">
			<h3 align="center" style="text-size: 2.9em;">User registration</h3>
		<jsp:useBean id="ub" class="user.UserBean"></jsp:useBean>
		<jsp:useBean id="add" class="common.Address"></jsp:useBean>
		<%
		String msg = request.getParameter("msg");
		if(msg==null){
			msg="";
		}
		if(is){
			Usercontroller uc = new Usercontroller();
			ub = uc.getuser(mail);
		    add = ub.getAdd();
		}
		%>
		<span class="msg"><%=msg %></span>
		<form action="Reg" method="post">
			<table style="padding: 10px;">
				<tr>
					<td>Name :</td>
					<td><input type="text" name="uname" required="required" <%if(is) {%> value=<%=ub.getName()%><%}%> ></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><%if(is) {%><div class="left"><%=ub.getEmail() %><input type="hidden" name="mail" value=<%=ub.getEmail() %>></div>
					 <%} else {%><input type="email" name="mail" required="required"><%}%></td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input type="number" name="uphno" required="required" <%if(is) {%> value=<%=ub.getPhno() %> <%}%>></td>
				</tr>
				<tr>
					<td>Gender:</td>
					<td><%if(is) {%><div class="left"><%=ub.getSex() %><input type="hidden" name="g" value=<%=ub.getSex() %>></div>
					 <%} else {%><input type="radio" name="g" value="male">MALE 
					 <input type="radio" name="g" value="female">FEMALE<%}%></td>
				</tr>
				<tr>
					<td>Date of Birth:</td>
					<td><input type="date" name="dob" required="required"></td>
				</tr>
				<tr>
					<td>Address :</td>
					<td><input type="text" name="uadd" maxlength="100" <%if(is) {%> value=<%=add.getAddress() %> <%}%>></td>
				</tr>
				<tr>
					<td>City :</td>
					<td><input type="text" name="ucity" <%if(is) {%> value=<%=add.getCity() %><%}%>></td>
				</tr>
				<tr>
					<td>State:</td>
					<td><select name="state">
							<option selected="selected" <%if(is) {%> value=<%=add.getState() %>> <%}%><%if(is) {%><%=add.getState() %> <%}else{%>Select State<%} %></option>
							<option value="Andhra Pradesh">Andhra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chandigarh">Chandigarh</option>
							<option value="Chattisgarh">Chattisgarh</option>
							<option value="Delhi">Delhi</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachal Pradesh">Himachal Pradesh</option>
							<option value="Jammu Kashmir">Jammu &amp; Kashmir</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Madhya Pradesh">Madhya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Mizoram">Mizoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Orissa">Orissa</option>
							<option value="Pondicherry">Pondicherry</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamilnadu">Tamilnadu</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttaranchal">Uttaranchal</option>
							<option value="Uttar Pradesh">Uttar Pradesh</option>
							<option value="West Bengal">West Bengal</option>
							<option value="Others">Others</option>
					</select></td>
				</tr>
				<tr>
					<td>Pin code:</td>
					<td><input type="text" name="upin" maxlength="6" <%if(is) {%> value=<%=add.getCity() %><%}%>></td>
				</tr>
				<% if(is) {%><tr><td><input type="hidden" name="password" value="xxxx"></td></tr>
				<% }else{%>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td>Confirm Password:</td>
					<td><input type="password" name="upassword" required="required"></td>
				</tr>
				<%} %>
				<tr>
					<td><input type="submit" value=<%if(is) {%> "update" <%}else{%>"SIGN Up"<%} %>></td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	<img src="Images\distbanner.jpg" width=100% height=150px>

</body>
</html>