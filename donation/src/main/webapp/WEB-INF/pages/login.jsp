<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">





<link rel="stylesheet" href="practice1css.css">	
<link rel="preconnect" href="https://fonts.googleapis.com">
<!-- <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
<link href="/css/style.css" rel="stylesheet">
<title>Sign-Up-Form</title>

<style type="text/css">
 body {
	background-image:
		url(https://images.unsplash.com/photo-1581594693702-fbdc51b2763b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJsb29kJTIwZG9uYXRpb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60);
	background-size: cover;
}
.container{
border-radius:5px;
}

@charset "UTF-8";
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Alkatra', cursive;
}

#sign-form {
    width: 500px;
    height: 600px;
    margin: 10vh auto;
    margin-top:20px;
    padding: 5%;
    background-color:transparent;
    border-radius:10px;
    box-shadow:0px 8px 32px 0 black; 
    border-left:1px solid white;
     border-top:1px solid white;
}

label {
    font-family:serif;
    display: block;
    margin: 10px 0 5px 0;
    font-size: 20px;
}

input:not(input#terms-agree) {

    background-color: #fff; 
    width: 90%;
    height: 40px;
    margin-bottom:20px;
    padding-left: 20px;
    border: 1px solid #cccccc;
    border-radius: 30px;
    color: #333399;
}

input:focus {
    outline: 1px solid #333399;
}




.form-caption {
    color: black;
    margin-bottom: 30px;;
}



a {
    color: #333399;
    text-decoration: none;
    font-size: 14px;
}

a:hover {
    color: #23236a;
}

.have-account-line {
    margin: 30px 0 30px 0;
    font-size: 14px;
}

.submit{
text-align:center;
width:30%
}

button{

  background-color: #fff; 
    width: 30%;
    height: 40px;
    margin-bottom:20px;
    margin-left:100px;
    padding:5px 30px;
    border: 1px solid #cccccc;
    border-radius: 30px;
    color: #333399;
    font-size:20px;
}

.navbar {
  background-color: rgba(255, 255, 255, .4);
  backdrop-filter: blur(12px);
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-inline: 4rem;
  transition: 350ms cubic-bezier(0.65, 0, 0.35, 1);
}

.navbar.scrolled {
  background-color: rgba(0, 0, 0, .4);
}

.navbar.scrolled .nav-link, .navbar.scrolled #brand {
  color: #f1f1f1;
}

.nav-list {
  display: flex;
  gap: 2rem;
  list-style: none;
}

.nav-link, #brand {
  
  color: #111;
  font-size: 1.25rem;
  font-family: 'Abel', sans-serif;
  text-transform: uppercase;
  transition: 350ms cubic-bezier(0.65, 0, 0.35, 1);
}


</style>
<script type="text/javascript">
function login(){
	var uname = document.getElementById("username").value
	var pasword = document.getElementById("password").value

	$(document).ready(function(){
		$.ajax({
			url:"http://localhost:8080/loginvalidation",
			data:{"username":uname,
				"password":pasword},
		type:"get",
		dataType:"text",
		success:function(response){
			alert(response);
			if(response =="login successful"){
				window.location.replace("http://localhost:8080/home");
			}
		}
	
});
	});
		
}
</script>

 <script>
    function onlyAlphabets(evt) {
      // Get the input value and convert to uppercase
/*       var input = evt.target.value.toUpperCase();
 */      // Check if the input contains only letters
      var letters = /^[a-zA-Z]+$/;
      if (input.match(letters)) {
        // Input contains only letters, so allow it
        evt.target.value = input;
      } else {
        // Input contains non-letter characters, so reject it
        evt.target.value = "";
        alert("Please enter only alphabets!");
      }
    }
  </script> 
  <script>
    function onlyNumbers(evt) {
      // Get the input value
      var input = evt.target.value;
      // Check if the input contains only numbers
      var numbers = /^[0-9]+$/;
      if (input.match(numbers)) {
        // Input contains only numbers, so allow it
        evt.target.value = input;
      } else {
        // Input contains non-number characters, so reject it
        evt.target.value = "";
        alert("Please enter only numbers!");
      }
    }
  </script>


<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
</head>
<body>

 <div class="col-md-4 center" style="padding: 5px;">
        <div style="border-radius: 50%;background-color: yellow; height: 150px;width: 150px;margin-left: auto;margin-right: auto;">
            <div class="count-up h1 text-center"  style="padding-top: 40px;padding-left:20px;font-size:1.75rem;color:#6A1208;margin-top:10px;">BLOOD DONORS</div>
            <div style="color:#6A1208;"></div>
        </div>
    </div>

 	 <div class="container">
		<form action="login" method="get" class="sign-form"
		
			id="sign-form" autocomplete="on">
			
			<h1 class="form-title"> Login</h1>
			<p class="form-caption">See your growth and get consulting
				support!</p>


			 <br> <label for="username">user name<spanclass="star-required">*</span></label> 
			
			 <input type="text" name="username"
			 
				id="username" placeholder="username" autofocus required  oninput="onlyAlphabets(event)" onkeypress="return /[a-zA-Z]/i.test(event.key)"> 
				<label for="password"> Password<span class="star-required">*</span> 
				</label>
			<input type="password" name="password" id="password"
				placeholder="Password" required> <br> <br>
				
			

			<input type="button" value="login" id="submit" onclick="login()" >
			<center>	
                   
                    <span style="text-align:center;">OR</span>
                    <hr/>
                   
                </center><br><br>
                
                <center>
                <a href="signup" ><b ><span style="text-align:center; font-size:30px;">SIGN UP</span></b></a><br></center>


		</form>
	</div> 
	
	
</body>
</html>