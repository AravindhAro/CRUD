<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<!-- Data tables Style and Script -->
<!-- adding css -->
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

<!-- Adding JQuery --><script
 src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script
 src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
<script
 src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- Adding datatables cdn -->
<script src="http://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<script
 src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script
 src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
<script
 src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>

<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script type="text/javascript">
$(document).ready(function(){
$.ajax({
url:"http://localhost:8080/getalldata",
data:"",
type:"GET",
dataType:"json",
	success : function(response){
	var table=$('#DonorDetails').DataTable({
		
		data:response,
		dom:"Bfrtip",
		buttons:['copy','csv','pdf','excel'],
		columns:[{title:"ID",
		      "data":"id"},

			{title:"Name",
	      "data":"name"},
	      {title:"email",
		  "data":"email"},
		   {title:"age",
			 "data":"age"},
			{title:"mobile",
			 "data":"mobile"},
			{title:"bloodgroup",
			  "data":"bloodgroup"},
			 {title:"lastdonate",
			  "data":"lastdonate"},
			  {title:"city",
				  "data":"city"},
			  {title:"country",
				  "data":"country"},
				  {
				      title: "Actions",
				      "fnCreatedCell":function(data) {
				    	  $(data).html("<input type='button' class='btn btn-warning'   data-toggle='modal' data-target='#exampleModal' value='edit'> <input type='button' class='btn btn-danger' value='Delete'>");
				      },}]
		});
	$('#DonorDetails tbody').on('click','.btn-warning',function(){

		var id = $(this).closest('tr').find('td:eq(0)').text();
		var name = $(this).closest('tr').find('td:eq(1)').text();
		var email = $(this).closest('tr').find('td:eq(2)').text();
		var age = $(this).closest('tr').find('td:eq(3)').text();
		var mobile = $(this).closest('tr').find('td:eq(4)').text();
		var bloodgroup = $(this).closest('tr').find('td:eq(5)').text();
		var lastdonate = $(this).closest('tr').find('td:eq(6)').text();
		var city = $(this).closest('tr').find('td:eq(7)').text();
		var country = $(this).closest('tr').find('td:eq(8)').text();

		
		document.getElementById('id').value = id;
		document.getElementById('name').value = name;
		document.getElementById('email').value = email;
		document.getElementById('age').value = age;
		document.getElementById('mobile').value = mobile;
		document.getElementById('bloodgroup').value = bloodgroup;
		document.getElementById('lastdonate').value = lastdonate;
		document.getElementById('city').value = city;
		document.getElementById('country').value = country;

	});
	
	$('#DonorDetails tbody').on('click', '.btn-danger', function () {
		var id = $(this).closest('tr').find('td:eq(0)').text();
		 
		 $(document).ready(function() {
			  
			   swal({
			    title: "Are you sure?",
			    text: "Do you want to Delete this Record?",
			    type: "warning",
			    showCancelButton: true,
			    confirmButtonColor: "#DD6B55",
			    confirmButtonText: "Yes",
			    cancelButtonText: "No",
			    closeOnConfirm: false,
			    closeOnCancel: false
			    },
			    function(isConfirm){
			    if (isConfirm) {

		 $.ajax({
		 url: "http://localhost:8080/delete",
		 data: {id:id},
		 type: "GET",
		 dataType: "text",
		 success: function(result) {
			 location.reload();
		 
		 },
		 error: function() {
		 alert("error");
		 }
		 });
			    } else {
			        swal("Cancelled");
			        }
		 });
		 });
	});
		}
});	
});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 body {
	background-image:
		url(https://apollohealthlib.blob.core.windows.net/health-library/2021/06/shutterstock_541600759-scaled.jpg);
	background-size: cover;
	 background-color: #fff; 
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
  padding-inline: 15rem;
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
  gap: 3rem;
  list-style: none;
  margin-left:10px;
}

.nav-link, #brand {
  
  color: #111;
  font-size: 2rem;
  font-family: 'Abel', sans-serif;
  text-transform: uppercase;
  transition: 350ms cubic-bezier(0.65, 0, 0.35, 1);
}
h2{
font-color:white;
width:300px;
margin-top : 70px;
    background-color: #0000ff;
}


table, th, td {
	border: 1px solid black;
}
body {
	background-color:aqua;
}


</style>

</head>
<body>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">donor details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="/update" method="POST" style="background-color: #2F4F4F;width: 500px;height: 650px;border:solid;margin-top:60px">


		
		<h1 align="center" style="color: #FFFFF0">Registration Form</h1>
		<br>
