<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">


	<title>Registration Form</title>

	

	<script type="text/javascript">
	
	
function load(){
 	var uname = document.getElementById("name").value
	
    var blood = document.getElementById("bloodgroup").value
 	
    var mail = document.getElementById("email").value
 	var cities = document.getElementById("city").value
 	var count = document.getElementById("country").value
    var ages = document.getElementById("age").value 
 	var num = document.getElementById("mobile").value 	
	var donate = document.getElementById("lastdonate").value 
	var encodeValue = document.getElementById("base64").value


		$(document).ready(function(){
			$.ajax({
			url:"http://localhost:8080/create",
			data:{"name":uname,
				"email":mail,
				"bloodgroup":blood,
				"city":cities,
				"country":count,
				"age":ages,
				"mobile":num,
				"lastdonate":donate,
				"base64":encodeValue},
		type:"POST",
		dataType:"text",
		 success: function(result) {
	           alert("fgggf")
	           if(result=="saved success"){
	           Swal.fire({
								position : 'center',
								icon : 'success',
								title : 'Your work has been saved',
								showConfirmButton : false,
								timer : 350000
								
							})

				    		
	      				}else{
							Swal.fire({
	  icon: 'error',
	  title: 'Oops...',
	  text: result,
	  footer: '<a href="">Why do I have this issue?</a>'
								})
						}
	          
	            
	           },
	           error: function() {
	             alert("error");
	           }
			})
	})
		
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


<style type="text/css">
 body {
	background-image:
		url(https://images.unsplash.com/photo-1614935151651-0bea6508db6b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=925&q=80);
	background-size: cover;
}

.navbar {
  background-color: rgba(255, 255, 255, .4);
  backdrop-filter: blur(12px);
  position: fixed;
  top: 0;
  left: 0;
  right: 0px;
  height: 50px;
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
</head>
<body>
 <div  >
<nav class="navbar">
  <!-- Logo !-->
  <a id="brand" href="http://localhost:8080/home">Home</a>
  <ul class="nav-list">
    <!-- Link 1 !-->
    <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/ajax">Donor List</a>
    </li>
    <!-- Link 2 !-->
    <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/registor">Register</a>
    </li>
    <!-- Link 3 !-->
     <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/eligibility">eligibility</a>
    </li>
   
    
     <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/login">logout</a>
    </li>
    
  </ul>
</nav>
</div >
<!-- width: 500px;height: 500px gives you the size of the form -->
<!-- style="border: solid;" gives you a nice border in the form -->
<div>
	<form action="registor" method="get" style="background-color: blur;border-radius:10px; width: 600px;height: 950px;border:solid;margin-top:60px;margin-left:100px;  box-shadow:0px 8px 32px 0 black; 
    border-left:1px solid ;
     border-top:1px solid ;">

<!-- h1,h2...h6 indicates the title and its size -->
<!-- style="width: 70px; height: 70px" align="right" sets the size of the image to the right side of the form -->
<!-- TITLE INFO -->
		
		<h1 align="center" style="color: black">Registration Form</h1>
<!-- <br> line break in text -->
		<br>
<!-- style="border: solid 1px" gives a thinner border to the text box -->
<!-- style="width: 400px" sets the width of the text box -->
<!-- style="margin-left: 10px" gives margin-->
<!-- <span style="color: #FF6347">*</span> gives color only to the selected text -->
<!-- NAME INFO -->
		<label for="name" style="margin-left: 10px; color: black;font-size:1.75em;" > Name: <span style="color: #FF6347">*</span></label><br>
		<input id="name" type="text" name="name" placeholder="Your Name"  style="border: solid 1px;margin-left:10px;height:30px; width: 250px;border-radius:5px;"required="required" oninput="onlyAlphabets(event)" onkeypress="return /[a-zA-Z]/i.test(event.key)">
		<br>
<!-- <br> line break in text -->
<!-- style="margin-left: 10px" gives margin in the form of 10px -->
		<br>
		<label for="email" style="margin-left: 10px;font-size:1.75em;color: black">Email: <span style="color: #FF6347">*</span></label><br>
		<input id="email" type="email" name="email" style="border: solid 1px;margin-left: 10px;height:30px;width: 250px;border-radius:5px;" placeholder="example@anymail.com"required="required" >
		<br>
		<br>
<!-- age INFO -->
		<label for="age" style="margin-left: 10px;font-size:1.75em; color: black" > AGE: <span style="color: #FF6347">*</span></label><br>
		<input id="age" type="text" maxlength="3" name="age" placeholder="Your Age"  style="border: solid 1px;margin-left:10px;height:30px;width: 250px;border-radius:5px;"required="required" oninput="onlyNumbers(event)">
		<br>
		<br>
<!-- DATE OF BIRTH INFO -->
		<legend style="color: black; margin-left: 10px;border-radius:20px;font-size:1.75em;">Mobile Number: <span style="color: #FF6347">*</span></legend>
		<label for="month" style="margin-left: 10px"></label>
		<input type="tel" maxlength="10" id="mobile"style="height:30px;width:250px;" name="mobile" required="0-9" oninput="onlyNumbers(event)">
		<br>
		<br>
<!-- bloodgroup INFO -->
		<label for="bloodgroup" style="margin-left: 10px;font-size:1.75em;color: black;border-radius:5px;"> Blood Group: <span style="color: #FF6347">*</span></label><br>
		<input id="bloodgroup" type="text" name="bloodgroup" placeholder="Your bloodgroup"  style="border: solid 1px;margin-left:10px;height:30px;width: 250px"required="required" oninput="onlyAlphabets(event)" onkeypress="return /[a-zA-Z]/i.test(event.key)">
		<br>
		<br>
<!-- lastdonate INFO -->
			<legend style="color: black; margin-left: 10px;border-radius:5px;font-size:1.75em;">Last Donation: <span style="color: #FF6347">*</span></legend>
		<label for="lastdonate" style="margin-left: 10px"></label>
		<input type="date" id="lastdonate" style="height:30px;width:250px;"name="lastdonate"required="required">
		<br>
		<br>
<!-- required title="5 to 10 characters" pattern=".{5,10}" to set the lenght of the input password box min 5 chars, max 10 chars and display the message you want "5 to 10 characters" -->
<!-- city INFO -->
		<label for="city" style="margin-left: 10px;font-size:1.75em; color: black;border-radius:5px;" > city: <span style="color: #FF6347">*</span></label><br>
		<input id="city" type="text" name="city" placeholder="Your city"  style="border: solid 1px;margin-left:10px;height:30px;width: 250px"required="required" oninput="onlyAlphabets(event)" onkeypress="return /[a-zA-Z]/i.test(event.key)">
		<br>
		<br>
<!-- country CONFIRMATION INFO -->
		<label for="country" style="margin-left: 10px;font-size:1.75em; color: black;border-radius:10px;" > country: <span style="color: #FF6347">*</span></label><br>
		<input id="country" type="text" name="country" placeholder="Your country"  style="border: solid 1px;margin-left:10px;height:30px;width: 250px"required="required" oninput="onlyAlphabets(event)" onkeypress="return /[a-zA-Z]/i.test(event.key)">
		<br>
		<br>
		<!-- <label  for="exampleFormControlFile1" style="margin-left: 10px; color: #FFFFF0;border-radius:5px;" > SELECT FILE: <span style="color: #FF6347">*</span></label><br>
		<input id="inputFile" type="file"   style="border: solid 1px;margin-left:10px;width: 150px">
		 <textarea class="form-control-file" id="finename" hidden="hidden"></textarea> -->
		 
		 <tr>
        <td class="labels"><label for="base64" style="color:black;font-size:1.75em;">Upload Image : </label> </td>
        <td><input type="file" id="base64" style="height:30px;" required="required" /> </td>
    </tr>
		<br>
		 <img  id="image">
		<br>
		
<!-- AGREEMENT INFO -->
		
<!-- style="font-size: 100%" changes the size of the paragraph -->
		<p style="font-size: 90%; color: #FFFFF0; margin-left: 10px">(<span style="color: #FF6347">*</span>):  fields</p>
		<br>
<!-- SUBMIT AND RESET INFO -->
		<label for="submit"></label>
<!-- type="reset" to clear all the fields of text -->
<button value="submit" onclick="load()" style="margin-left:30px;border-radius:5px;font-size:1.75em;">Save</button>
		<label for="reset"></label>
		<input id="reset" type="reset" style="margin-left:30px; border-radius:5px;font-size:1.75em;" name="reset">
	</form>
	</div>
</body>
</html>