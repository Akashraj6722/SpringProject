<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<body>

    <div class="nav" style="background-color: rgb(20, 136, 236);">

        <div class="nav1">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Who We Are</a></li>
                <li><a href="#">Help</a></li>

            </ul>
        </div>
        <div class="nav2">
            <img src="images/logo-no-background.png" alt="" style="width: 150px;">
        </div>
        <div class="nav3">
            <ul>
                <li><a href="signup.jsp">SIGN-UP</a></li>
                <li><a href="login.jsp">LOGIN</a></li>
                <li><a href="www.instagram.com"><i class="fa-brands fa-instagram "></i></a></li>
                <li><a href="www.twitter.com"><i class="fa-brands fa-x-twitter"></i></i></a></li>
                <li><a href="www.facebook.com"><i class="fa-brands fa-facebook"></i></a></li>
                
            </ul>
        </div>

    </div>

    <div class="slider">
        <div class="slides">
            <div class="slide"><img src="images/slidebar2.webp" alt="Screenshot 108"></div>
            <div class="slide"><img src="images/slidebar1.webp" alt="Screenshot 107" style="width: 1228px ; height: 600px;"></div>
            <div class="slide"><img src="/ProjectImages/slidebar3.webp" alt="Screenshot 108"></div>

         
        </div>
    </div>
     <footer>
        <div>
            <p>&copy; 2024 Plastic Money. All rights reserved.</p>
            <nav>
                <ul>
                    <li><a href=""><i class="fas fa-phone-square-alt" style="font-size: x-large;"></i></a><p><b>+91</b>6345789645</p></li>
                    <li><a  href=""><i class="fas fa-envelope"></i></a><p>plasticmoney@gmail.com</p></li>
                </ul>
            </nav>
        </div>
    </footer>
      
    

</body>

<style>
 footer ul{
        display: flex;
        list-style: none;
        justify-content: space-around;
    }
    footer {
    background-color: #333; 
    color: #fff; 
    padding: 5px ;
    margin: 0 auto; 
    text-align: center; 
    height: 120px;
}
footer li a{
    color: aliceblue;
}


.slider {
    width:1212px ;
    height: 510px;

    /* margin: 50px auto; */
    overflow: hidden;
    border: 2px solid #ddd;
    /* border-radius: 10px; */
}
.nav2 img{
    margin-left: -40px;
    
}

.slides {
    display: flex;
    /* width: 200%; */
    animation: slide 10s infinite;
}

.slide {
    width: 100%;
    flex:  1 0  100%;
}

.slide img {
    width: 100%;
    display: block;
}

@keyframes slide {
    0% { transform: translateX(0); }
    40% { transform: translateX(-100%); }
    100% { transform: translateX(0); }
}

    .nav3  a,.nav1 a{
       height: 47px;
        font-size: 20px;

    }
    .nav3 i{
        font-size: 25px;
    }
    .nav2{
        /* float: left; */
        /* margin-left: 30PX; */
        width: 0;
    }
    body {
        margin: 0;
        box-sizing: border-box;
        padding: 0%;
        font-family: Arial, sans-serif;
        background-color: white
    }

.nav{
    display: flex;
    justify-content: space-between;
    /* height: 60px; */
}

    .nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .nav1 ul {
        display: flex;

        /* float: left; */
    }
    

    .nav2{
        margin-top: 6px;

    }

    .nav3 ul  {
        display: flex;
        
        /* float: left; */

        /* float: right; */
    }

    .nav ul li a {
        display: block;
        color: rgb(0, 0, 0);
        padding: 14px 16px;
        text-decoration: none;
    }

    .nav ul li a:hover {
        background-color: #555;
    }
</style>