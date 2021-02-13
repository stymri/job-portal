<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<style type="text/css">
.add {
	margin: 2px;
	background: transparent;
	border-left: none;
	border-right: none;
	border-top: none;
	/* background-color: #41e4ef; */
	color: #d82929;
}

.add:FOCUS {
	border-left: none;
	border-right: none;
	border-top: none;
	border-bottom-color: black;
}
</style>
<title>Add Company</title>
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
	%>
	<div class="admin">
	<h2>Company details</h2>
	<table>
		<tr>
			<td>Name :</td>
			<td><input type="text" name="name" class="add"></td>
		</tr>
		<tr>
			<td>Mail :</td>
			<td><input type="mail" name="mail" class="add"></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="password" name="password" class="add"></td>
		</tr>
		<tr>
			<td>Phone number :</td>
			<td><input type="number" name="phno" class="add"></td>
		</tr>
		<tr>
			<td>Website :</td>
			<td><input type="text" name="link" class="add"></td>
		</tr>
		<tr>
		<td>Information : </td>
		<td><textarea rows="3" cols="50" class="add"></textarea>
		</tr>
		<tr>
			<td>Address :</td>
			<td><input type="text" name="add" maxlength="100" class="add"></td>
		</tr>
		<tr>
			<td>City :</td>
			<td><input type="text" name="city" class="add"></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><select name="state" class="add">
					<option selected="selected">Select State</option>
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
			<td><input type="text" name="pin" maxlength="6" class="add"></td>
		</tr>
		<tr><td></td><td><input type="submit" value="ADD COMPANY"></td></tr>
	</table>
	</div>
</body>
</html>