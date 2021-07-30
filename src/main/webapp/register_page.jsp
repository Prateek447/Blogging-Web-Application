<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logIn page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 43%, 100% 83%, 61% 98%, 25% 84%, 0 95%, 0% 43%, 0 0);
}
</style>
</head>
<body>

<!-- Navbar -->
<%@include file="normal_navbar.jsp" %>


<main class="d-flex align-items-center primary-color banner-background " style="padding-bottom: 120px; padding-top: 40px">
 
  <div class="container">
     <div class="row">
       <div class="col-md-5 offset-md-4">
         
          <div class="card">
            <div class="card-header primary-color text-white text-center">
             <spane class="	fa fa-user-plus fa-3x"></spane>
              <p>Register Here</p>
                </div>
              <div class="card-body">
              
              
                <form id="reg-form" action="RegisterServlet" method="post">
                <div class="form-group">
    <label for="exampleInputusername">Username</label>
    <input name="user_name" type="text" class="form-control" id="username" aria-describedby="usernameHelp" placeholder="Enter username">
    <small id="emailHelp" class="form-text text-muted"></small>
  </div>
                
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="password" placeholder="Password">
  </div>
  
  
    <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio"  id="maleGender"  name="user_gender" value="male" > Male
    <input type="radio" id="femaleGender"  name="user_gender" value="female"> Female
  </div>
  
  
  
  <div class="form-group">
    <textarea name="about" class="form-control" rows="5" cols="30" placeholder="Enter Something about yourself"></textarea>
  </div>
  
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
  </div>
  <br>
  
  <div class="container text-center" id="loader" style="display: none;">
    <span class="fa fa-refresh fa-2x fa-spin"></span>
    <h4>Please wait...</h4>
  </div>
  
  <button id="submit-btn" type="submit" class="btn btn-primary">Signup</button>
</form>

            </div>
          
          </div>
       </div>
       
     </div>
  </div>

</main>



<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>

$(document).ready(function(){
	
	$('#reg-form').on('submit', function (event){
		
		
		event.preventDefault();
		
		
		
		let form =  new FormData(this);
		
		$("#submit-btn").hide();
		$("#loader").show();
		
		$.ajax({
			url:"RegisterServlet",
			type:'POST',
			data: form,
			success : function (data, textStatus, jqXHR){
				console.log(data)
				$("#submit-btn").show();
				$("#loader").hide();
				
				if(data.trim() == 'Saved Successfully'){
					
				swal("Register Successfully...")
				.then((value) => {
				     window.location="LogIn.jsp"
				});
				}
				else{
					
					swal(data);
				}
			},
			error : function (jqXHR, textStatus, errorThrown){
				console.log(jqXHR)
				$("#submit-btn").show();
				$("#loader").hide();
				swal("Something went wrong ...");
			},
			processData : false,
			contentType : false
		});
	});
});

</script>

</body>
</html>