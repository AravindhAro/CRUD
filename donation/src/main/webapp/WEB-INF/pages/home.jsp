<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Blood Donors in India, Largest Voluntary Blood Donors Database</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="Description" content="India's blood donor database; register as blood donor and save life ;">
        <meta name="Keywords" content="blood, blood donor, blood bank, blood banks, blood donors,donor database, seek donors, get donors, donors on request, voluntary donors, search donors, donors list, donors on demand, donate blood, register donors, register donor, get donor, seek donor, voluntary donor, search donor, voluntary donors, blood donation, india blood donors,indian blood donors,online blood bank">
        <link rel="stylesheet" href="style_donors.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        
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
        					  ]
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
        
        
        
        
        
        <style type="text/css">
        
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap');
body {margin:0;
      background-color: white;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
      font-family: 'Quicksand', Helvetica, sans-serif;
      font-weight: 400;
      font-size: 1rem;
      overflow-x: hidden;
      overflow-y:auto}
.txtfeature{color: #555;}
.siteTitle{
    font-family: 'Quicksand', sans-serif;
    color: cornsilk;
    background-color: #fff;
    /*background-image: linear-gradient(to right, #C04848 , #480048);*/
    font-size: 3rem;
    /*float: left;*/
    padding: 15px 60px 9px 25px;  text-shadow: 2px 2px #888888;
}
.subTitle{
    display: table;
    font-size: .7rem;
    color: #000;
    /*letter-spacing:1px;*/
    /*padding: 15px 60px 0 25px;*/  
    /*text-shadow: 2px 2px #888888;*/
}
.center-div {
    margin: auto;
    width: 50%;
}
a {
    color: #00aeef;
    text-decoration: none
}
.page-header {
    padding-bottom: 9px;
    /*margin: 40px 0 20px;*/
    border-bottom: 1px solid #eee
}
#div_cart{
    border-radius: 5px;
    background: #73AD21;
    padding: 1px;
    vertical-align: top;
    float: right;
    font-size: 75%;
} 
.table-hover{
    padding: 8px;
    text-align: left;
    /*border-bottom: 1px solid #ddd;*/
}
.table > thead > tr > th{
    vertical-align: bottom;
    border-bottom: 2px solid #ddd;
}
.table > tbody > tr > td {
    vertical-align: bottom;
    border-bottom: 1px solid #ddd;
    padding:8px;
}
.gallery {
    margin: 5px;
    /*border: 1px solid #ccc;*/
    float: left;
    /*padding: 5px;*/
    width: 100%;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
}

/*.gallery:hover {
    border: 1px solid #777;
}*/

.gallery img {
    width: 100%;
    height: auto;
}

.desc {
    padding: 15px;
    text-align: center;
    background-color: #f6f6f6;
}
.menu-title{
    color: #000;
    font-size: 1rem;
    min-height: 40px;
}
.amount{
    /*text-align: center;*/
    font-weight: bold;
    /*color: #CE011A;*/
    color: #000;
    font-size: 1.5rem;
}
.details{
    font-size: .8rem;
    color: #555;
    padding: 10px;
    line-height: 1.5;
    min-height: 150px;
}
.fa {
    text-align: center;
    text-decoration: none;
    margin: 5px 2px;
    border-radius: 50%;
    color: #9a9a99;
}

.fa:hover {
    opacity: 0.7;
}

.fa-facebook {
    background: #3B5998;
    color: white;
}

.fa-twitter {
    background: #55ACEE;
    color: white;
}

.fa-google {
    background: #dd4b39;
    color: white;
}

.fa-linkedin {
    background: #007bb5;
    color: white;
}
.topnav {
    overflow: hidden;
    /*background-color: #CE011A;*/
    /*margin-top: -53px;*/
}

.topnav a {
    float: left;
    display: block;
    color: white;
    text-align: center;
    padding: 17px 16px;
    text-decoration: none;
    /*font-size: 14px;*/
    border-radius:4px;
    font-weight:bold;
}

.active {
    background-color: #4CAF50;
    color: white;
}

.topnav .icon {
    display: none;
}

.dropdown {
    float: left;
    overflow: hidden;
    border-radius:4px;
}

.dropdown .dropbtn {
    font-size: 14px;    
    border: none;
    outline: none;
    color: white;
    padding: 14.5px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
    border-radius:4px;
    font-weight: bold;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 170px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
}

.topnav a:hover, .dropdown:hover .dropbtn {
    background-color: #CE011A;
    color: white;
}

.dropdown-content a:hover {
    background-color: #fdbb2d;
    color: black;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.columns {
    float: left;
    width: 33.33%;
    padding: 8px;
}


.price {
    list-style-type: none;
    border: 0 0 1px 0 solid #9e9e9e;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price .header {
    background-color: #111;
    color: white;
    font-size: 25px;
}

.price li {
    border-bottom: 1px solid #9e9e9e;
    padding: 20px;
    text-align: center;
}

.price .grey {
    background-color: #eee;
    font-size: 20px;
}
#homebanner{
    background-image: linear-gradient(to right, #480048 , #C04848);
    height: 100vh;
}
.top-banner{
    /*width: 100%;*/
    /*text-align: center;*/
    float: left;
    padding: 10px;
}
#homebanner1{
    background-image: linear-gradient(to right, #22c1c3 , #fdbb2d);
    /*height: 150px;*/
}
#top1-1{
    margin-top:10px;padding-left: 0px;padding-right: 0px;
}
#top2{
    text-align: right;
    color:#fff;
    padding-top: 13px;
}
#top3{
    display: block;
}
#logo1{
    display: none;
}
#ad1{
    display: none;
}
@media screen and (max-width: 600px) {
    .topnav a:not(:first-child), .dropdown .dropbtn {
        display: none;
    }
    .topnav a.icon {
        float: right;
        display: block;
    }
}
@media screen and (max-width: 600px) {
    .topnav.responsive {position: relative;margin-top: 0px;padding-left: 0;padding-right: 0;}
    .topnav.responsive .icon {
        position: absolute;
        right: 0;
        top: 0;
    }
    .topnav.responsive a {
        float: none;
        display: block;
        text-align: left;
    }
    .topnav.responsive .dropdown {float: none;}
    .topnav.responsive .dropdown-content {position: relative;}
    .topnav.responsive .dropdown .dropbtn {
        display: block;
        width: 100%;
        text-align: left;
    }
    #top1{
        padding-left: 0px;
        padding-right: 0px;
    }
    #top1-1{
        margin-top:0px;
    }
    #top2{
        text-align: center;
    }
    #top3{
        display: none;
    }
    .columns {
        width: 100%;
    }
    .top-banner{
        width: 100%;
        text-align: center;
        padding: 10px;
    }
    .topnav{
        background-color: #333;
        margin-top: 0px;
        /*padding-top: 20px;*/
    }
    #homebanner{
        background-image: linear-gradient(to right, #22c1c3 , #fdbb2d);
        height: 150px;
    }
    #logo{
        text-align: center;
    }
    #logo1{
        display:block;
        text-align: center;
        padding-top: 10px;
    }
    #ad1{
        display: none;
    }
    .siteTitle{
        display: block;
        font-size: 3rem;
        width: 100%;
        text-align: center;
        padding: 0px;  text-shadow: 2px 2px #888888;
    }
    .navbar-header {
        /*float: left;*/
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
    }
    .navbar-header1{
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 65%;
    }
    .navbar-header2{
        display: none;
    }
    .colext{
        float: left;
        width: 33.33333%;
    }
    .domnamsearchresult{
        /*float: left;*/
        width: 99.99999%;
    }
    .hostbox{
        width: 99.99999%;
    }
    .hostside{
        width: 99.99999%;
    }

    input[type=text], select, textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }
}
/* Clear floats after the columns */
/*new*/
/*W3.CSS 3.04 Apr 2017 by Jan Egil and Borge Refsnes*/ 
/*nav{position:relative;width:980px;margin:0 auto;}*/
html {
    box-sizing: border-box
}

* , * :before, * :after {
    box-sizing: inherit
}

Extract from normalize.css by Nicolas Gallagher and Jonathan Neal git.io/normalize 
html {
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%
}

body {
    margin: 0
}

article, aside, details, figcaption, figure, footer, header, main, menu,
nav, section, summary {
    display: block
}

audio, canvas, progress, video {
    display: inline-block
}

progress {
    vertical-align: baseline
}

audio:not([controls]) {
    display: none;
    height: 0
}

[hidden], template {
    display: none
}

a {
    background-color: transparent;
    -webkit-text-decoration-skip: objects
}

a:active, a:hover {
    outline-width: 0
}

abbr[title] {
    border-bottom: none;
    text-decoration: underline;
    text-decoration: underline dotted
}

dfn {
    font-style: italic
}

mark {
    background: #ff0;
    color: #000
}

small {
    font-size: 80%
}

sub, sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline
}

sub {
    bottom: -0.25em
}

sup {
    top: -0.5em
}

figure {
    margin: 1em 40px
}

img {
    border-style: none
}

svg:not(:root) {
    overflow: hidden
}

code, kbd, pre, samp {
    font-family: monospace, monospace;
    font-size: 1em
}

hr {
    box-sizing: content-box;
    height: 0;
    overflow: visible
}

button, input, select, textarea {
    font: inherit;
    margin: 0
}

optgroup {
    font-weight: bold
}

button, input {
    overflow: visible
}

button, select {
    text-transform: none
}

button, html [type=button], [type=reset], [type=submit] {
    -webkit-appearance: button
}

button::-moz-focus-inner, [type=button]::-moz-focus-inner, [type=reset]::-moz-focus-inner,
[type=submit]::-moz-focus-inner {
    border-style: none;
    padding: 0
}

button:-moz-focusring, [type=button]:-moz-focusring, [type=reset]:-moz-focusring,
[type=submit]:-moz-focusring {
    outline: 1px dotted ButtonText
}

fieldset {
    border: 1px solid #c0c0c0;
    margin: 0 2px;
    padding: .35em .625em .75em
}

legend {
    color: inherit;
    display: table;
    max-width: 100%;
    padding: 0;
    white-space: normal
}

textarea {
    overflow: auto
}

[type=checkbox], [type=radio] {
    padding: 0
}

[type=number]::-webkit-inner-spin-button, [type=number]::-webkit-outer-spin-button {
    height: auto
}

[type=search] {
    -webkit-appearance: textfield;
    outline-offset: -2px
}

[type=search]::-webkit-search-cancel-button, [type=search]::-webkit-search-decoration {
    -webkit-appearance: none
}

::-webkit-input-placeholder {
    color: inherit;
    opacity: 0.54
}

::-webkit-file-upload-button {
    -webkit-appearance: button;
    font: inherit
}

End extract 
/*html, body {
    font-family: Verdana, sans-serif;
    font-size: 15px;
    line-height: 1.5
}*/

html {
    overflow-x: hidden
}

h1, h2, h3, h4, h5, h6, .slim, .wide {
    font-family: "Segoe UI", Arial, sans-serif
}

h1 {
    font-size: 36px
}

h2 {
    font-size: 30px
}

h3 {
    font-size: 24px
}

h4 {
    font-size: 20px
}

h5 {
    font-size: 18px
}

h6 {
    font-size: 16px
}

.serif {
    font-family: "Times New Roman", Times, serif
}

h1, h2, h3, h4, h5, h6 {
    font-weight: 400;
    margin: 10px 0
}

.wide {
    letter-spacing: 4px
}

h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {
    font-weight: inherit
}

hr {
    border: 0;
    border-top: 1px solid #eee;
    margin: 20px 0
}

img {
    /*margin-bottom: -5px*/
}

a {
    color: inherit
}

.image {
    max-width: 100%;
    height: auto
}
.table, .table-all {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    display: table
}

.table-all {
    border: 1px solid #ccc
}

.bordered tr, .table-all tr {
    border-bottom: 1px solid #ddd
}

.striped tbody tr:nth-child(even) {
    background-color: #f1f1f1
}

.table-all tr:nth-child(odd) {
    background-color: #fff
}

.table-all tr:nth-child(even) {
    background-color: #f1f1f1
}

.hoverable tbody tr:hover, .ul.hoverable li:hover {
    background-color: #ccc
}

.centered tr th, .centered tr td {
    text-align: center
}

.table td, .table th, .table-all td, .table-all th {
    padding: 8px 8px;
    display: table-cell;
    text-align: left;
    vertical-align: top
}

