<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>

<%@ page import="com.myCodeBook.helper.ConnectionProvider" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 72%, 66% 100%, 33% 88%, 0 100%, 0 0);
}
</style>
</head>
<body>
<!-- Navbar -->
<%@include file="normal_navbar.jsp" %>

<!-- Banner -->

<div class="container-fluid primary-color text-white banner-background">
  <div class="row">
    <div class="col p-5 ">
     <h3 class="display-3">Welcome, Bloggers</h3>
   <h3>Your day belongs to you</h3>   
    <p>Write a Blog, for changing the world</p>
    <button class="btn btn-outline-light"> <span class="fa fa-pencil-square-o"></span> Lets Start ! it's Free</button>
     <a href="LogIn.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>
    </div>
    <div class="col m-auto">
<lottie-player src="https://assets3.lottiefiles.com/packages/lf20_fGseie.json"  background="transparent"  speed="1"  style="width: 700px; height: 600px;"  loop  autoplay></lottie-player>

    </div>
  </div>
  </div>



<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>