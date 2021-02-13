<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="commonstyle.css">
<link rel="stylesheet" type="text/css" href="companystyle.css">
<style type="text/css">
select {
	border-color: #ff6633;
	border-width: 2px;
	border-radius: 10px;
	color: #423137;
	background-color: #4ba5e0;
}

select:HOVER {
	border-radius: 20px;
}

option {
	border-width: 20px;
	padding: 10px;
}

input {
	background-color: #77bdf1;
	margin: 2px;
	border-radius: 20px;
}

textarea {
	background-color: #f5a05a;
}
</style>
<title>ADD job</title>
</head>
<body>
	<div>
		<%
			String cmail = (String) session.getAttribute("cmail");
		String msg = request.getParameter("msg");
		if(msg == null){
			msg = "";
		}
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
	<div class="oreintation">
	<span class="msg"><%=msg%></span>
		<form action="Addjob.jsp" class="main" method="get">
			<table>
				<tr>
					<td><h2>ENTER JOB DETAILS :</h2></td>
					<td></td>
				</tr>
				<tr>
					<td><sup>*</sup>Name :</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td><sup>*</sup>Category :</td>
					<td><input type="text" name="category"></td>
				</tr>
				<tr>
					<td><sup>*</sup>Criteria :</td>
					<td><input type="text" name="criteria"></td>
				</tr>
				<tr>
					<td>Last date :</td>
					<td><input type="date" name="lastdate"></td>
				</tr>
				<tr>
					<td>Salary :</td>
					<td><input type="text" name="salary"><sub>per
							month</sub></td>
				</tr>
				<tr>
					<td>Information :</td>
					<td><textarea rows="4" cols="40" name="infomation">Infomation</textarea>

						<!-- <input type="textarea" rows='3'> --></td>
				</tr>
				<tr>
					<td>State :</td>
					<td><select name="state">
							<option selected="selected" value="">SelectState</option>
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
							<option value="xxx">Others</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="ADD JOB"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>