.table th:first-child, .table td:first-child, .table-all th:first-child,
.table-all td:first-child {
    padding-left: 16px
}

.btn, .btn-block, .button {
    border: none;
    display: inline-block;
    outline: 0;
    padding: 6px 16px;
    vertical-align: middle;
    overflow: hidden;
    text-decoration: none !important;
    color: #fff;
    background-color: #000;
    text-align: center;
    cursor: pointer;
    border-radius: 4px;
    white-space: nowrap
}

.btn:hover, .btn-block:hover, .btn-floating:hover, .btn-floating-large:hover {
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
}

.button {
    color: #000;
    background-color: #d8d8d8;
    padding: 8px 16px
}

.button:hover {
    color: #000 !important;
    background-color: #ccc !important
}

.btn, .btn-floating, .btn-floating-large, .closenav,
.opennav, .btn-block, .button {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

.btn-floating, .btn-floating-large {
    display: inline-block;
    text-align: center;
    color: #fff;
    background-color: #000;
    position: relative;
    overflow: hidden;
    z-index: 1;
    padding: 0;
    border-radius: 50%;
    cursor: pointer;
    font-size: 24px
}

.btn-floating {
    width: 40px;
    height: 40px;
    line-height: 40px
}

.btn-floating-large {
    width: 56px;
    height: 56px;
    line-height: 56px
}

.disabled, .btn:disabled, .button:disabled, .btn-floating:disabled,
.btn-floating-large:disabled {
    cursor: not-allowed;
    opacity: 0.3
}

.disabled * , :disabled * {
    pointer-events: none
}

.btn.disabled:hover, .btn-block.disabled:hover, .btn:disabled:hover,
.btn-floating.disabled:hover, .btn-floating:disabled:hover,
.btn-floating-large.disabled:hover, .btn-floating-large:disabled:hover {
    box-shadow: none
}

.btn-group .btn {
    float: left
}

.btn-block {
    width: 100%
}

.btn-bar .btn {
    box-shadow: none;
    background-color: inherit;
    color: inherit;
    float: left
}

.btn-bar .btn:hover {
    background-color: #ccc
}
.badge, .tag, .sign {
    background-color: #000;
    color: #fff;
    display: inline-block;
    padding-left: 8px;
    padding-right: 8px;
    text-align: center
}

.badge {
    border-radius: 50%
}

ul.ul {
    list-style-type: none;
    padding: 0;
    margin: 0
}

ul.ul li {
    padding: 8px 16px;
    border-bottom: 1px solid #ddd
}

ul.ul li:last-child {
    border-bottom: none
}

.tooltip, .display-container {
    position: relative
}

.tooltip .text {
    display: none
}

.tooltip:hover .text {
    display: inline-block
}

/*.navbar {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden
}

.navbar li {
    float: left
}

.navbar li a, .navitem, .navbar li .btn, .navbar li .input {
    display: block;
    padding: 8px 16px
}

.navbar li .btn, .navbar li .input {
    border: none;
    outline: none;
    width: 100%
}

.navbar li a:hover {
    color: #000;
    background-color: #ccc
}

.navbar .dropdown-hover, .navbar .dropdown-click {
    position: static
}

.navbar .dropdown-hover:hover, .navbar .dropdown-hover:first-child,
.navbar .dropdown-click:hover {
    background-color: #ccc;
    color: #000
}

.navbar a, .topnav a, .sidenav a, .dropdown-content a, .accordion-content a,
.navbar a,  .sidenav a, .dropdown-content a, .accordion-content a,
.dropnav a, .navblock a {
    text-decoration: none !important
}

.navbar .opennav.right {
    float: right !important
}

.topnav {
    padding: 8px 8px

.navblock .dropdown-hover:hover, .navblock .dropdown-hover:first-child,
.navblock .dropdown-click:hover {
    background-color: #ccc;
    color: #000
}

.navblock .dropdown-hover, .navblock .dropdown-click {
    width: 100%
}

.navblock .dropdown-hover .dropdown-content, .navblock .dropdown-click .dropdown-content {
    min-width: 100%
}*/

/*.topnav a {
    padding: 0 8px;
    border-bottom: 3px solid transparent;
    -webkit-transition: border-bottom .25s;
    transition: border-bottom .25s
}

.topnav a:hover {
    border-bottom: 3px solid #fff
}

.topnav .dropdown-hover a {
    border-bottom: 0
}*/

.opennav, .closenav {
    color: inherit
}

.opennav:hover, .closenav:hover {
    cursor: pointer;
    opacity: 0.8
}

.btn, .btn-floating, .dropnav a, .btn-floating-large,
.btn-block, .navbar a, .navblock a, .sidenav a, .pagination li a,
.hoverable tbody tr, .hoverable li,
.accordion-content a, .dropdown-content a,
.dropdown-click:hover, .dropdown-hover:hover, .opennav,
.closenav, .closebtn, * [class * ="hover-"]
{
    -webkit-transition: background-color .25s, color .15s, box-shadow .25s, opacity 0.25s, filter 0.25s, border 0.15s;
    transition: background-color .25s, color .15s, box-shadow .15s, opacity .25s, filter .25s, border .15s
}

.ripple:active {
    opacity: 0.5
}

.ripple {
    -webkit-transition: opacity 0s;
    transition: opacity 0s
}

.sidenav, .sidebar {
    height: 100%;
    width: 200px;
    background-color: #fff;
    position: fixed !important;
    z-index: 1;
    overflow: auto
}

.sidenav a, .navblock a {
    padding: 4px 2px 4px 16px
}

.sidenav a:hover, .navblock a:hover {
    background-color: #ccc;
    color: #000
}

.sidenav a, .dropnav a, .navblock a {
    display: block
}

.sidenav .dropdown-hover:hover, .sidenav .dropdown-hover:first-child,
.sidenav .dropdown-click:hover, .dropnav a:hover {
    background-color: #ccc;
    color: #000
}

.sidenav .dropdown-hover, .sidenav .dropdown-click,
.bar-block .dropdown-hover, .bar-block .dropdown-click {
    width: 100%
}

.sidenav .dropdown-hover .dropdown-content, .sidenav .dropdown-click .dropdown-content,
.bar-block .dropdown-hover .dropdown-content, .bar-block .dropdown-click .dropdown-content {
    min-width: 100%
}

.bar-block .dropdown-hover .button, .bar-block .dropdown-click .button {
    width: 100%;
    text-align: left;
    background-color: inherit;
    color: inherit;
    padding: 8px 16px
}

.main, #main {
    transition: margin-left .4s
}

.modal {
    z-index: 3;
    display: none;
    padding-top: 100px;
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.4)
}

.modal-content {
    margin: auto;
    background-color: #fff;
    position: relative;
    padding: 0;
    outline: 0;
    width: 600px
}

.closebtn {
    text-decoration: none;
    float: right;
    font-size: 24px;
    font-weight: bold;
    color: inherit
}

.closebtn:hover, .closebtn:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer
}

.pagination {
    display: inline-block;
    padding: 0;
    margin: 0
}

.pagination li {
    display: inline
}

.pagination li a {
    text-decoration: none;
    color: #000;
    float: left;
    padding: 8px 16px
}

.pagination li a:hover {
    background-color: #ccc
}

/*.input-group, .group {
    margin-top: 24px;
    margin-bottom: 24px
}*/

.input {
    padding: 8px;
    display: block;
    border: none;
    border-bottom: 1px solid #808080;
    width: 100%
}
.input-group {
    position: relative;
    display: table;
    border-collapse:separate
}

.input-group[class * =col-] {
    float: none;
    padding-right: 0;
    padding-left:0
}

.input-group .form-control {
    position: relative;
    z-index: 2;
    float: left;
    width: 100%;
    margin-bottom:0
}

.input-group-lg > .form-control, .input-group-lg > .input-group-addon, .input-group-lg > .input-group-btn > .btn {
    height: 46px;
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius:6px
}

select.input-group-lg > .form-control, select.input-group-lg > .input-group-addon, select.input-group-lg > .input-group-btn > .btn {
    height: 46px;
    line-height:46px
}

select[multiple].input-group-lg > .form-control, select[multiple].input-group-lg > .input-group-addon, select[multiple].input-group-lg > .input-group-btn > .btn, textarea.input-group-lg > .form-control, textarea.input-group-lg > .input-group-addon, textarea.input-group-lg > .input-group-btn > .btn {
    height:auto
}

.input-group-sm > .form-control, .input-group-sm > .input-group-addon, .input-group-sm > .input-group-btn > .btn {
    height: 30px;
    padding: 5px 10px;
    font-size: 12px;
    line-height: 1.5;
    border-radius:3px
}

select.input-group-sm > .form-control, select.input-group-sm > .input-group-addon, select.input-group-sm > .input-group-btn > .btn {
    height: 30px;
    line-height:30px
}

select[multiple].input-group-sm > .form-control, select[multiple].input-group-sm > .input-group-addon, select[multiple].input-group-sm > .input-group-btn > .btn, textarea.input-group-sm > .form-control, textarea.input-group-sm > .input-group-addon, textarea.input-group-sm > .input-group-btn > .btn {
    height:auto
}

.input-group .form-control, .input-group-addon, .input-group-btn {
    display:table-cell
}

.input-group .form-control:not(:first-child):not(:last-child), .input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child) {
    border-radius:0
}

.input-group-addon, .input-group-btn {
    width: 1%;
    white-space: nowrap;
    vertical-align:middle
}

.input-group-addon {
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    text-align: center;
    background-color: #eee;
    border: 1px solid #ccc;
    border-radius:4px
}

.input-group-addon.input-sm {
    padding: 5px 10px;
    font-size: 12px;
    border-radius:3px
}

.input-group-addon.input-lg {
    padding: 10px 16px;
    font-size: 18px;
    border-radius:6px
}

.input-group-addon input[type=checkbox], .input-group-addon input[type=radio] {
    margin-top:0
}

.input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child > .btn, .input-group-btn:first-child > .btn-group > .btn, .input-group-btn:first-child > .dropdown-toggle, .input-group-btn:last-child > .btn-group:not(:last-child) > .btn, .input-group-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle) {
    border-top-right-radius: 0;
    border-bottom-right-radius:0
}

.input-group-addon:first-child {
    border-right:0
}

.input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:first-child > .btn-group:not(:first-child) > .btn, .input-group-btn:first-child > .btn:not(:first-child), .input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group > .btn, .input-group-btn:last-child > .dropdown-toggle {
    border-top-left-radius: 0;
    border-bottom-left-radius:0
}

.input-group-addon:last-child {
    border-left:0
}

.input-group-btn {
    position: relative;
    font-size: 0;
    white-space:nowrap
}

.input-group-btn > .btn {
    position:relative
}

.input-group-btn > .btn + .btn {
    margin-left:-1px
}

.input-group-btn > .btn:active, .input-group-btn > .btn:focus, .input-group-btn > .btn:hover {
    z-index:2
}

.input-group-btn:first-child > .btn, .input-group-btn:first-child > .btn-group {
    margin-right:-1px
}

.input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group {
    z-index: 2;
    margin-left:-1px
}
.label {
    color: #009688
}

.input:not(:valid) ~ .validate {
    color: #f44336
}

.select {
    padding: 9px 0;
    width: 100%;
    color: #000;
    border: 1px solid transparent;
    border-bottom: 1px solid #009688
}

.select select:focus {
    color: #000;
    border: 1px solid #009688
}

.select option[disabled] {
    color: #009688
}

.dropdown-click, .dropdown-hover {
    position: relative;
    display: inline-block;
    cursor: pointer
}

.dropdown-hover:hover .dropdown-content {
    display: block;
    z-index: 1
}

.dropdown-hover:first-child, .dropdown-click:hover {
    background-color: #ccc;
    color: #000
}

.dropdown-hover:hover > .button:first-child, .dropdown-click:hover > .button:first-child {
    background-color: #ccc;
    color: #000
}

.dropdown-content {
    cursor: auto;
    color: #000;
    background-color: #fff;
    display: none;
    position: absolute;
    min-width: 160px;
    margin: 0;
    padding: 0;
    border-bottom-left-radius:4px;
    border-bottom-right-radius:4px;
}

.dropdown-content a {
    padding: 16px 16px;
    display: block;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
}

