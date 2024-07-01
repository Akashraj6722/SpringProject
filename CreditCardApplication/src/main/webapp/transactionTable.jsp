<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList"%>
<%@ page import="com.chainsys.model.Transaction"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
		<tr>
			<th>Card Number</th>
			<th>Transaction ID</th>
			<th>Date & Time</th>
			<th>Amount</th>
			<th>Description</th>
		</tr>
		<%
		ArrayList<Transactions> list = (ArrayList<Transactions>) request.getAttribute("values");
				
				for(Transactions values:list){
		%>
 
 <tr>
			<td><%=values.getCardNumber()%></td>
			<td><%=values.getTranscationId()%></td>
			<td><%=values.getDateTime()%></td>
			<td><%=values.getAmount()%></td>
			<td><%=values.getDescription()%>
			
<%} %>
</body>
<style>
* {
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
}
body {
	background-color: blanchedalmond;
}

table, th, td {
	border: solid black 2px;
	border-collapse: collapse;
	margin-top: 40px;
	margin-left: 20px;
}

th, td {
	padding: 10px;
}

th {
	background-color: #f2f2f2;
}
</style>
</html>