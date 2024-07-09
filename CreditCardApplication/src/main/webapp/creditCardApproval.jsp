<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.Base64"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page import="com.chainsys.creditcard.model.CreditCard"%>
<%@ page import="com.chainsys.creditcard.model.Employment"%>

<%@ page import="com.chainsys.creditcard.dao.CardRecordsImpl"%>
<%@ page import="com.chainsys.creditcard.dao.EmploymentRecordsImpl"%>



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
			<th>Account Number</th>
<!-- 		<th>Cibil Score</th>
 -->		<th>Credit Card Number</th>
			<th>Credit Card Type</th>
			<th>Credit Card Status</th>
			<th>Credit Card Approval</th>
			<th>Income Proof</th>

		</tr>
		<%		
		CreditCard creditCard= new CreditCard();
		ServletContext servletContext = getServletContext();
	     ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		  CardRecordsImpl cardRecordsImpl=(CardRecordsImpl)context.getBean("cardRecordsImpl");
		List<CreditCard> info= cardRecordsImpl.read();
		  EmploymentRecordsImpl employmentRecordsImpl=(EmploymentRecordsImpl)context.getBean("employmentRecordsImpl");
		  
byte[] incomeImage={};
		 
		
		
		for(CreditCard cardDetails:info){
			
			creditCard.setId(cardDetails.getId());
			
			 /*  byte[] incomeProof=employmentRecordsImpl.read(creditCard); */
 List<Employment>list =employmentRecordsImpl.read(creditCard);
			 
			 for(Employment values:list){
				 
				 
				incomeImage= values.getIncomeProof();
			 }
			


	
		%>



		<tr>
			<td><%=cardDetails.getId()%></td>
			<td><%=cardDetails.getAccountNumber()%></td>
<%-- 			<td><%=cardDetails.getAccountNumber()%></td>
 --%>	    <td><%=cardDetails.getCardNumber()%></td>
			<td><%=cardDetails.getCardType()%></td>
			<td><%=cardDetails.getCardStatus()%>
			<td><%=cardDetails.getCardApproval()%></td>
			<td class="incomeImg"><img
				src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString( incomeImage)%>" width=100px
				height=100px alt="Income Proof"></td> 

			<td> 

				<div class="formAction">
					<form action="cardapproval" method="post">
						<input type="hidden" name="action" value="accept"> <input
							type="hidden" name="id" value="<%=cardDetails.getId()%>">
						<input type="hidden" name="card"
							value="<%=cardDetails.getCardNumber()%>">
						<button type="submit" value="submit">Approve</button>
					</form>

					<form action="cardapproval" method="post">
						<input type="hidden" name="action" value="reject"> <input
							type="hidden" name="id" value="<%=cardDetails.getId()%>">
						<input type="hidden" name="card"
							value="<%=cardDetails.getCardNumber()%>">
						<button type="submit" value="submit">Reject</button>
					</form>
				</div>
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

.incomeImg:hover {
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