.dropdown-content a:hover {
    background-color: #fdbb2d;;//#ccc
}

.accordion {
    width: 100%;
    cursor: pointer
}

.accordion-content {
    cursor: auto;
    display: none;
    position: relative;
    width: 100%;
    margin: 0;
    padding: 0
}

.accordion-content a {
    padding: 6px 16px;
    display: block
}

.accordion-content a:hover {
    background-color: #ccc
}

.progress-container {
    width: 100%;
    height: 1.5em;
    position: relative;
    background-color: #f1f1f1
}

.progressbar {
    background-color: #757575;
    height: 100%;
    position: absolute;
    line-height: inherit
}

input[type=checkbox].check, input[type=radio].radio {
    width: 24px;
    height: 24px;
    position: relative;
    top: 6px
}

input[type=checkbox].check:checked + .validate, input[type=radio].radio:checked + .validate {
    color: #009688
}

input[type=checkbox].check:disabled + .validate, input[type=radio].radio:disabled + .validate {
    color: #aaa
}

.bar {
    width: 100%;
    overflow: hidden
}

.center .bar {
    display: inline-block;
    width: auto
}

.bar .bar-item {
    padding: 8px 16px;
    float: left;
    background-color: inherit;
    color: inherit;
    width: auto;
    border: none;
    outline: none;
    display: block
}

.bar .dropdown-hover, .bar .dropdown-click {
    position: static;
    float: left
}

.bar .button {
    background-color: inherit;
    color: inherit;
    white-space: normal
}

.bar-block .bar-item {
    width: 100%;
    display: block;
    padding: 8px 16px;
    text-align: left;
    background-color: inherit;
    color: inherit;
    border: none;
    outline: none;
    white-space: normal;
    float: none
}

.bar-block.center .bar-item {
    text-align: center
}

.block {
    display: block;
    width: 100%
}

.responsive {
    overflow-x: auto
}

.container:after, .container:before, .panel:after, .panel:before,
.row:after, .row:before, .row-padding:after, .row-padding:before,
.cell-row:before, .cell-row:after,
.topnav:after, .topnav:before,
.clear:after, .clear:before, .btn-group:before, .btn-group:after,
.btn-bar:before, .btn-bar:after, .bar:before, .bar:after
{
    content: "";
    display: table;
    clear: both
}

.col, .half, .third, .twothird, .threequarter, .quarter {
    float: left;
    width: 100%
}

.col.s1 {
    width: 8.33333%
}

.col.s2 {
    width: 16.66666%
}

.col.s3 {
    width: 24.99999%
}

.col.s4 {
    width: 33.33333%
}

.col.s5 {
    width: 41.66666%
}

.col.s6 {
    width: 49.99999%
}

.col.s7 {
    width: 58.33333%
}

.col.s8 {
    width: 66.66666%
}

.col.s9 {
    width: 74.99999%
}

.col.s10 {
    width: 83.33333%
}

.col.s11 {
    width: 91.66666%
}

.col.s12, .half, .third, .twothird, .threequarter,
.quarter {
    width: 99.99999%
}

@media (min-width:601px) {
    .navbar-header {
        float: left;
    }
    .navbar-header1 {
        /*padding-right: 500px;*/
        float: left;
    }
    .navbar-header2{
        float:right;
    }
    .navbar-header3{
        display: none;
    }
    .colext{
        float: left;
        width: 16.66666%;
    }
    .indexdomainsearch{
        padding-bottom: 60px; padding-top: 60px; 
    }
    .domnamsearchresult{
        float: left;
        width: 49.99999%;
    }
    .hostbox{
        float: left;
        width: 74.99999%;
    }
    .hostside{
        float: left;
        width: 24.99999%;
    }
    .col.m1 {
        width: 8.33333%
    }

    .col.m2 {
        width: 16.66666%
    }

    .col.m3, .quarter {
        width: 24.99999%
    }

    .col.m4, .third {
        width: 33.33333%
    }

    .col.m5 {
        width: 41.66666%
    }

    .col.m6, .half {
        width: 49.99999%
    }

    .col.m7 {
        width: 58.33333%
    }

    .col.m8, .twothird {
        width: 66.66666%
    }

    .col.m9, .threequarter {
        width: 74.99999%
    }

    .col.m10 {
        width: 83.33333%
    }

    .col.m11 {
        width: 91.66666%
    }

    .col.m12 {
        width: 99.99999%
    }
}

@media (min-width:993px) {
    .col.l1 {
        width: 8.33333%
    }

    .col.l2 {
        width: 16.66666%
    }

    .col.l3, .quarter {
        width: 24.99999%
    }

    .col.l4, .third {
        width: 33.33333%
    }

    .col.l5 {
        width: 41.66666%
    }

    .col.l6, .half {
        width: 49.99999%
    }

    .col.l7 {
        width: 58.33333%
    }

    .col.l8, .twothird {
        width: 66.66666%
    }

    .col.l9, .threequarter {
        width: 74.99999%
    }

    .col.l10 {
        width: 83.33333%
    }

    .col.l11 {
        width: 91.66666%
    }

    .col.l12 {
        width: 99.99999%
    }
}

.content {
    max-width: 980px;
    margin: auto
}

.rest {
    overflow: hidden
}

.layout-container, .cell-row {
    display: table;
    width: 100%
}

.layout-row {
    display: table-row
}

.layout-cell, .layout-col, .cell {
    display: table-cell
}

.layout-top, .cell-top {
    vertical-align: top
}

.layout-middle, .cell-middle {
    vertical-align: middle
}

.layout-bottom, .cell-bottom {
    vertical-align: bottom
}

.hide {
    display: none !important
}

.show-block, .show {
    display: block !important
}

.show-inline-block {
    display: inline-block !important
}

/*@media (max-width:600px) {
    .modal-content {
        margin: 0 10px;
        width: auto !important
    }

    .modal {
        padding-top: 30px
    }

    .topnav a {
        display: block
    }

    .navbar li:not(.opennav) {
        float: none;
        width: 100% !important
    }

    .navbar li.right {
        float: none !important
    }

    .topnav .dropdown-hover .dropdown-content, .navbar .dropdown-click .dropdown-content,
    .navbar .dropdown-hover .dropdown-content, .dropdown-hover.mobile .dropdown-content,
    .dropdown-click.mobile .dropdown-content {
        position: relative
    }

    .topnav, .navbar {
        margin-top: 180px;
        text-align: center
    }

    .hide-small {
        display: none !important
    }

    .layout-col, .mobile {
        display: block;
        width: 100% !important
    }

    .bar-item.mobile, .dropdown-hover.mobile, .dropdown-click.mobile {
        text-align: center
    }

    .dropdown-hover.mobile, .dropdown-hover.mobile .btn,
    .dropdown-hover.mobile .button, .dropdown-click.mobile,
    .dropdown-click.mobile .btn, .dropdown-click.mobile .button {
        width: 100%
    }
}*/

@media (max-width:768px) {
    .modal-content {
        width: 500px
    }

    .modal {
        padding-top: 50px
    }
}

@media (min-width:993px) {
    .modal-content {
        width: 900px
    }

    .hide-large {
        display: none !important
    }

    .sidenav.collapse, .sidebar.collapse {
        display: block !important
    }
}

@media (max-width:992px) and (min-width:601px) {
    .hide-medium {
        display: none !important
    }
}

@media (max-width:992px) {
    .sidenav.collapse, .sidebar.collapse {
        display: none
    }

    .main {
        margin-left: 0 !important;
        margin-right: 0 !important
    }
}

.top, .bottom {
    position: fixed;
    width: 100%;
    z-index: 1
}

.top {
    top: 0
}

.bottom {
    bottom: 0
}

.overlay {
    position: fixed;
    display: none;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 2
}

.left {
    float: left !important
}

.right {
    float: right !important
}

.tiny {
    font-size: 10px !important
}

.small {
    font-size: 12px !important
}

.medium {
    font-size: 15px !important
}

.large {
    font-size: 18px !important
}

.xlarge {
    font-size: 24px !important
}

.xxlarge {
    font-size: 36px !important
}

.xxxlarge {
    font-size: 48px !important
}

.jumbo {
    font-size: 64px !important
}

.vertical {
    word-break: break-all;
    line-height: 1;
    text-align: center;
    width: 0.6em
}

.left-align {
    text-align: left !important
}

.right-align {
    text-align: right !important
}

.justify {
    text-align: justify !important
}

.center {
    text-align: center !important
}

.display-topleft {
    position: absolute;
    left: 0;
    top: 0
}

.display-topright {
    position: absolute;
    right: 0;
    top: 0
}

.display-bottomleft {
    position: absolute;
    left: 0;
    bottom: 0
}

.display-bottomright {
    position: absolute;
    right: 0;
    bottom: 0
}

.display-middle {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%)
}

.display-left {
    position: absolute;
    top: 50%;
    left: 0%;
    transform: translate(0%, -50%);
    -ms-transform: translate(-0%, -50%)
}

.display-right {
    position: absolute;
    top: 50%;
    right: 0%;
    transform: translate(0%, -50%);
    -ms-transform: translate(0%, -50%)
}

.display-topmiddle {
    position: absolute;
    left: 50%;
    top: 0;
    transform: translate(-50%, 0%);
    -ms-transform: translate(-50%, 0%)
}

.display-bottommiddle {
    position: absolute;
    left: 50%;
    bottom: 0;
    transform: translate(-50%, 0%);
    -ms-transform: translate(-50%, 0%)
}

.display-container:hover .display-hover {
    display: block
}

.display-container:hover span.display-hover {
    display: inline-block
}

.display-hover {
    display: none
}

.display-position {
    position: absolute
}

.circle {
    border-radius: 50% !important
}

.round-small {
    border-radius: 2px !important
}

.round, .round-medium {
    border-radius: 4px !important
}

.round-large {
    border-radius: 8px !important
}

.round-xlarge {
    border-radius: 16px !important
}

.round-xxlarge {
    border-radius: 32px !important
}

.round-jumbo {
    border-radius: 64px !important
}

.border-0 {
    border: 0 !important
}

.border {
    border: 1px solid #ccc !important
}

.border-top {
    border-top: 1px solid #ccc !important
}

.border-bottom {
    border-bottom: 1px solid #ccc !important
}

.border-left {
    border-left: 1px solid #ccc !important
}

.border-right {
    border-right: 1px solid #ccc !important
}

.margin {
    margin: 16px !important
}

.margin-0 {
    margin: 0 !important
}

.margin-top {
    margin-top: 16px !important
}

.margin-bottom {
    margin-bottom: 16px !important
}

.margin-left {
    margin-left: 16px !important
}

.margin-right {
    margin-right: 16px !important
}

.section {
    margin-top: 16px !important;
    margin-bottom: 16px !important
}

.padding-tiny {
    padding: 2px 4px !important
}

.padding-small {
    padding: 4px 8px !important
}

.padding-medium, .padding, .form {
    padding: 8px 16px !important
}

.padding-large {
    padding: 12px 24px !important
}

.padding-xlarge {
    padding: 16px 32px !important
}

.padding-xxlarge {
    padding: 24px 48px !important
}

.padding-jumbo {
    padding: 32px 64px !important
}

.padding-4 {
    padding-top: 4px !important;
    padding-bottom: 4px !important
}

.padding-8 {
    padding-top: 8px !important;
    padding-bottom: 8px !important
}

.padding-12 {
    padding-top: 12px !important;
    padding-bottom: 12px !important
}

.padding-16 {
    padding-top: 16px !important;
    padding-bottom: 16px !important
}

.padding-24 {
    padding-top: 24px !important;
    padding-bottom: 24px !important
}

.padding-32 {
    padding-top: 32px !important;
    padding-bottom: 32px !important
}

.padding-48 {
    padding-top: 48px !important;
    padding-bottom: 48px !important
}

.padding-64 {
    padding-top: 64px !important;
    padding-bottom: 64px !important
}

.padding-128 {
    padding-top: 128px !important;
    padding-bottom: 128px !important
}

.padding-0 {
    padding: 0 !important
}

.padding-top {
    padding-top: 8px !important
}

.padding-bottom {
    padding-bottom: 8px !important
}

.padding-left {
    padding-left: 16px !important
}

.padding-right {
    padding-right: 16px !important
}

.topbar {
    border-top: 6px solid #ccc !important
}

.bottombar {
    border-bottom: 6px solid #ccc !important
}

