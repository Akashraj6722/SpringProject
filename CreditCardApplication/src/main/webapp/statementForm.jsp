<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.creditcard.model.User"%>
<%@ page import="com.chainsys.creditcard.model.Transactions"%>

    <%@ page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Include SweetAlert CSS and JS files -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body> 
<% Transactions transactions=new Transactions();

   List<User> list =(List<User>)session.getAttribute("values");
   for(User user:list){
	
	transactions.setId(user.getCustomerID());
}

 %>

<form action="statement" method="post">

       <div class="form-group">
            <!-- <label for="amount">Total Amount</label> -->
            <input type="hidden" id="id" name="id" value="<%=transactions.getId() %>">
        </div>
        <div class="form-group">
            <label for="card-number">Card Number</label>
            <input type="text" id="card-number" name="cardNumber" pattern="[0-9]{16}" required>
        </div>
      <!--   <div class="form-group">
            <label for="expiry-date">Expiry Date</label>
            <input type="text" id="expiry-date" name="validity" placeholder="YY/MM"  pattern="[0-9]{4}" required>
        </div>
        <div class="form-group">
            <label for="cvv">CVV</label>
            <input type="text" id="cvv" name="cvv" required>
        </div> -->
        <input type="hidden" value="dress purchased" name="description">
        <button type="submit">Check</button>
    </form>
</div>

<script>
<%
String alert=(String) request.getAttribute("CardDetails");
System.out.println("alert--->" + alert);
String message = "";
String messageType = "";

if(alert != null && !alert.isEmpty()){
    if(alert.equals("paymentSuccess")){
        message = "Order Placed";
        messageType = "success";
    } else {
        message = "Incorrect Card Details";
        messageType = "error";
    }
%>

Swal.fire({
    title: 'Notification',
    text: '<%= message %>',
    icon: '<%= messageType %>'
});

<%}%>
</script>
</body>
<style>
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
