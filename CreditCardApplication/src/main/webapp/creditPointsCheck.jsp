<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.chainsys.creditcard.model.User"%>
        <%@ page import="java.util.List"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 
  
</head>
<body> 
<% 

   List<User> list =(List<User>)session.getAttribute("values");
   for(User user:list){
	
	


 %>
<div class="header">

		
			<img alt="" src="images/logo-no-background.png" style="width: 150px;">
		

	</div>

<form action="creditPoints" method="post">
       
       <div class="form-group">
            <input type="hidden" id="id" name="id" value="<%=user.getCustomerID() %>">
        </div>
       
  <%} %>     
        <div class="form-group">
            <label for="card-number">Card Number</label>
            <input type="text" id="card-number" name="cardNumber" pattern="[0-9]{16}" required>
        </div>
        <!-- <div class="form-group">
            <label for="expiry-date">Expiry Date</label>
            <input type="text" id="expiry-date" name="validity" placeholder="YY/MM"  pattern="[0-9]{4}" required>
        </div>
        <div class="form-group">
            <label for="cvv">CVV</label>
            <input type="text" id="cvv" name="cvv" required>
        </div>
        <input type="hidden" value="dress purchased" name="description"> -->
        <button type="submit">Check</button>
    </form>



<%
Integer creditpoints = (Integer) request.getAttribute("creditPoints");
if (creditpoints == null) {
    creditpoints = 0; 
}
else{
System.out.println("alert---> in creditPointsCheck.jsp: " + creditpoints);
int message = creditpoints;
String messageType = (creditpoints != 0) ? "success" : "info";

%>

<script>
Swal.fire({
    title: 'Notification',
    text: '<%= creditpoints  %>',
    icon: '<%= messageType %>'
});
</script>

<%
}
%>
</body>
<style>
img{
   margin-top: 4px;
}
.header {
	background-color: rgb(20, 136, 236);
	color: #fff;
	height: 75px;
	margin-top:-42.4%;
	text-align: center;
	position: fixed;
	width: 100%;
	z-index: 1000;
}

    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.payment-form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
}

.payment-form h2 {
    margin-bottom: 20px;
    font-size: 24px;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 4px;
    background-color: rgb(20, 136, 236);
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: rgb(13, 176, 13);
}

</style>
</html>