.leftbar {
    border-left: 6px solid #ccc !important
}

.rightbar {
    border-right: 6px solid #ccc !important
}

.row-padding, .row-padding > .half, .row-padding > .third,
.row-padding > .twothird, .row-padding > .threequarter,
.row-padding > .quarter, .row-padding > .col {
    padding: 0 8px
}

.spin {
    animation: spin 2s infinite linear;
    -webkit-animation: spin 2s infinite linear
}

@-webkit-keyframes spin {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg)
    }

    100% {
        -webkit-transform: rotate(359deg);
        transform: rotate(359deg)
    }
}

@keyframes spin {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg)
    }

    100% {
        -webkit-transform: rotate(359deg);
        transform: rotate(359deg)
    }
}

.container {
    padding: 0.01em 16px
}

.panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}
.panel-body {
    padding: 15px;
}
.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.panel-default {
    border-color: #ddd;
}
.panel-default > .panel-heading {
    color: #333;
    background-color: #f5f5f5;
    border-color: #ddd;
}
.panel-default > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #ddd;
}
.panel-default > .panel-heading .badge {
    color: #f5f5f5;
    background-color: #333;
}
.panel-default > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #ddd;
}
.panel-primary {
    border-color: #337ab7;
}
.panel-primary > .panel-heading {
    color: #fff;
    background-color: #00aeef;
    border-color: #337ab7;
}
.panel-primary > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #337ab7;
}
.panel-primary > .panel-heading .badge {
    color: #337ab7;
    background-color: #fff;
}
.panel-primary > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #337ab7;
}
.panel-success {
    border-color: #d6e9c6;
}
.panel-success > .panel-heading {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
}
.panel-success > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #d6e9c6;
}
.panel-success > .panel-heading .badge {
    color: #dff0d8;
    background-color: #3c763d;
}
.panel-success > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #d6e9c6;
}
.panel-info {
    border-color: #bce8f1;
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-info > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #bce8f1;
}
.panel-info > .panel-heading .badge {
    color: #d9edf7;
    background-color: #31708f;
}
.panel-info > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #bce8f1;
}
.panel-warning {
    border-color: #faebcc;
}
.panel-warning > .panel-heading {
    color: #8a6d3b;
    background-color: #fcf8e3;
    border-color: #faebcc;
}
.panel-warning > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #faebcc;
}
.panel-warning > .panel-heading .badge {
    color: #fcf8e3;
    background-color: #8a6d3b;
}
.panel-warning > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #faebcc;
}
.panel-danger {
    border-color: #ebccd1;
}
.panel-danger > .panel-heading {
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
}
.panel-danger > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #ebccd1;
}
.panel-danger > .panel-heading .badge {
    color: #f2dede;
    background-color: #a94442;
}
.panel-danger > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #ebccd1;
}
.example {
    background-color: #f1f1f1;
    padding: 0.01em 16px
}

.code, .codespan {
    font-family: Consolas, "courier new";
    font-size: 16px
}

.code {
    line-height: 1.4;
    width: auto;
    background-color: #fff;
    padding: 8px 12px;
    border-left: 4px solid #4CAF50;
    word-wrap: break-word
}

.codespan {
    color: crimson;
    background-color: #f1f1f1;
    padding-left: 4px;
    padding-right: 4px;
    font-size: 110%
}

.example, .code {
    margin: 20px 0
}

.card, .card-2, .example {
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12) !important
}

.card-4, .hover-shadow:hover {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19) !important
}

.card-8 {
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19) !important
}

.card-12 {
    box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19) !important
}

.card-16 {
    box-shadow: 0 16px 24px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21) !important
}

.card-24 {
    box-shadow: 0 24px 24px 0 rgba(0, 0, 0, 0.2), 0 40px 77px 0 rgba(0, 0, 0, 0.22) !important
}

.animate-fading {
    -webkit-animation: fading 10s infinite;
    animation: fading 10s infinite
}

@-webkit-keyframes fading {
    0% {
        opacity: 0
    }

    50% {
        opacity: 1
    }

    100% {
        opacity: 0
    }
}

@keyframes fading {
    0% {
        opacity: 0
    }

    50% {
        opacity: 1
    }

    100% {
        opacity: 0
    }
}

.animate-opacity {
    -webkit-animation: opac 0.8s;
    animation: opac 0.8s
}

@-webkit-keyframes opac {
    from {
        opacity: 0
    }

    to {
        opacity: 1
    }
}

@keyframes opac {
    from {
        opacity: 0
    }

    to {
        opacity: 1
    }
}

.animate-top {
    position: relative;
    -webkit-animation: animatetop 0.4s;
    animation: animatetop 0.4s
}

@-webkit-keyframes animatetop {
    from {
        top: -300px;
        opacity: 0
    }

    to {
        top: 0;
        opacity: 1
    }
}

@keyframes animatetop {
    from {
        top: -300px;
        opacity: 0
    }

    to {
        top: 0;
        opacity: 1
    }
}

.animate-left {
    position: relative;
    -webkit-animation: animateleft 0.4s;
    animation: animateleft 0.4s
}

@-webkit-keyframes animateleft {
    from {
        left: -300px;
        opacity: 0
    }

    to {
        left: 0;
        opacity: 1
    }
}

@keyframes animateleft {
    from {
        left: -300px;
        opacity: 0
    }

    to {
        left: 0;
        opacity: 1
    }
}

.animate-right {
    position: relative;
    -webkit-animation: animateright 0.4s;
    animation: animateright 0.4s
}

@-webkit-keyframes animateright {
    from {
        right: -300px;
        opacity: 0
    }

    to {
        right: 0;
        opacity: 1
    }
}

@keyframes animateright {
    from {
        right: -300px;
        opacity: 0
    }

    to {
        right: 0;
        opacity: 1
    }
}

.animate-bottom {
    position: relative;
    -webkit-animation: animatebottom 0.4s;
    animation: animatebottom 0.4s
}

@-webkit-keyframes animatebottom {
    from {
        bottom: -300px;
        opacity: 0
    }

    to {
        bottom: 0px;
        opacity: 1
    }
}

@keyframes animatebottom {
    from {
        bottom: -300px;
        opacity: 0
    }

    to {
        bottom: 0;
        opacity: 1
    }
}

.animate-zoom {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {
        -webkit-transform: scale(0)
    }

    to {
        -webkit-transform: scale(1)
    }
}

@keyframes animatezoom {
    from {
        transform: scale(0)
    }

    to {
        transform: scale(1)
    }
}

.animate-input {
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out
}

.animate-input:focus {
    width: 100% !important
}

.opacity, .hover-opacity:hover {
    opacity: 0.60;
    -webkit-backface-visibility: hidden
}

.opacity-off, .hover-opacity-off:hover {
    opacity: 1;
    -webkit-backface-visibility: hidden
}

.opacity-max {
    opacity: 0.25;
    -webkit-backface-visibility: hidden
}

.opacity-min {
    opacity: 0.75;
    -webkit-backface-visibility: hidden
}

.greyscale-max, .grayscale-max, .hover-greyscale:hover,
.hover-grayscale:hover {
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%)
}

.greyscale, .grayscale {
    -webkit-filter: grayscale(75%);
    filter: grayscale(75%)
}

.greyscale-min, .grayscale-min {
    -webkit-filter: grayscale(50%);
    filter: grayscale(50%)
}

.sepia {
    -webkit-filter: sepia(75%);
    filter: sepia(75%)
}

.sepia-max, .hover-sepia:hover {
    -webkit-filter: sepia(100%);
    filter: sepia(100%)
}

.sepia-min {
    -webkit-filter: sepia(50%);
    filter: sepia(50%)
}

.text-shadow {
    text-shadow: 1px 1px 0 #444
}

.text-shadow-white {
    text-shadow: 1px 1px 0 #ddd
}

.transparent {
    background-color: transparent !important
}

.hover-none:hover {
    box-shadow: none !important;
    background-color: transparent !important
}

Colors 
.amber, .hover-amber:hover {
    color: #000 !important;
    background-color: #ffc107 !important
}

.aqua, .hover-aqua:hover {
    color: #000 !important;
    background-color: #00ffff !important
}

.blue, .hover-blue:hover {
    color: #fff !important;
    background-color: #2196F3 !important
}

.light-blue, .hover-light-blue:hover {
    color: #000 !important;
    background-color: #87CEEB !important
}

.brown, .hover-brown:hover {
    color: #fff !important;
    background-color: #795548 !important
}

.cyan, .hover-cyan:hover {
    color: #000 !important;
    background-color: #00bcd4 !important
}

.blue-grey, .hover-blue-grey:hover, .blue-gray, .hover-blue-gray:hover {
    color: #fff !important;
    background-color: #607d8b !important
}

.green, .hover-green:hover {
    color: #fff !important;
    background-color: #4CAF50 !important
}

.light-green, .hover-light-green:hover {
    color: #000 !important;
    background-color: #8bc34a !important
}

.indigo, .hover-indigo:hover {
    color: #fff !important;
    background-color: #3f51b5 !important
}

.khaki, .hover-khaki:hover {
    color: #000 !important;
    background-color: #f0e68c !important
}

.lime, .hover-lime:hover {
    color: #000 !important;
    background-color: #cddc39 !important
}

.orange, .hover-orange:hover {
    color: #000 !important;
    background-color: #ff9800 !important
}

.deep-orange, .hover-deep-orange:hover {
    color: #fff !important;
    background-color: #ff5722 !important
}

.pink, .hover-pink:hover {
    color: #fff !important;
    background-color: #e91e63 !important
}

.purple, .hover-purple:hover {
    color: #fff !important;
    background-color: #9c27b0 !important
}

.deep-purple, .hover-deep-purple:hover {
    color: #fff !important;
    background-color: #673ab7 !important
}

.red, .hover-red:hover {
    color: #fff !important;
    background-color: #f44336 !important
}

.sand, .hover-sand:hover {
    color: #000 !important;
    background-color: #fdf5e6 !important
}

.teal, .hover-teal:hover {
    color: #fff !important;
    background-color: #009688 !important
}

.yellow, .hover-yellow:hover {
    color: #000 !important;
    background-color: #ffeb3b !important
}

.white, .hover-white:hover {
    color: #000 !important;
    background-color: #fff !important
}

.black, .hover-black:hover {
    color: #fff !important;
    background-color: #000 !important
}

.grey, .hover-grey:hover, .gray, .hover-gray:hover {
    color: #000 !important;
    background-color: #9e9e9e !important
}

.light-grey, .hover-light-grey:hover, .light-gray, .hover-light-gray:hover {
    color: #000 !important;
    background-color: #f1f1f1 !important
}

.dark-grey, .hover-dark-grey:hover, .dark-gray, .hover-dark-gray:hover {
    color: #fff !important;
    background-color: #616161 !important
}

.pale-red, .hover-pale-red:hover {
    color: #000 !important;
    background-color: #ffdddd !important
}

.pale-green, .hover-pale-green:hover {
    color: #000 !important;
    background-color: #ddffdd !important
}

.pale-yellow, .hover-pale-yellow:hover {
    color: #000 !important;
    background-color: #ffffcc !important
}

.pale-blue, .hover-pale-blue:hover {
    color: #000 !important;
    background-color: #ddffff !important
}

.text-amber, .hover-text-amber:hover {
    color: #ffc107 !important
}

.text-aqua, .hover-text-aqua:hover {
    color: #00ffff !important
}

.text-blue, .hover-text-blue:hover {
    color: #2196F3 !important
}

.text-light-blue, .hover-text-light-blue:hover {
    color: #87CEEB !important
}

.text-brown, .hover-text-brown:hover {
    color: #795548 !important
}

.text-cyan, .hover-text-cyan:hover {
    color: #00bcd4 !important
}

.text-blue-grey, .hover-text-blue-grey:hover, .text-blue-gray,
.hover-text-blue-gray:hover {
    color: #607d8b !important
}

.text-green, .hover-text-green:hover {
    color: #4CAF50 !important
}

.text-light-green, .hover-text-light-green:hover {
    color: #8bc34a !important
}

.text-indigo, .hover-text-indigo:hover {
    color: #3f51b5 !important
}

.text-khaki, .hover-text-khaki:hover {
    color: #b4aa50 !important
}

.text-lime, .hover-text-lime:hover {
    color: #cddc39 !important
}

