<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.Base64"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page import="com.chainsys.creditcard.model.User"%>
<%@ page import="com.chainsys.creditcard.model.Account"%>

<%@ page import="com.chainsys.creditcard.dao. AccountRecordsImpl"%>
<%@ page import="com.chainsys.creditcard.dao. UserRecordsImpl "%>



<%@ page  import="org.springframework.context.ApplicationContext"%> 
<%@ page  import="org.springframework.web.context.WebApplicationContext"%>
<%@ page  import="org.springframework.web.context.support.WebApplicationContextUtils"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<title>Insert title here</title>
</head>
<body>
	<div class="header">
		
			<a href="AdminPage.jsp"><i class="fa-solid fa-arrow-left-long"
				></i></a> <img alt="" src="images/logo-no-background.png"
				style="width: 150px;">
		

	</div>

	<table>
		<tr>
			<th>Customer's ID</th>
		    <th>Name</th>
			<th>DOB</th>
			<th>Aadhaar Number</th>
		    <th>Aadhaar Proof</th> 
			 <th>PAN</th>
			 <th>PAN Proof</th> 
		    <th>E-Mail</th>
		    <th>Phone Number</th>
			

		</tr>
		<%		
		User user= new User();
		Account account= new Account();
		ServletContext servletContext = getServletContext();
	     ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		  UserRecordsImpl userRecordsImpl=(UserRecordsImpl)context.getBean("userRecordsImpl");

		List<User> info= userRecordsImpl.read();

		  
		
		for(User userDetails:info){
			
			
			
			  byte[] aadhaarProof=userDetails.getAadhaarProof();
			  byte[] panProof=userDetails.getPanProof();



	
		%>



		<tr>
			<td><%=userDetails.getCustomerID() %></td>
			<td><%=userDetails.getfName() %><%= "  " %><%=userDetails.getlName() %></td>
     	    <td><%=userDetails.getDob() %></td>
			<td><%=userDetails.getAadhaar()%></td>
			<td class="Img"><img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(aadhaarProof)%>" width=100px height=100px alt="Income Proof"></td> 

			 
			<td><%=userDetails.getPan()%></td>
			<td class="Img"><img
				src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(panProof)%>" width=100px
				height=100px alt="Income Proof"></td> 

			
			
		    <td><%=userDetails.getMail()%></td>
		    <td><%=userDetails.getPhone() %>
			

				
			</td>
		</tr>

		<%
		}
		
		%>
	
</body>

<style>
a {
	float: left;
	margin-top: 22px;
	margin-left: 10px;
	color: white;
}

a:hover {
	color:black;
}

img {
	margin-top: 4px;
}

.Img:hover {
	scale: 2;
}

.header {
	background-color: rgb(20, 136, 236);
	color: #fff;
	height: 75px;
	text-align: center;
	position: inherit;
	width: 100%;
	top: 0;
	z-index: 1000;
	margin-top: -6px;
}

.header h1 {
	margin-top: 6px;
}

.formAction {
	display: flex;
	gap: 45px;
}

* {
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
}

.box {
	margin-left: 30%;
	margin-top: 5%;
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

.delete {
	padding: 10px;
	color: white;
	font-weight: bold;
	background-color: red;
	border: none;
	cursor: pointer;
}

.update {
	padding: 10px;
	color: white;
	font-weight: bold;
	background-color: rgb(32, 219, 32);
	border: none;
	cursor: pointer;
}

a:hover {
	color: black;
}
</style>

</html>