<label for="id" style="margin-left: 10px; color: #FFFFF0" > id: <span style="color: #FF6347">*</span></label><br>
		<input id="id" type="text" name="id" placeholder=ID style="border: solid 1px;margin-left:10px; width: 400px" readonly>
		<br>

		<label for="name" style="margin-left: 10px; color: #FFFFF0" > Name: <span style="color: #FF6347">*</span></label><br>
		<input id="name" type="text" name="name" placeholder="Your Name"  style="border: solid 1px;margin-left:10px; width: 400px">
		<br>
<!-- <br> line break in text -->
<!-- style="margin-left: 10px" gives margin in the form of 10px -->
		<br>
		<label for="email" style="margin-left: 10px;;color: #FFFFF0">Email: <span style="color: #FF6347">*</span></label><br>
		<input id="email" type="email" name="email" style="border: solid 1px;margin-left: 10px;width: 400px;" placeholder="example@anymail.com" >
		<br>
		<br>
<!-- age INFO -->
		<label for="age" style="margin-left: 10px; color: #FFFFF0" > AGE: <span style="color: #FF6347">*</span></label><br>
		<input id="age" type="text" maxlength="3" name="age" placeholder="Your Age"  style="border: solid 1px;margin-left:10px;width: 100px">
		<br>
		<br>
<!-- DATE OF BIRTH INFO -->
		<legend style="color: #FFFFF0; margin-left: 10px">Mobile Number: <span style="color: #FF6347">*</span></legend>
		<label for="month" style="margin-left: 10px"></label>
		<input type="number" id="mobile" name="mobile">
		<br>
		<br>
<!-- bloodgroup INFO -->
		<label for="bloodgroup" style="margin-left: 10px;;color: #FFFFF0"> Blood Group: <span style="color: #FF6347">*</span></label><br>
		<input id="bloodgroup" type="text" name="bloodgroup" placeholder="Your bloodgroup"  style="border: solid 1px;margin-left:10px;width: 100px">
		<br>
		<br>
<!-- lastdonate INFO -->
			<legend style="color: #FFFFF0; margin-left: 10px">Last Donation: <span style="color: #FF6347">*</span></legend>
		<label for="lastdonate" style="margin-left: 10px"></label>
		<input type="date" id="lastdonate" name="lastdonate">
		<br>
		<br>
<!-- required title="5 to 10 characters" pattern=".{5,10}" to set the lenght of the input password box min 5 chars, max 10 chars and display the message you want "5 to 10 characters" -->
<!-- city INFO -->
		<label for="city" style="margin-left: 10px; color: #FFFFF0" > city: <span style="color: #FF6347">*</span></label><br>
		<input id="city" type="text" name="city" placeholder="Your city"  style="border: solid 1px;margin-left:10px;width: 150px">
		<br>
		<br>
<!-- country CONFIRMATION INFO -->
		<label for="country" style="margin-left: 10px; color: #FFFFF0" > country: <span style="color: #FF6347">*</span></label><br>
		<input id="country" type="text" name="country" placeholder="Your country"  style="border: solid 1px;margin-left:10px;width: 150px">
		<br>
		<br>
<!-- AGREEMENT INFO -->
		
<!-- style="font-size: 100%" changes the size of the paragraph -->
		<p style="font-size: 90%; color: #FFFFF0; margin-left: 10px">(<span style="color: #FF6347">*</span>):  fields</p>
		<br>
<!-- SUBMIT AND RESET INFO -->
	
    
	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      
        <button type="submit" class="btn btn-primary">Save changes</button>
    
      </div>
    </div>
    
  </div>
  
</div>
  </form>


<div>
<nav class="navbar">
  <!-- Logo !-->
  <a id="brand" href="http://localhost:8080/home" style= "padding-right: 500px;" >Home</a>
  <ul class="nav-list">
    <!-- Link 1 !-->
    <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/ajax">DonorList</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/search">Search</a>
    </li>
    
    <!-- Link 2 !-->
    <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/registor">Register</a>
    </li>
    <!-- Link 3 !-->
     <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/eligibility">eligibility</a>
    
    
     <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/login">logout</a>
    </li>
    
  </ul>
</nav>
</div >

	<center><h2 class="w3-text-light-grey" style="border-radius:5px;font-family:san-serif"> DONORS DATA TABLE</h2></center>
<div >
<table id="DonorDetails" name="Donor Details" value="Donor Details" >

 									
</table>
</div>
</body>
</html>