.text-orange, .hover-text-orange:hover {
    color: #ff9800 !important
}

.text-deep-orange, .hover-text-deep-orange:hover {
    color: #ff5722 !important
}

.text-pink, .hover-text-pink:hover {
    color: #e91e63 !important
}

.text-purple, .hover-text-purple:hover {
    color: #9c27b0 !important
}

.text-deep-purple, .hover-text-deep-purple:hover {
    color: #673ab7 !important
}

.text-red, .hover-text-red:hover {
    color: #f44336 !important
}

.text-sand, .hover-text-sand:hover {
    color: #fdf5e6 !important
}

.text-teal, .hover-text-teal:hover {
    color: #009688 !important
}

.text-yellow, .hover-text-yellow:hover {
    color: #d2be0e !important
}

.text-white, .hover-text-white:hover {
    color: #fff !important
}

.text-black, .hover-text-black:hover {
    color: #000 !important
}

.text-grey, .hover-text-grey:hover, .text-gray, .hover-text-gray:hover {
    color: #757575 !important
}

.text-light-grey, .hover-text-light-grey:hover, .text-light-gray,
.hover-text-light-gray:hover {
    color: #f1f1f1 !important
}

.text-dark-grey, .hover-text-dark-grey:hover, .text-dark-gray,
.hover-text-dark-gray:hover {
    color: #3a3a3a !important
}

.border-amber, .hover-border-amber:hover {
    border-color: #ffc107 !important
}

.border-aqua, .hover-border-aqua:hover {
    border-color: #00ffff !important
}

.border-blue, .hover-border-blue:hover {
    border-color: #2196F3 !important
}

.border-light-blue, .hover-border-light-blue:hover {
    border-color: #87CEEB !important
}

.border-brown, .hover-border-brown:hover {
    border-color: #795548 !important
}

.border-cyan, .hover-border-cyan:hover {
    border-color: #00bcd4 !important
}

.border-blue-grey, .hover-border-blue-grey:hover, .border-blue-gray,
.hover-border-blue-gray:hover {
    border-color: #607d8b !important
}

.border-green, .hover-border-green:hover {
    border-color: #4CAF50 !important
}

.border-light-green, .hover-border-light-green:hover {
    border-color: #8bc34a !important
}

.border-indigo, .hover-border-indigo:hover {
    border-color: #3f51b5 !important
}

.border-khaki, .hover-border-khaki:hover {
    border-color: #f0e68c !important
}

.border-lime, .hover-border-lime:hover {
    border-color: #cddc39 !important
}

.border-orange, .hover-border-orange:hover {
    border-color: #ff9800 !important
}

.border-deep-orange, .hover-border-deep-orange:hover {
    border-color: #ff5722 !important
}

.border-pink, .hover-border-pink:hover {
    border-color: #e91e63 !important
}

.border-purple, .hover-border-purple:hover {
    border-color: #9c27b0 !important
}

.border-deep-purple, .hover-border-deep-purple:hover {
    border-color: #673ab7 !important
}

.border-red, .hover-border-red:hover {
    border-color: #f44336 !important
}

.border-sand, .hover-border-sand:hover {
    border-color: #fdf5e6 !important
}

.border-teal, .hover-border-teal:hover {
    border-color: #009688 !important
}

.border-yellow, .hover-border-yellow:hover {
    border-color: #ffeb3b !important
}

.border-white, .hover-border-white:hover {
    border-color: #fff !important
}

.border-black, .hover-border-black:hover {
    border-color: #000 !important
}

.border-grey, .hover-border-grey:hover, .border-gray,
.hover-border-gray:hover {
    border-color: #9e9e9e !important
}

.border-light-grey, .hover-border-light-grey:hover, .border-light-gray,
.hover-border-light-gray:hover {
    border-color: #f1f1f1 !important
}

.border-dark-grey, .hover-border-dark-grey:hover, .border-dark-gray,
.hover-border-dark-gray:hover {
    border-color: #616161 !important
}

.border-pale-red, .hover-border-pale-red:hover {
    border-color: #ffe7e7 !important
}

.border-pale-green, .hover-border-pale-green:hover {
    border-color: #e7ffe7 !important
}

.border-pale-yellow, .hover-border-pale-yellow:hover {
    border-color: #ffffcc !important
}

.border-pale-blue, .hover-border-pale-blue:hover {
    border-color: #e7ffff !important
}

#grad1 {
    height: 250px;
    width:100%;
    background-color: #1fc8db; /* For browsers that do not support gradients */        
    background-image: linear-gradient(141deg, #9fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
    color:white;
    opacity:0.95;
}
.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}
.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
    float: left;
}
.col-xs-12 {
    width: 100%;
}
.col-xs-11 {
    width: 91.66666667%;
}
.col-xs-10 {
    width: 83.33333333%;
}
.col-xs-9 {
    width: 75%;
}
.col-xs-8 {
    width: 66.66666667%;
}
.col-xs-7 {
    width: 58.33333333%;
}
.col-xs-6 {
    width: 50%;
}
.col-xs-5 {
    width: 41.66666667%;
}
.col-xs-4 {
    width: 33.33333333%;
}
.col-xs-3 {
    width: 25%;
}
.col-xs-2 {
    width: 16.66666667%;
}
.col-xs-1 {
    width: 8.33333333%;
}
.col-xs-pull-12 {
    right: 100%;
}
.col-xs-pull-11 {
    right: 91.66666667%;
}
.col-xs-pull-10 {
    right: 83.33333333%;
}
.col-xs-pull-9 {
    right: 75%;
}
.col-xs-pull-8 {
    right: 66.66666667%;
}
.col-xs-pull-7 {
    right: 58.33333333%;
}
.col-xs-pull-6 {
    right: 50%;
}
.col-xs-pull-5 {
    right: 41.66666667%;
}
.col-xs-pull-4 {
    right: 33.33333333%;
}
.col-xs-pull-3 {
    right: 25%;
}
.col-xs-pull-2 {
    right: 16.66666667%;
}
.col-xs-pull-1 {
    right: 8.33333333%;
}
.col-xs-pull-0 {
    right: auto;
}
.col-xs-push-12 {
    left: 100%;
}
.col-xs-push-11 {
    left: 91.66666667%;
}
.col-xs-push-10 {
    left: 83.33333333%;
}
.col-xs-push-9 {
    left: 75%;
}
.col-xs-push-8 {
    left: 66.66666667%;
}
.col-xs-push-7 {
    left: 58.33333333%;
}
.col-xs-push-6 {
    left: 50%;
}
.col-xs-push-5 {
    left: 41.66666667%;
}
.col-xs-push-4 {
    left: 33.33333333%;
}
.col-xs-push-3 {
    left: 25%;
}
.col-xs-push-2 {
    left: 16.66666667%;
}
.col-xs-push-1 {
    left: 8.33333333%;
}
.col-xs-push-0 {
    left: auto;
}
.col-xs-offset-12 {
    margin-left: 100%;
}
.col-xs-offset-11 {
    margin-left: 91.66666667%;
}
.col-xs-offset-10 {
    margin-left: 83.33333333%;
}
.col-xs-offset-9 {
    margin-left: 75%;
}
.col-xs-offset-8 {
    margin-left: 66.66666667%;
}
.col-xs-offset-7 {
    margin-left: 58.33333333%;
}
.col-xs-offset-6 {
    margin-left: 50%;
}
.col-xs-offset-5 {
    margin-left: 41.66666667%;
}
.col-xs-offset-4 {
    margin-left: 33.33333333%;
}
.col-xs-offset-3 {
    margin-left: 25%;
}
.col-xs-offset-2 {
    margin-left: 16.66666667%;
}
.col-xs-offset-1 {
    margin-left: 8.33333333%;
}
.col-xs-offset-0 {
    margin-left: 0;
}
@media (min-width: 768px) {
    .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
        float: left;
    }
    .col-sm-12 {
        width: 100%;
    }
    .col-sm-11 {
        width: 91.66666667%;
    }
    .col-sm-10 {
        width: 83.33333333%;
    }
    .col-sm-9 {
        width: 75%;
    }
    .col-sm-8 {
        width: 66.66666667%;
    }
    .col-sm-7 {
        width: 58.33333333%;
    }
    .col-sm-6 {
        width: 50%;
    }
    .col-sm-5 {
        width: 41.66666667%;
    }
    .col-sm-4 {
        width: 33.33333333%;
    }
    .col-sm-3 {
        width: 25%;
    }
    .col-sm-2 {
        width: 16.66666667%;
    }
    .col-sm-1 {
        width: 8.33333333%;
    }
    .col-sm-pull-12 {
        right: 100%;
    }
    .col-sm-pull-11 {
        right: 91.66666667%;
    }
    .col-sm-pull-10 {
        right: 83.33333333%;
    }
    .col-sm-pull-9 {
        right: 75%;
    }
    .col-sm-pull-8 {
        right: 66.66666667%;
    }
    .col-sm-pull-7 {
        right: 58.33333333%;
    }
    .col-sm-pull-6 {
        right: 50%;
    }
    .col-sm-pull-5 {
        right: 41.66666667%;
    }
    .col-sm-pull-4 {
        right: 33.33333333%;
    }
    .col-sm-pull-3 {
        right: 25%;
    }
    .col-sm-pull-2 {
        right: 16.66666667%;
    }
    .col-sm-pull-1 {
        right: 8.33333333%;
    }
    .col-sm-pull-0 {
        right: auto;
    }
    .col-sm-push-12 {
        left: 100%;
    }
    .col-sm-push-11 {
        left: 91.66666667%;
    }
    .col-sm-push-10 {
        left: 83.33333333%;
    }
    .col-sm-push-9 {
        left: 75%;
    }
    .col-sm-push-8 {
        left: 66.66666667%;
    }
    .col-sm-push-7 {
        left: 58.33333333%;
    }
    .col-sm-push-6 {
        left: 50%;
    }
    .col-sm-push-5 {
        left: 41.66666667%;
    }
    .col-sm-push-4 {
        left: 33.33333333%;
    }
    .col-sm-push-3 {
        left: 25%;
    }
    .col-sm-push-2 {
        left: 16.66666667%;
    }
    .col-sm-push-1 {
        left: 8.33333333%;
    }
    .col-sm-push-0 {
        left: auto;
    }
    .col-sm-offset-12 {
        margin-left: 100%;
    }
    .col-sm-offset-11 {
        margin-left: 91.66666667%;
    }
    .col-sm-offset-10 {
        margin-left: 83.33333333%;
    }
    .col-sm-offset-9 {
        margin-left: 75%;
    }
    .col-sm-offset-8 {
        margin-left: 66.66666667%;
    }
    .col-sm-offset-7 {
        margin-left: 58.33333333%;
    }
    .col-sm-offset-6 {
        margin-left: 50%;
    }
    .col-sm-offset-5 {
        margin-left: 41.66666667%;
    }
    .col-sm-offset-4 {
        margin-left: 33.33333333%;
    }
    .col-sm-offset-3 {
        margin-left: 25%;
    }
    .col-sm-offset-2 {
        margin-left: 16.66666667%;
    }
    .col-sm-offset-1 {
        margin-left: 8.33333333%;
    }
    .col-sm-offset-0 {
        margin-left: 0;
    }
}
@media (min-width: 992px) {
    .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
        float: left;
    }
    .col-md-12 {
        width: 100%;
    }
    .col-md-11 {
        width: 91.66666667%;
    }
    .col-md-10 {
        width: 83.33333333%;
    }
    .col-md-9 {
        width: 75%;
    }
    .col-md-8 {
        width: 66.66666667%;
    }
    .col-md-7 {
        width: 58.33333333%;
    }
    .col-md-6 {
        width: 50%;
    }
    .col-md-5 {
        width: 41.66666667%;
    }
    .col-md-4 {
        width: 33.33333333%;
    }
    .col-md-3 {
        width: 25%;
    }
    .col-md-2 {
        width: 16.66666667%;
    }
    .col-md-1 {
        width: 8.33333333%;
    }
    .col-md-pull-12 {
        right: 100%;
    }
    .col-md-pull-11 {
        right: 91.66666667%;
    }
    .col-md-pull-10 {
        right: 83.33333333%;
    }
    .col-md-pull-9 {
        right: 75%;
    }
    .col-md-pull-8 {
        right: 66.66666667%;
    }
    .col-md-pull-7 {
        right: 58.33333333%;
    }
    .col-md-pull-6 {
        right: 50%;
    }
    .col-md-pull-5 {
        right: 41.66666667%;
    }
    .col-md-pull-4 {
        right: 33.33333333%;
    }
    .col-md-pull-3 {
        right: 25%;
    }
    .col-md-pull-2 {
        right: 16.66666667%;
    }
    .col-md-pull-1 {
        right: 8.33333333%;
    }
    .col-md-pull-0 {
        right: auto;
    }
    .col-md-push-12 {
        left: 100%;
    }
    .col-md-push-11 {
        left: 91.66666667%;
    }
    .col-md-push-10 {
        left: 83.33333333%;
    }
    .col-md-push-9 {
        left: 75%;
    }
    .col-md-push-8 {
        left: 66.66666667%;
    }
    .col-md-push-7 {
        left: 58.33333333%;
    }
    .col-md-push-6 {
        left: 50%;
    }
    .col-md-push-5 {
        left: 41.66666667%;
    }
    .col-md-push-4 {
        left: 33.33333333%;
    }
    .col-md-push-3 {
        left: 25%;
    }
    .col-md-push-2 {
        left: 16.66666667%;
    }
    .col-md-push-1 {
        left: 8.33333333%;
    }
    .col-md-push-0 {
        left: auto;
    }
    .col-md-offset-12 {
        margin-left: 100%;
    }
    .col-md-offset-11 {
        margin-left: 91.66666667%;
    }
    .col-md-offset-10 {
        margin-left: 83.33333333%;
    }
    .col-md-offset-9 {
        margin-left: 75%;
    }
    .col-md-offset-8 {
        margin-left: 66.66666667%;
    }
    .col-md-offset-7 {
        margin-left: 58.33333333%;
    }
    .col-md-offset-6 {
        margin-left: 50%;
    }
    .col-md-offset-5 {
        margin-left: 41.66666667%;
    }
    .col-md-offset-4 {
        margin-left: 33.33333333%;
    }
    .col-md-offset-3 {
        margin-left: 25%;
    }
    .col-md-offset-2 {
        margin-left: 16.66666667%;
    }
    .col-md-offset-1 {
        margin-left: 8.33333333%;
    }
    .col-md-offset-0 {
        margin-left: 0;
    }
}
@media (min-width: 1200px) {
    .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
        float: left;
    }
    .col-lg-12 {
        width: 100%;
    }
    .col-lg-11 {
        width: 91.66666667%;
    }
    .col-lg-10 {
        width: 83.33333333%;
    }
    .col-lg-9 {
        width: 75%;
    }
    .col-lg-8 {
        width: 66.66666667%;
    }
    .col-lg-7 {
        width: 58.33333333%;
    }
    .col-lg-6 {
        width: 50%;
    }
    .col-lg-5 {
        width: 41.66666667%;
    }
    .col-lg-4 {
        width: 33.33333333%;
    }
    .col-lg-3 {
        width: 25%;
    }
    .col-lg-2 {
        width: 16.66666667%;
    }
    .col-lg-1 {
        width: 8.33333333%;
    }
    .col-lg-pull-12 {
        right: 100%;
    }
    .col-lg-pull-11 {
        right: 91.66666667%;
    }
    .col-lg-pull-10 {
        right: 83.33333333%;
    }
    .col-lg-pull-9 {
        right: 75%;
    }
    .col-lg-pull-8 {
        right: 66.66666667%;
    }
    .col-lg-pull-7 {
        right: 58.33333333%;
    }
    .col-lg-pull-6 {
        right: 50%;
    }
    .col-lg-pull-5 {
        right: 41.66666667%;
    }
    .col-lg-pull-4 {
        right: 33.33333333%;
    }
    .col-lg-pull-3 {
        right: 25%;
    }
    .col-lg-pull-2 {
        right: 16.66666667%;
    }
    .col-lg-pull-1 {
        right: 8.33333333%;
    }
    .col-lg-pull-0 {
        right: auto;
    }
    .col-lg-push-12 {
        left: 100%;
    }
    .col-lg-push-11 {
        left: 91.66666667%;
    }
    .col-lg-push-10 {
        left: 83.33333333%;
    }
    .col-lg-push-9 {
        left: 75%;
    }
    .col-lg-push-8 {
        left: 66.66666667%;
    }
    .col-lg-push-7 {
        left: 58.33333333%;
    }
    .col-lg-push-6 {
        left: 50%;
    }
    .col-lg-push-5 {
        left: 41.66666667%;
    }
    .col-lg-push-4 {
        left: 33.33333333%;
    }
    .col-lg-push-3 {
        left: 25%;
    }
    .col-lg-push-2 {
        left: 16.66666667%;
    }
    .col-lg-push-1 {
        left: 8.33333333%;
    }
    .col-lg-push-0 {
        left: auto;
    }
    .col-lg-offset-12 {
        margin-left: 100%;
    }
    .col-lg-offset-11 {
        margin-left: 91.66666667%;
    }
    .col-lg-offset-10 {
        margin-left: 83.33333333%;
    }
    .col-lg-offset-9 {
        margin-left: 75%;
    }
    .col-lg-offset-8 {
        margin-left: 66.66666667%;
    }
    .col-lg-offset-7 {
        margin-left: 58.33333333%;
    }
    .col-lg-offset-6 {
        margin-left: 50%;
    }
    .col-lg-offset-5 {
        margin-left: 41.66666667%;
    }
    .col-lg-offset-4 {
        margin-left: 33.33333333%;
    }
    .col-lg-offset-3 {
        margin-left: 25%;
    }
    .col-lg-offset-2 {
        margin-left: 16.66666667%;
    }
    .col-lg-offset-1 {
        margin-left: 8.33333333%;
    }
    .col-lg-offset-0 {
        margin-left: 0;
    }
}
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}
#containerBox{
    padding: 15px; 
    margin: 15px; 
    background: #fff; 
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);
    border-top:3px solid #d2d6de;
}
.form-group{
    margin-bottom: 15px;
}
label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    /*font-weight: 700;*/
    padding: 0.2em 0.6em 0.3em;
    line-height: 1;
    white-space: nowrap;
    vertical-align: baseline;
}
.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
}
input[type="checkbox"],
input[type="radio"] {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0;
}
input[type="checkbox"] {
    margin: 4px 0 0;
    margin-top: 1px \9;
    line-height: normal;
}
.text-center {
    text-align: center;
}
.collapsible {
    background-color: #777;
    color: white;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
}

