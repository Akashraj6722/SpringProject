<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div class="header">

		
			<img alt="" src="images/logo-no-background.png" style="width: 150px;">
		

	</div>
    <div class="card-container">
        <div class="card">
            <h3></h3>
            <img src="images/samantha.webp" width="250px">
            <h3>Striped Cotton Saree</h3>
            <h4>RS.1499 only</h4>
            <form action="shop" method="post">
            <input type="hidden" value="1499" name="buy">
            <input type="submit" value="Buy Now">
            </form>
        </div>
        <div class="card">
            <h3></h3>
            <img src="images/virat-kohli.webp" width="250px">
            <h3>Combo(T-Shirt,Pant,Shoe)</h3>
            <h4>  RS.5999 only</h4>
            <form action="shop" method="post">
            <input type="hidden" value="5999" name="buy">
            <input type="submit" value="Buy Now">
            </form>
            
        </div>
       
       
    </div>

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
    margin-top:30px;
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