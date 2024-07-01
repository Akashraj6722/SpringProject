<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <div class="nav" style="background-color: rgb(20, 136, 236);">

        <div class="nav1">
            <ul>
                <li><a href="MainPage.jsp">Home</a></li>
                

            </ul>
        </div>
        <div class="nav2">
            <img alt="" src="images/logo-no-background.png"  style="width: 150px;">


        </div>
        <div class="nav3">
            <ul>
                <li><a href="#">Help</a></li>
              
            </ul>
        </div>

    </div>
    <div class="image">
        <div class="container">
            <div class="box">
                <form action="Login" method="post" onsubmit="return validatePassword()">
                    <div class="row">


                        <div class="column1">
                            <ul>

                                <li> <label for="mail" class="mail">E-Mail:</label></li><br>
                                <li> <label for="pass" class="pass">Password:</label></li><br>

                            </ul>
                        </div>

                        <div class="column2">
                            <ul>
                                <li><input type="text" id="mail" name="mail" placeholder="Enter Your mail"  required>
                                </li>
                                <br>

                                <li><input type="text" id="pass" name="pass" placeholder="Atleast 8 Characters"
                                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+.])(?=.*\\d).{8,}$" required>
                                </li>
                                <br>
                            </ul>
                        </div>

                    </div>
                    <div class="submit">
                        <button type="submit">SUBMIT</button>

                    </div>

                </form>
            </div>

        </div>
    </div>
</body>

<style>
li input{
width: 210px;
display:flex;
align-items: center;
}

.nav{
    display: flex;
    justify-content: space-between;
    height:75px;
    
}

    .nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .nav2{
        font-family:Arial, Helvetica, sans-serif;
        margin-top:8px;
    }


    .nav ul li a {
        font-size: 25px;
        display: block;
        color: rgb(0, 0, 0);
        padding: 14px 16px;
        text-decoration: none;
    }

    .nav ul li a:hover {
        background-color: #555;
    }

    .container {
        display: flex;
        justify-content: right;
        align-content: center;
        margin-top: 170px;
        margin-right: 90px;
    }
   body{
    background-image: url(images/login1.png);
    background-repeat: no-repeat;
    background-size:800px;
    background-position-y:100px ;
    
    /* min-height: 60vh; */
    /* background-position: ; */
    /* height: 90vh; */
        
} 


    .DOB {
        margin-top: 40px;
    }

    #fName {
        margin-top: 8px;
    }

    .box {
        border: 2px solid;
        box-shadow: 0 4px 8px;
        width: 350px;
        height: 150px;
        justify-content: center;

    }

    .row {
        margin-top: 8%;
        margin-left: 20px;
       /* height: 25vh; */
        display: flex;
        gap: 20px;
    }

    .submit {
        display: flex;
        justify-content: center;
        margin-top: 10px;
        

    }
    
    button{
        background-color: rgb(20, 136, 236);
        color: rgb(0, 0, 0);
        padding: 4px;
    }
    .column1 ul li {
        /* color: aliceblue; */
        font-weight: bolder;
        color: rgb(0, 0, 0);

    }

    .column2 ul,
    .column1 ul {

        list-style: none;
    }




    * {
        padding: 0px;
        margin: 0px;
        box-sizing: border-box;
    }

   
</style>
</html>