.active, .collapsible:hover {
    /*background-color: #555;*/
}

.collapsible-content {
    padding: 0 18px;
    display: none;
    overflow: hidden;
    background-color: #f1f1f1;
}
.box {
    position: relative;
    border-radius: 3px;
    background: #ffffff;
    border-top: 3px solid #d2d6de;
    margin-bottom: 20px;
    width: 100%;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}
.box.box-primary {
    border-top-color: #3c8dbc;
}
.box.box-info {
    border-top-color: #00c0ef;
}
.box.box-danger {
    border-top-color: #dd4b39;
}
.box.box-warning {
    border-top-color: #f39c12;
}
.box.box-success {
    border-top-color: #00a65a;
}
.box.box-default {
    border-top-color: #d2d6de;
}
.box.collapsed-box .box-body,
.box.collapsed-box .box-footer {
    display: none;
}
.box .nav-stacked > li {
    border-bottom: 1px solid #f4f4f4;
    margin: 0;
}
.box .nav-stacked > li:last-of-type {
    border-bottom: none;
}
.box.height-control .box-body {
    max-height: 300px;
    overflow: auto;
}
.box .border-right {
    border-right: 1px solid #f4f4f4;
}
.box .border-left {
    border-left: 1px solid #f4f4f4;
}
.box.box-solid {
    border-top: 0;
}
.box.box-solid > .box-header .btn.btn-default {
    background: transparent;
}
.box.box-solid > .box-header .btn:hover,
.box.box-solid > .box-header a:hover {
    background: rgba(0, 0, 0, 0.1);
}
.box.box-solid.box-default {
    border: 1px solid #d2d6de;
}
.box.box-solid.box-default > .box-header {
    color: #444444;
    background: #d2d6de;
    background-color: #d2d6de;
}
.box.box-solid.box-default > .box-header a,
.box.box-solid.box-default > .box-header .btn {
    color: #444444;
}
.box.box-solid.box-primary {
    border: 1px solid #3c8dbc;
}
.box.box-solid.box-primary > .box-header {
    color: #ffffff;
    background: #3c8dbc;
    background-color: #3c8dbc;
}
.box.box-solid.box-primary > .box-header a,
.box.box-solid.box-primary > .box-header .btn {
    color: #ffffff;
}
.box.box-solid.box-info {
    border: 1px solid #00c0ef;
}
.box.box-solid.box-info > .box-header {
    color: #ffffff;
    background: #00c0ef;
    background-color: #00c0ef;
}
.box.box-solid.box-info > .box-header a,
.box.box-solid.box-info > .box-header .btn {
    color: #ffffff;
}
.box.box-solid.box-danger {
    border: 1px solid #dd4b39;
}
.box.box-solid.box-danger > .box-header {
    color: #ffffff;
    background: #dd4b39;
    background-color: #dd4b39;
}
.box.box-solid.box-danger > .box-header a,
.box.box-solid.box-danger > .box-header .btn {
    color: #ffffff;
}
.box.box-solid.box-warning {
    border: 1px solid #f39c12;
}
.box.box-solid.box-warning > .box-header {
    color: #ffffff;
    background: #f39c12;
    background-color: #f39c12;
}
.box.box-solid.box-warning > .box-header a,
.box.box-solid.box-warning > .box-header .btn {
    color: #ffffff;
}
.box.box-solid.box-success {
    border: 1px solid #00a65a;
}
.box.box-solid.box-success > .box-header {
    color: #ffffff;
    background: #00a65a;
    background-color: #00a65a;
}
.box.box-solid.box-success > .box-header a,
.box.box-solid.box-success > .box-header .btn {
    color: #ffffff;
}
.box.box-solid > .box-header > .box-tools .btn {
    border: 0;
    box-shadow: none;
}
.box.box-solid[class*='bg'] > .box-header {
    color: #fff;
}
.box .box-group > .box {
    margin-bottom: 5px;
}
.box .knob-label {
    text-align: center;
    color: #333;
    font-weight: 100;
    font-size: 12px;
    margin-bottom: 0.3em;
}
.box > .overlay,
.overlay-wrapper > .overlay,
.box > .loading-img,
.overlay-wrapper > .loading-img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
.box .overlay,
.overlay-wrapper .overlay {
    z-index: 50;
    background: rgba(255, 255, 255, 0.7);
    border-radius: 3px;
}
.box .overlay > .fa,
.overlay-wrapper .overlay > .fa {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -15px;
    margin-top: -15px;
    color: #000;
    font-size: 30px;
}
.box .overlay.dark,
.overlay-wrapper .overlay.dark {
    background: rgba(0, 0, 0, 0.5);
}
.box-header:before,
.box-body:before,
.box-footer:before,
.box-header:after,
.box-body:after,
.box-footer:after {
    content: " ";
    display: table;
}
.box-header:after,
.box-body:after,
.box-footer:after {
    clear: both;
}
.box-header {
    color: #444;
    display: block;
    padding: 10px;
    position: relative;
}
.box-header.with-border {
    border-bottom: 1px solid #f4f4f4;
}
.collapsed-box .box-header.with-border {
    border-bottom: none;
}
.box-header > .fa,
.box-header > .glyphicon,
.box-header > .ion,
.box-header .box-title {
    display: inline-block;
    font-size: 18px;
    margin: 0;
    line-height: 1;
}
.box-header > .fa,
.box-header > .glyphicon,
.box-header > .ion {
    margin-right: 5px;
}
.box-header > .box-tools {
    position: absolute;
    right: 10px;
    top: 5px;
}
.box-header > .box-tools [data-toggle="tooltip"] {
    position: relative;
}
.box-header > .box-tools.pull-right .dropdown-menu {
    right: 0;
    left: auto;
}
.btn-box-tool {
    padding: 5px;
    font-size: 12px;
    background: transparent;
    color: #97a0b3;
}
.open .btn-box-tool,
.btn-box-tool:hover {
    color: #606c84;
}
.btn-box-tool.btn:active {
    box-shadow: none;
}
.box-body {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
    padding: 10px;
}
.no-header .box-body {
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
}
.box-body > .table {
    margin-bottom: 0;
}
.box-body .fc {
    margin-top: 5px;
}
.box-body .full-width-chart {
    margin: -19px;
}
.box-body.no-padding .full-width-chart {
    margin: -9px;
}
.box-body .box-pane {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 3px;
}
.box-body .box-pane-right {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 0;
}
.box-footer {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
    border-top: 1px solid #f4f4f4;
    padding: 10px;
    background-color: #ffffff;
}
.container {
    padding: 0.01em 16px
}

