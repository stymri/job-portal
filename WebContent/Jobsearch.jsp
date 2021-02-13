<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Search.css">
<link rel="stylesheet" type="text/css" href="Adminstyle.css">
<title>Insert title here</title>
</head>
<body>
<%
String adminmail = (String) session.getAttribute("adminmail");
String action;
boolean admin;
if (adminmail == null) {
	admin= false;
	action = "Veiwjob.jsp";
}else{
	admin = true;
	action = "Adminjobsearch.jsp";
}
%>
<div id="search">
		Search Jobs: <br>
		<form action="<%=action %>" target=_top>
			<div class="input">
				<table>
					<tr>
					<%if(admin){ %>
					<td class="space">Job Id</td>
					<td><input type="number" name="jobid"></td>
					<%} %>
						<td class="space">Key Word</td>
						<td class="space"><input type="text" name="keyword" class="add"></td>
						<%if(!admin){ %>
						<td class="space"><input type="hidden" name="index" value="0" class="add">
							State</td>
						<td class="space"><select name="state">
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
						<%} %>
						<td class="space">Sort by</td>
						<td class="space"><select name="sortby">
								<option value="">none</option>
								<%if(admin){ %><option value="id">id</option><%} %>
								<option value="lastdate">lastdate</option>
								<option value="salary">salary high to low</option>
								<option value="salary">salary low to high</option>
						</select></td>
						<td class="space"><input type="submit" value="Search"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>