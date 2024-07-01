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

    <div class="box">
        <form action="signup" method="post" onsubmit="return validatePassword()"enctype="multipart/form-data">
            <div class="row">

                <ul>
                    <li> <label class="fName" for="fName">First Name</label></li>
                    <li><input type="text" id="fName" name="fName" placeholder="Enter Your FirstName" pattern="[A-Za-z]{2,20}" required ></li>
                    <br>

                    <li><label class="lName " for="lName">Last Name</label></li>
                    <li><input type="text" id="lName" name="lName" placeholder="Enter Your LastName"  pattern="[A-Za-z]{1,10}" required></li>
                    <br>

                    <li> <label class="DOB " for="DOB">Date.Of.Birth</label></li>
                    <li> <input type="date" id="DOB" name="DOB" required max="2006-01-01"></li><br>


                    <li> <label for="aadhaar" class="aadhaar">Aadhaar Number</label></li>
                    <li><input type="text" id="aadhaar" name="aadhaar" placeholder="Enter  Aadhaar Number"
                            pattern="[0-9]{12}" required><input type="file" name="aadhaarProof"   ></input></li><br>

                    <li> <label for="pan" class="pan">PAN</label> </li>
                    <li><input type="text" id="pan" name="pan" placeholder="Enter  PAN Here"
                            pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" required><input type="file" name="panProof"   ></input></li><br>

                    <li> <label for="mail" class="mail">Email</label></li>
                    <li><input type="text" id="mail" name="mail" placeholder="Enter Your Mail-id"
                            pattern="[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[com]$" required></li><br>

                    <li> <label for="ph" class="phone">Phone Number</label></li>
                    <li><input type="tel" id="ph" name="ph" placeholder="+91" pattern="[0-9]{10}" required></li><br>

                    <li> <label for="pass" class="pass">Password</label></li>
                    <li><input type="password" id="pass" name="pass" placeholder="Atleast 8 Characters"
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+.])(?=.*\\d).{8,}$" required></li><br>

                    <li> <label for="repass" class="repass">Confirm Password</label></li>
                    <li><input type="password" id="repass" name="repass" placeholder="Re-Enter Password" required></li>
                    <br>


                </ul>
            </div>
            <div class="submit">
                <button type="submit">SUBMIT</button>
        
            </div>


    </div>
   

    </form>
    </div>

    <script>
        function validatePassword() {

            var password = document.getElementsByName("pass")[0].value;
            console.log(password);
            var rePassword = document.getElementsByName("repass")[0].value;

            if (password != rePassword) {

                alert("Passwords dont match");
                return false;
            }
            return true;

        }
    </script>
</body>

<style>
    li input{
        width: 190px;display: flex;
        justify-content: center;
    }
 
    .row li{
        list-style: none;
        display: flex;
        
    }
    .row{
        margin-top: 30px;
        margin-left: 45px;
        
    }
   
    .nav {
        display: flex;
        justify-content: space-between;
        height:75px;

    }

    .nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }




    .nav2 {
        font-family: Arial, Helvetica, sans-serif;
        margin-top: 10px;
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

    body {
        background-image: url(images/Moneymate_Bestcreditcardstudents.webp);
        background-repeat: no-repeat;
        background-size: 1800px;

    }
    button{
        padding: 4px;
        color: white;

        background-color:rgb(20, 136, 236);

    
    
    }
button:hover{
    background-color: rgb(13, 176, 13);

}


    .box {
        border: 2px solid;
        box-shadow: 2px 2px 2px;
        /* display: flex; */
        margin-left: 6%;
        margin-top: 2%;
        /* justify-content: center; */
        width: 440px;
        height: 580px;
    }

   
    .submit {
        margin-left: 190px;
        margin-top: 10px;
    }
     


    * {
        padding: 0px;
        margin: 0px;
        box-sizing: border-box;
    }

   
</style></html>