.panel {
    margin: 15px;
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}
.panel-body {
    padding: 15px;
}
.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.panel-default {
    border-color: #ddd;
}
.panel-default > .panel-heading {
    color: #333;
    background-color: #f5f5f5;
    border-color: #ddd;
}
.panel-default > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #ddd;
}
.panel-default > .panel-heading .badge {
    color: #f5f5f5;
    background-color: #333;
}
.panel-default > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #ddd;
}
.panel-primary {
    border-color: #337ab7;
}
.panel-primary > .panel-heading {
    color: #fff;
    background-color: #00aeef;
    border-color: #337ab7;
}
.panel-primary > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #337ab7;
}
.panel-primary > .panel-heading .badge {
    color: #337ab7;
    background-color: #fff;
}
.panel-primary > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #337ab7;
}
.panel-success {
    border-color: #d6e9c6;
}
.panel-success > .panel-heading {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
}
.panel-success > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #d6e9c6;
}
.panel-success > .panel-heading .badge {
    color: #dff0d8;
    background-color: #3c763d;
}
.panel-success > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #d6e9c6;
}
.panel-info {
    border-color: #bce8f1;
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-info > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #bce8f1;
}
.panel-info > .panel-heading .badge {
    color: #d9edf7;
    background-color: #31708f;
}
.panel-info > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #bce8f1;
}
.panel-warning {
    border-color: #faebcc;
}
.panel-warning > .panel-heading {
    color: #8a6d3b;
    background-color: #fcf8e3;
    border-color: #faebcc;
}
.panel-warning > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #faebcc;
}
.panel-warning > .panel-heading .badge {
    color: #fcf8e3;
    background-color: #8a6d3b;
}
.panel-warning > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #faebcc;
}
.panel-danger {
    border-color: #ebccd1;
}
.panel-danger > .panel-heading {
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
}
.panel-danger > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #ebccd1;
}
.panel-danger > .panel-heading .badge {
    color: #f2dede;
    background-color: #a94442;
}
.panel-danger > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #ebccd1;
}
.img-responsive{
    display: block;
    max-width: 100%;
    height:auto;
}
.img-rounded {
    border-radius:6px
}

.img-thumbnail {
    display: inline-block;
    max-width: 100%;
    height: auto;
    padding: 4px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition:all .2s ease-in-out
}

.img-circle {
    border-radius:50%
}
.carousel {
    position:relative
}

.carousel-inner {
    position: relative;
    width: 100%;
    overflow:hidden
}

.carousel-inner > .item {
    position: relative;
    display: none;
    -webkit-transition: .6s ease-in-out left;
    -o-transition: .6s ease-in-out left;
    transition:.6s ease-in-out left
}

.carousel-inner > .item > a > img, .carousel-inner > .item > img {
    line-height:1
}
@media all and (transform-3d), (-webkit-transform-3d) {
    .carousel-inner > .item {
        -webkit-transition: -webkit-transform .6s ease-in-out;
        -o-transition: -o-transform .6s ease-in-out;
        transition: transform .6s ease-in-out;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        -webkit-perspective: 1000px;
        perspective:1000px
    }

    .carousel-inner > .item.active.right, .carousel-inner > .item.next {
        left: 0;
        -webkit-transform: translate3d(100%, 0, 0);
        transform:translate3d(100%, 0, 0)
    }

    .carousel-inner > .item.active.left, .carousel-inner > .item.prev {
        left: 0;
        -webkit-transform: translate3d(-100%, 0, 0);
        transform:translate3d(-100%, 0, 0)
    }

    .carousel-inner > .item.active, .carousel-inner > .item.next.left, .carousel-inner > .item.prev.right {
        left: 0;
        -webkit-transform: translate3d(0, 0, 0);
        transform:translate3d(0, 0, 0)
    }
}

.carousel-inner > .active, .carousel-inner > .next, .carousel-inner > .prev {
    display:block
}

.carousel-inner > .active {
    left:0
}

.carousel-inner > .next, .carousel-inner > .prev {
    position: absolute;
    top: 0;
    width:100%
}

.carousel-inner > .next {
    left:100%
}

.carousel-inner > .prev {
    left:-100%
}

.carousel-inner > .next.left, .carousel-inner > .prev.right {
    left:0
}

.carousel-inner > .active.left {
    left:-100%
}

.carousel-inner > .active.right {
    left:100%
}

.carousel-control {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    width: 15%;
    font-size: 20px;
    color: #fff;
    text-align: center;
    text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
    filter: alpha(opacity=50);
    opacity:.5
}

.carousel-control.left {
    background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .5) 0, rgba(0, 0, 0, .0001) 100%);
    background-image: -o-linear-gradient(left, rgba(0, 0, 0, .5) 0, rgba(0, 0, 0, .0001) 100%);
    background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .5)), to(rgba(0, 0, 0, .0001)));
    background-image: linear-gradient(to right, rgba(0, 0, 0, .5) 0, rgba(0, 0, 0, .0001) 100%);
    filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
    background-repeat:repeat-x
}

.carousel-control.right {
    right: 0;
    left: auto;
    background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .0001) 0, rgba(0, 0, 0, .5) 100%);
    background-image: -o-linear-gradient(left, rgba(0, 0, 0, .0001) 0, rgba(0, 0, 0, .5) 100%);
    background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .0001)), to(rgba(0, 0, 0, .5)));
    background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0, rgba(0, 0, 0, .5) 100%);
    filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
    background-repeat:repeat-x
}

.carousel-control:focus, .carousel-control:hover {
    color: #fff;
    text-decoration: none;
    filter: alpha(opacity=90);
    outline: 0;
    opacity:.9
}

.carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next, .carousel-control .icon-prev {
    position: absolute;
    top: 50%;
    z-index: 5;
    display: inline-block;
    margin-top:-10px
}

.carousel-control .glyphicon-chevron-left, .carousel-control .icon-prev {
    left: 50%;
    margin-left:-10px
}

.carousel-control .glyphicon-chevron-right, .carousel-control .icon-next {
    right: 50%;
    margin-right:-10px
}

.carousel-control .icon-next, .carousel-control .icon-prev {
    width: 20px;
    height: 20px;
    font-family: serif;
    line-height:1
}

.carousel-control .icon-prev:before {
    content: '\2039'
}

.carousel-control .icon-next:before {
    content: '\203a'
}

.carousel-indicators {
    position: absolute;
    bottom: 10px;
    left: 50%;
    z-index: 15;
    width: 60%;
    padding-left: 0;
    margin-left: -30%;
    text-align: center;
    list-style:none
}

.carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #000\9;
    background-color: rgba(0, 0, 0, 0);
    border: 1px solid #fff;
    border-radius:10px
}

.carousel-indicators .active {
    width: 12px;
    height: 12px;
    margin: 0;
    background-color:#fff
}

.carousel-caption {
    position: absolute;
    right: 15%;
    bottom: 20px;
    left: 15%;
    z-index: 10;
    padding-top: 20px;
    padding-bottom: 20px;
    color: #fff;
    text-align: center;
    text-shadow:0 1px 2px rgba(0, 0, 0, .6)
}

