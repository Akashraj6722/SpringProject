<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div>

    </div>
    <div class="card-container">
        <div class="card">
            <h3></h3>
            <img src="images/samantha.webp" width="250px">
            <h4>RS.1499 only</h4>
            <form action="ShopServlet" method="post">
            <input type="hidden" value="1499" name="buy">
            <input type="submit" value="Buy Now">
            </form>
        </div>
        <div class="card">
            <h3></h3>
            <img src="images/virat-kohli.webp" width="250px">
            <h4>RS.5999 only</h4>
            <form action="ShopServlet" method="post">
            <input type="hidden" value="5999" name="buy">
            <input type="submit" value="Buy Now">
            </form>
            
        </div>
       
       
    </div>

</body>
<style>
    body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
}

.card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    max-width: 1200px;
}

.card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    margin: 20px;
    padding: 20px;
    width: 250px;
    text-align: center;
}

.card h3 {
    margin-top: 0;
}

.card input {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 15px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.card a:hover {
    background-color: #0056b3;
}

</style>
</html>