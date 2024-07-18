<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
</head>
<body>
<div class="header">

		
			<img alt="" src="images/logo-no-background.png" style="width: 150px;">
		

	</div>


 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <div class="container">
        <form  action="setPin" method="post"  onsubmit="return validatePin()" class="set-pin-form">
            <h2>Set Your PIN</h2>
             <div class="input-group">
                <label for="cardNumber">Credit Card Number</label>
                <input type="tel" id="cardNumber" name="cardNumber" pattern="[0-9]{16}" required>
            </div>
            <div class="input-group">
                <label for="pin">Enter PIN</label>
                <input type="password" id="pin" name="pin" maxlength="4" required>
            </div>
            <div class="input-group">
                <label for="confirm-pin">Confirm PIN</label>
                <input type="password" id="confirm-pin" name="confirm-pin" maxlength="4" required>
            </div>
            <button type="submit">Set PIN</button>
        </form>
    </div>
    
     <script>
     
     function validatePin() {

         var pin = document.getElementsByName("pin")[0].value;
         console.log(password);
         var confirmPin = document.getElementsByName("confirm-pin")[0].value;

         if (pin != confirmPin) {

             alert("Pin doesn't match");
             return false;
         }
         return true;

     }
     <%
     	String alert=(String)request.getAttribute("checkApproval");
                		String message;
                		String messageType;
                		
                		if(alert!=null && !alert.isEmpty()){
                			
                			if(alert.equals("Success")){
                			message="Pin Set Successfully";
                		     messageType="Success";
                		}
                		else{
                			message="Your Card is Not Approved ";
               		     messageType="Failed";
                			
                			
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
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
}

.set-pin-form {
    display: flex;
    flex-direction: column;
}

.set-pin-form h2 {
    margin-bottom: 20px;
    text-align: center;
}

.input-group {
    margin-bottom: 15px;
}

.input-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.input-group input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

 button {
        padding: 10px;
        background-color:rgb(20, 136, 236);
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background-color: rgb(15, 94, 164);
    } */



</style>
</html>