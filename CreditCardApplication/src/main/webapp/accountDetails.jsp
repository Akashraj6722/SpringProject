<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.creditcard.dao.AccountRecordsImpl"%>
<%@ page import="com.chainsys.creditcard.model.User"%>

<%@ page import="com.chainsys.creditcard.model.Account"%>
<%@ page  import="org.springframework.context.ApplicationContext"%> 
<%@ page  import="org.springframework.web.context.WebApplicationContext"%>
<%@ page  import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<title>Insert title here</title>
</head>
<body>
	<%
	
	%>
	
	<div class="header">
     
      <a class="back"href="CustomerProfile.jsp"><i class="fa-solid fa-arrow-left-long"
				></i></a>
			<img alt="" src="images/logo-no-background.png" style="width: 150px;">
	

	</div>
	<div class="sidebar">

		<a href="#home"><i class="fa-solid fa-house"></i>Home</a>
		<a href="customerProfile.jsp"> <i class="fa-regular fa-user"></i>Profile</a>
		<a href="cardPage.jsp"><i class="fa-regular fa-credit-card"></i>Apply Credit Card</a>
		<a href="setPin.jsp"><i class="fa-solid fa-key"></i>Set
			PIN For Credit Card</a> 
	     
	     <a href="cibil.jsp"><i class="fa-solid fa-gauge-high"></i>Check CIBIL Score</a>
			
		 <a href="#contact"><i class="fa-solid fa-tty"></i>Contact</a>

		<form action="logout" method="post">
			<button type="submit" value="submit"><i class="fa-solid fa-right-from-bracket"></i>Logout</button>

		</form>


	</div>


	<%
	User user = new User();
	int id=0;
	List<User> list=(List<User>)request.getAttribute("id");
	for(User values:list){
		
		id=values.getCustomerID();
	}
	
    System.out.println("in accountDetails JSP"+id);   
	Account account=new Account();
	 ServletContext servletContext = getServletContext();
    ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);

    AccountRecordsImpl accountRecordsImpl= (AccountRecordsImpl) context.getBean("accountRecordsImpl");

	
	List<Account> info =accountRecordsImpl.read(account,id);
			for (Account number : info) {
				
			    System.out.println("in accountDetailsMethod JSP"+number.getAccountNumber());   

			
	%>
	<div class="main-content">
		<div class="card">
			<div class="card-header"><b>Account Number</b></div>
			<div class="card-content"><%=number.getAccountNumber()%></div>
		</div>
		<div class="card">
			<div class="card-header"><b>Account Type</b></div>
			<div class="card-content"><%=number.getAccountType()%></div>
		</div>
		<div class="card">
			<div class="card-header"><b>IFSC Code</b></div>
			<div class="card-content"><%=number.getIfsc()%></div>
		</div>
		<div class="card">
			<div class="card-header"><b>Account Balance</b></div>
			<div class="card-content"><%=number.getBalance()%></div>
		</div>


		<%
		}
		%>
	</div>


</body>
<style>
.back{
	float: left;
	margin-top: 22px;
	margin-left: 10px;
	color: white;
}

.back:hover {
	color:black;
}
i{
padding-right:10px;
}
button {
	height: 60px;
	font-size: 17px;
	background-color: rgb(138, 150, 174);
	color: white;
	border: 0;
	cursor: pointer;
	width: 250px;
	height: 50px;
	text-align: justify;
	padding: 15px 20px;
}

button:hover {
	background-color: #575757;
}

body, html {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.header {
	background-color: rgb(20, 136, 236);
	color: #fff;
	height: 75px;
	/*         padding: 5px;
 */
	text-align: center;
	/*         font-size: 24px;
 */
	position: fixed;
	width: 100%;
	/*         top: 0;
 */
	z-index: 1000;
}

.header h1 {
	margin-top: 6px;
}

.sidebar {
	height: 100%;
	width: 250px;
	position: fixed;
	top: 70px;
	left: 0;
	background-color: rgb(138, 150, 174);
	padding-top: 60px;
	overflow-x: hidden;
}

.sidebar a {
	padding: 15px 20px;
	text-decoration: none;
	font-size: 17px;
	color: white;
	display: block;
}

.sidebar a:hover {
	background-color: #575757;
}

.main-content {
	margin-left: 260px;
	padding: 20px;
	padding-top: 80px;
	background-color: #f4f4f4;
	min-height: 100vh;
}

.card {
	background-color: #fff;
	padding: 20px;
	margin: 15px 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.card-header {
	font-size: 20px;
	margin-bottom: 10px;
}

.card-content {
	font-size: 16px;
}

@media screen and (max-width: 768px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.sidebar a {
		float: left;
	}
	.main-content {
		margin-left: 0;
		padding-top: 140px;
	}
}
</style>
</html>