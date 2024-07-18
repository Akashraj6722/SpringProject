<%@page import="ch.qos.logback.core.net.SyslogOutputStream"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.springframework.context.annotation.Bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.creditcard.model.User"%>
<%@ page import="com.chainsys.creditcard.dao.UserRecordsDAO"%>
<%@ page import="com.chainsys.creditcard.dao.UserRecordsImpl"%>

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
	
	
	if (session == null || session.getAttribute("values") == null) {
			 response.sendRedirect("mainPage.jsp"); 
		}

	%>
	<%
	
	%>
	<div class="header">

		
			<img alt="" src="images/logo-no-background.png" style="width: 150px;">
		

	</div>
	<div class="sidebar">

		<a href="#home"><i class="fa-solid fa-house"></i>Home</a>

	 <form action="accountDetails" method="post">
			<button class="sideButton" value="submit"><i class="fa-solid fa-file-invoice"></i>Account
				Details</button>

		</form>


		<a href="cardPage.jsp"><i class="fa-regular fa-credit-card"></i>Apply Credit Card</a>
 		
 		
		 <a href="setPin.jsp"><i class="fa-solid fa-key"></i>Set
			PIN For Credit Card</a>  
			
	    <a href="cibil.jsp"><i class="fa-solid fa-gauge-high"></i>Check CIBIL Score</a>
	    <a href="shop.jsp"><i class="fa-brands fa-shopify"></i>Shop With Card</a>
	    <a href="creditPointsCheck.jsp"><i class="fa-solid fa-star-half-stroke"></i>Credit Points</a>
	    <a href="statementForm.jsp"><i class="fa-solid fa-tent-arrow-left-right"></i>Statement</a>
	    
	    <!-- <form action="ShopServlet" method="get">
			<button class="sideButton" type="submit" value="submit"><i class="fa-solid fa-tent-arrow-left-right"></i>Statement</button>

		</form> -->
		<a href="#contact"><i class="fa-solid fa-tty"></i>Contact</a>

		<form action="logout" method="post">
			<button class="sideButton" value="submit"><i class="fa-solid fa-right-from-bracket"></i>Logout</button>

		</form>

	</div>
	<%
	HttpSession sess = request.getSession();
	String mail=null;
	/* User user = (User) request.getAttribute("userDetails");
	System.out.println("mail from jsp ---> " + user.getMail()); */
	
	List<User> list =(List<User>)session.getAttribute("values");
	for(User user:list){
		
		mail=user.getMail();
	}
	
	 ServletContext servletContext = getServletContext();
     ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);

     UserRecordsImpl userRecordsImpl= (UserRecordsImpl) context.getBean("userRecordsImpl");

	
	List<User> values1 =userRecordsImpl.readProfile(mail);
	
	for (User display : values1) {
	%>


	<div class="main-content">
		<div class="card">
			<div class="card-header"><b>Name</b></div>
			<div class="card-content"><%=display.getfName()%>
				<%=display.getlName()%></div>
		</div>

		<div class="card">
			<div class="card-header"><b>Customer Id</b></div>
			<div class="card-content"><%=display.getCustomerID()%></div>
		</div>
		<div class="card">
			<div class="card-header"><b>Aadhaar Number</b></div>
			<div class="card-content"><%=display.getAadhaar()%></div>
		</div>
		<div class="card">
			<div class="card-header"><b>PAN</b></div>
			<div class="card-content"><%=display.getPan()%></div>
		</div>
		<div class="card">
			<div class="card-header"><b>Phone Number</b></div>
			<div class="card-content"><%=display.getPhone()%></div>
			<input type="hidden" value=<%=display.getPhone()%>>
<!-- 			<button class="editButton" type="submit" value="Edit"></button>
 -->		</div>
		<div class="card">
			<div class="card-header"><b>Email</b></div>
			<div class="card-content"><%=display.getMail()%></div>
<!-- 			<button class="editButton" type="submit" value="Edit"></button>
 -->		</div>
		<%
		}
/* 	}
 */		%>
	</div>
	<%-- <% ArrayList<Details> info=(ArrayList<Details>)request.getAttribute("info"); 
	request.setAttribute("info1", info);
	
	request.getRequestDispatcher("AccountDetails.jsp").forward(request, response);

 
      %> --%>

</body>
<style>

i{
padding-right:10px;
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
	text-align: center;
	position: fixed;
	width: 100%;
	z-index: 1000;
}

.header h1 {
	margin-top: 6px;
	margin-left:50px;
}


.sideButton {
	height: 60px;
	/* margin-left:12px; */
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

.sideButton:hover {
	background-color: #575757;
}

.sidebar {
	height: 100%;
	width: 250px;
	position: fixed;
	top: 60px;
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