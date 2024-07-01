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

<h1>Cibil Score is <%int cibilScore = (int) request.getAttribute("cibilScore");

 %></h1>
 <%=cibilScore %>
 
 
<a href="CardForms.jsp"type="submit" value="submit">submit</a>
 
</body>
</html>