.carousel-caption .btn {
    text-shadow:none
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
@media (min-width: 768px) {
    .container {
        width: 750px;
    }
}
@media (min-width: 992px) {
    .container {
        width: 970px;
    }
}
@media (min-width: 1200px) {
    .container {
        width: 1170px;
    }
}
.bg-red,
.bg-yellow,
.bg-aqua,
.bg-blue,
.bg-light-blue,
.bg-green,
.bg-navy,
.bg-teal,
.bg-olive,
.bg-lime,
.bg-orange,
.bg-fuchsia,
.bg-purple,
.bg-maroon,
.bg-black,
.bg-red-active,
.bg-yellow-active,
.bg-aqua-active,
.bg-blue-active,
.bg-light-blue-active,
.bg-green-active,
.bg-navy-active,
.bg-teal-active,
.bg-olive-active,
.bg-lime-active,
.bg-orange-active,
.bg-fuchsia-active,
.bg-purple-active,
.bg-maroon-active,
.bg-black-active,
.callout.callout-danger,
.callout.callout-warning,
.callout.callout-info,
.callout.callout-success,
.alert-success,
.alert-danger,
.alert-error,
.alert-warning,
.alert-info,
.label-danger,
.label-info,
.label-warning,
.label-primary,
.label-success,
.modal-primary .modal-body,
.modal-primary .modal-header,
.modal-primary .modal-footer,
.modal-warning .modal-body,
.modal-warning .modal-header,
.modal-warning .modal-footer,
.modal-info .modal-body,
.modal-info .modal-header,
.modal-info .modal-footer,
.modal-success .modal-body,
.modal-success .modal-header,
.modal-success .modal-footer,
.modal-danger .modal-body,
.modal-danger .modal-header,
.modal-danger .modal-footer {
    color: #fff !important;
}
.bg-gray {
    color: #000;
    background-color: #d2d6de !important;
}
.bg-gray-light {
    background-color: #f7f7f7;
}
.bg-black {
    background-color: #111111 !important;
}
.bg-red,
.callout.callout-danger,
.alert-danger,
.alert-error,
.label-danger,
.modal-danger .modal-body {
    background-color: #dd4b39 !important;
}
.bg-yellow,
.callout.callout-warning,
.alert-warning,
.label-warning,
.modal-warning .modal-body {
    background-color: #f39c12 !important;
}
.bg-aqua,
.callout.callout-info,
.alert-info,
.label-info,
.modal-info .modal-body {
    background-color: #00c0ef !important;
}
.bg-blue {
    background-color: #0073b7 !important;
}
.bg-light-blue,
.label-primary,
.modal-primary .modal-body {
    background-color: #3c8dbc !important;
}
.bg-green,
.callout.callout-success,
.alert-success,
.label-success,
.modal-success .modal-body {
    background-color: #00a65a !important;
}
.bg-navy {
    background-color: #001f3f !important;
}
.bg-teal {
    background-color: #39cccc !important;
}
.bg-olive {
    background-color: #3d9970 !important;
}
.bg-lime {
    background-color: #01ff70 !important;
}
.bg-orange {
    background-color: #ff851b !important;
}
.bg-fuchsia {
    background-color: #f012be !important;
}
.bg-purple {
    background-color: #605ca8 !important;
}
.bg-maroon {
    background-color: #d81b60 !important;
}
.bg-gray-active {
    color: #000;
    background-color: #b5bbc8 !important;
}
.bg-black-active {
    background-color: #000000 !important;
}
.bg-red-active,
.modal-danger .modal-header,
.modal-danger .modal-footer {
    background-color: #d33724 !important;
}
.bg-yellow-active,
.modal-warning .modal-header,
.modal-warning .modal-footer {
    background-color: #db8b0b !important;
}
.bg-aqua-active,
.modal-info .modal-header,
.modal-info .modal-footer {
    background-color: #00a7d0 !important;
}
.bg-blue-active {
    background-color: #005384 !important;
}
.bg-light-blue-active,
.modal-primary .modal-header,
.modal-primary .modal-footer {
    background-color: #357ca5 !important;
}
.bg-green-active,
.modal-success .modal-header,
.modal-success .modal-footer {
    background-color: #008d4c !important;
}
.bg-navy-active {
    background-color: #001a35 !important;
}
.bg-teal-active {
    background-color: #30bbbb !important;
}
.bg-olive-active {
    background-color: #368763 !important;
}
.bg-lime-active {
    background-color: #00e765 !important;
}
.bg-orange-active {
    background-color: #ff7701 !important;
}
.bg-fuchsia-active {
    background-color: #db0ead !important;
}
.bg-purple-active {
    background-color: #555299 !important;
}
.bg-maroon-active {
    background-color: #ca195a !important;
}
[class^="bg-"].disabled {
    opacity: 0.65;
    filter: alpha(opacity=65);
}
.text-red {
    color: #dd4b39 !important;
}
.text-yellow {
    color: #f39c12 !important;
}
.text-aqua {
    color: #00c0ef !important;
}
.text-blue {
    color: #0073b7 !important;
}
.text-black {
    color: #111111 !important;
}
.text-light-blue {
    color: #3c8dbc !important;
}
.text-green {
    color: #00a65a !important;
}
.text-gray {
    color: #d2d6de !important;
}
.text-navy {
    color: #001f3f !important;
}
.text-teal {
    color: #39cccc !important;
}
.text-olive {
    color: #3d9970 !important;
}
.text-lime {
    color: #01ff70 !important;
}
.text-orange {
    color: #ff851b !important;
}
.text-fuchsia {
    color: #f012be !important;
}
.text-purple {
    color: #605ca8 !important;
}
.text-maroon {
    color: #d81b60 !important;
}
.link-muted {
    color: #7a869d;
}
.link-muted:hover,
.link-muted:focus {
    color: #606c84;
}
.link-black {
    color: #666;
}
.link-black:hover,
.link-black:focus {
    color: #999;
}
.hide {
    display: none !important;
}
.no-border {
    border: 0 !important;
}
.no-padding {
    padding: 0 !important;
}
.no-margin {
    margin: 0 !important;
}
.no-shadow {
    box-shadow: none!important;
}
.content-header {
    position: relative;
    padding: 15px 15px 0 15px;
}
.content-header > h1 {
    margin: 0;
    font-size: 24px;
}
.content-header > h1 > small {
    font-size: 15px;
    display: inline-block;
    padding-left: 4px;
    font-weight: 300;
}
.content-header > .breadcrumb {
    float: right;
    background: transparent;
    margin-top: 0;
    margin-bottom: 0;
    font-size: 12px;
    padding: 7px 5px;
    position: absolute;
    top: 15px;
    right: 10px;
    border-radius: 2px;
}
.content-header > .breadcrumb > li > a {
    color: #444;
    text-decoration: none;
    display: inline-block;
}
.content-header > .breadcrumb > li > a > .fa,
.content-header > .breadcrumb > li > a > .glyphicon,
.content-header > .breadcrumb > li > a > .ion {
    margin-right: 5px;
}
.content-header > .breadcrumb > li + li:before {
    content: '>\00a0';
}
.errMsg{
    color: red;
    font-size: 10px;
}
.recent_posts_square_date a,.recent_posts_square_date a:hover { height:86px; width:52px; float:left; text-align: center; display: block; font-size:20px; font-weight: bold;  
                                                                padding-top: 12px; border-radius: 3px; overflow: hidden; background: #ededed; color:#666; line-height: 22px; text-decoration: none; margin:0; }

.recent_posts_square_date span.d_month { display: block; font-size: 11px; text-transform: uppercase; margin-top: 0px; margin-bottom: 4px; }
.recent_posts_square_date span.d_year { width:100%; height:26px; display: block; background: #da5455; color: #fff; font-size: 11px; font-weight: normal; margin:0; line-height: 26px; border-radius: 0 0 3px 3px; }

.recent_posts_square_posts ul,.recent_posts_square_posts ul li { background: none; padding:0; margin:0;  list-style: none; clear:both; }
.recent_posts_square_posts ul li:first-child { padding-top: 0; }
.recent_posts_square_posts ul li:last-child { border:0; }
.recent_posts_square_posts ul li { clear:both; min-height: 70px; border-bottom: 1px solid #ececec; padding:23px 0 0 0; }
.recent_posts_square_posts ul li .grid_date { margin: 8px 0 11px 0;}
.recent_posts_square_posts ul li .grid_date span { margin-right: 20px; }
.recent_posts_square_posts ul li .grid_date a { color:#888; }
.recent_posts_square_posts ul li .grid_date i { color:#ccc; margin-right: 8px; }

.recent_posts_square_content { margin-left: 70px; }
.recent_posts_square_content a { text-decoration: none; }
.recent_posts_square_content a.read-more { margin-top: 5px; }
.recent_posts_square_content p { margin-bottom: 0; color:#888;  }

.recent_posts_square_posts .recent_posts_square_title { margin:0 0 2px 0; padding:0; font-weight: bold; }
.recent_posts_square_posts .recent_posts_square_title a { font-size: 14px; text-decoration: none; }

.dot_heading { height: auto; margin: 0 0 20px; font-weight: 400; color: #222; -webkit-font-smoothing: antialiased; background: url("img/dot1.png") center repeat-x; }

.dot_h_center { text-align: center; }
.dot_h_left { text-align: left; }
.dot_h_right { text-align: right; }

.dot_heading div.heading_text { display: inline-block; background: #fff; }
.dot_h_center div.heading_text { padding: 3px 15px;  }
.dot_h_right div.heading_text { padding: 0 0 0 15px; }
.dot_h_left div.heading_text { padding: 0 15px 0 0; }
.img-content {
    background-color: #ecf0f5;
    padding: 10px;
}
.container-fluid{
    width:100%;
    /*padding: 15px;*/
    margin-left: auto;
    margin-right: auto;
}
.text-muted{
    color: #fff;
    /*color: #6c757d!important;*/
    font-size: 12px;
    line-height: 1.5;
    margin-bottom: 20px;
}
.ml4 {
    position: relative;
    font-weight: 900;
    font-size: 2.5em;
}
.ml4 .letters {
    position: absolute;
    margin: auto;
    left: 0;
    top: 0.3em;
    right: 0;
    opacity: 0; 
}
h1.ml8 {
    font-weight: 900;
    font-size: 3em;
    color: #fff;
    width: 3em;
    height: 3em;
}

.ml8 .letters-container {
    position: absolute;
    left: 0;
    right: 0;
    margin: auto;
    top: 0;
    bottom: 0;
    height: 1em;
}

.ml8 .letters {
    position: relative;
    z-index: 2;
    display: inline-block;
    line-height: 0.7em;
    right: -0.12em;
    top: -0.2em;
}

.ml8 .bang {
    font-size: 1.4em;
    top: auto;
    left: -0.06em;
}

.ml8 .circle {
    position: absolute;
    left: 0;
    right: 0;
    margin: auto;
    top: 0;
    bottom: 0;
}

.ml8 .circle-white {
    width: 3em;
    height: 3em;
    border: 2px dashed white;
    border-radius: 2em;
}

.ml8 .circle-dark {
    width: 2.2em;
    height: 2.2em;
    background-color: #D10121;
    border-radius: 3em;
    z-index: 1;
}

.ml8 .circle-dark-dashed {
    border-radius: 1.4em;
    background-color: transparent;
    border: 2px dashed #D10121;
    width: 3.3em;
    height: 3.3em;
}
.flex-container {
    height: 100%;
    padding: 0;
    margin: 0;
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    align-items: center;
    justify-content: center;
}
.flex-item {
    background-color: tomato;
    padding: 5px;
    width: 20px;
    height: 20px;
    margin: 10px;
    line-height: 20px;
    color: white;
    font-weight: bold;
    font-size: 2em;
    text-align: center;
}
.login-box,
.register-box {
  width: 360px;
  margin: 7% auto;
}
.socialmedia{
    padding: 13px;
    font-size: 30px;
    border-radius: 50%;
    width:50px;
    height:50px;
}

.navbar {
  background-color: rgba(255, 255, 255, .4);
  backdrop-filter: blur(12px);
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
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
  gap: 2.5rem;
  list-style: none;
}

.nav-link, #brand {
  
  color: #111;
  font-size: 2.25rem;
  font-family: 'Abel', sans-serif;
  text-transform: uppercase;
  transition: 350ms cubic-bezier(0.65, 0, 0.35, 1);
}
        
        </style>
        
    </head>
    <body>
        
<div id="top1" class="row" style="background-color: #8c1406; margin-top: 0px;position:fixed;width: 100%;z-index: 999;">
   <div>
<nav class="navbar">
  <!-- Logo !-->
  <a id="brand" href="http://localhost:8080/home" style= "padding-right: 500px;" >Home</a>
  <ul class="nav-list">
    <!-- Link 1 !-->
    <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/ajax">DonorList</a>
    </li>
      <!-- Link 2 !-->
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
    </li>
   
     <li class="nav-item">
      <a class="nav-link" href="http://localhost:8080/login">logout</a>
    </li>
    
  </ul>
</nav>
</div >
</div>
<div class="row" style="background-color: #6A1208;padding-top: 55px;">
    <div class="col-md-4" style="text-align: center;color: #f6f6f6;padding-top:50px;">
        <h3><div style="  font-family: "Lucida Console", "Courier New", monospace;">A Drop of water makes ocean.</div>
            <div style="  font-family: "Lucida Console", "Courier New", monospace;">A Unit of Blood SAVES LIFE.</div></h3>
    </div>
    <div class="col-md-4" style="text-align: center; box-shadow:0px 8px 32px 0 black; 
    border-left:1px solid ;
     border-top:1px solid ;">
    
   
    
        <img src="data:image/png;base64,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" style="height: 160px;">
    </div>
    
    
     <div class="col-md-4 center" style="padding: 5px;">
        <div style="border-radius: 50%;background-color: yellow; height: 150px;width: 150px;margin-left: auto;margin-right: auto;">
            <div class="count-up h1 text-center"  style="padding-top: 40px;font-size:3rem;color:#6A1208;margin-top:10px;">BLOOD DONORS</div>
            <div style="color:#6A1208;"></div>
        </div>
    </div>
</div>  
      
</div>     



   <div>
            <img src="http://blooddonors.in/img/donate1.jpg" alt="Donate Blood" style="width: 100%;">
        </div>
        <div class="col-md-12 center" style="padding: 13px;"><h2><a href="blood_request.php"> POST YOUR REQUIREMENT </a></h2></div>
        <div class="container">
                        <div class="panel panel-primary">
                <div class="panel-heading center"><h2> Benefits </h2></div>
                <div class="panel-body justify" style="line-height:2; font-size:2em;">
                    <li>Donating blood may reduce the risk of heart disease for men and stimulate the generation of red blood cells.</li>
                    <li>The amount of toxic chemicals (e.g. mercury, pesticides, fire retardants) circulating in the blood stream is reduced by the amount contained in given blood. </li>
                    <li>The good news is you can give blood again and again to help save more lives! </li>
                    <li>If you're a regular blood donor, you can give blood once in 12 weeks.</li>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading center"><h2> World Blood Donors Day  </h2></div>
                <div class="panel-body justify" style="line-height:2; font-size:2em;">
                    Following the success of the World Health Day 2000 with the theme 'Blood Saves Lives', 14th June is observed as the World Blood Donors Day. 
                    The date coincides with the birth date of Karl Landsteiner, who discovered the ABO blood group system.
                </div>
            </div>

            <div class="panel panel-success" style="font-size:1.5em;">
                <div class="panel-heading center"><h2> Recent Blood Donors </h2></div>
                
                

                
<table id="DonorDetails" name="Donor Details" value="Donor Details" >

 									
</table>                
                
                
                
                                    </div>
            </div>
            <div class="col-md-12 center" style="border-radius: 5px;background-color: #f6f6f6;padding: 20px 0 20px;font-size:1.5em;">
                Every 2 Seconds, someone in the country is in need of blood <br>
                <br>
                Every year our nation requires about 4 Crore units of blood <br>
                <br>
                Out of which only a meager 5 Lakh units of blood are available
            </div>
        </div>
        <footer class="container-fluid text-center">
            <div class ="col-md-12" style="background-color:#333; padding: 25px;color: #f6f6f6; line-height: 1.5;font-size: .8rem;">
    <div class="col-md-6" style="padding-top:20px;">
    </div>
    <div class="col-md-6">
        <div>
            <a href="https://www.facebook.com/people/FA-Software/100069895012241/" class="fa fa-facebook socialmedia" style="font-size:2rem;" target="_blank"></a>  <a href="https://twitter.com/fasolutions/status/1115554115013283840" class="fa fa-twitter socialmedia" style="font-size:2rem;" target="_blank"></a>
        </div>
    </div>
</div>
<div class ="col-md-12 center" style="font-size: 1.25rem; background-color:#000; padding: 15px;color: #f6f6f6">© 2023 FA SOFTWARE <a href="https://www.fasoftwares.com/#/" target="_blank">SOLUTIONS</a></div>

        </footer>
    </body>
</html>