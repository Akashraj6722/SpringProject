<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.chainsys.model.Transaction"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
<%
 Transactions trans=new Transactions();
 int amount=(int)request.getAttribute("amount");
 trans.setAmount(amount);
 %>

<form action="PaymentServlet" method="post">
       <h4>Amount:</h4><%=amount %>
       <div class="form-group">
            <!-- <label for="amount">Total Amount</label> -->
            <input type="hidden" id="amount" name="amount" value=<%=amount %>>
        </div>
        <div class="form-group">
            <label for="card-number">Card Number</label>
            <input type="text" id="card-number" name="cardNumber" required>
        </div>
        <div class="form-group">
            <label for="expiry-date">Expiry Date</label>
            <input type="text" id="expiry-date" name="expiryDate" placeholder="MM/YY" required>
        </div>
        <div class="form-group">
            <label for="cvv">CVV</label>
            <input type="text" id="cvv" name="cvv" required>
        </div>
        <input type="hidden" value="dress purchased" name="description"></input>
        <button type="submit">Submit Payment</button>
    </form>
</div>
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
    background-color: #28a745;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: #218838;
}

</style>
</html>