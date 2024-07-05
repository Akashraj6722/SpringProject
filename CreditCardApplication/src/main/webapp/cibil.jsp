<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList"%>
<%@ page import="com.chainsys.creditcard.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
<%


/* 
if (session == null || session.getAttribute("userDetails") == null) {
		 response.sendRedirect("mainPage.jsp"); 
	} */
%>
<%

 HttpSession sess = request.getSession();

  		ArrayList<User> values1 = (ArrayList<User>) sess.getAttribute("values");
  		for (User display : values1) {
 %>		
		
<div class="form-container">
        <form action="cibil" method="post">
        <h1>Check Your CIBIL Score</h1>
            <label for="firstname">First Name</label>
            <input type="text" id="firstname" name="firstname" value=<%=display.getfName() %>>
            
            <label for="lastname">Last Name</label>
            <input type="text" id="lastname" name="lastname" value=<%=display.getlName() %>>
            
            <label for="pan">PAN</label>
            <input type="text" id="pan" name="pan" value=<%=display.getPan() %>>
            <br>
            <button type="submit">Check</button>
        </form>
    </div>
		<% }%>
</body>
		


<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.form-container {
    background-color: #fff;
    padding: 50px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    height:350px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 10px;
}

input {
    margin-top: 5px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width:300px;
}

button {
    margin-top: 20px;
    padding: 10px;
    border: none;
    border-radius: 4px;
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}
</html>