<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.ArrayList"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Cibil Score is 



<%





int cibilScore = (int) request.getAttribute("cibil");

 %></h1>
 <%=cibilScore %>
 
 
<!-- <a href="customerDetails.jsp"type="submit" value="submit">Ok</a>
 --> 
</body>
</html>