
<%@page import="com.myCodeBook.dao.CategoryDao"%>
<%@page import="com.myCodeBook.dao.UserDao"%>
<%@page import="com.myCodeBook.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myCodeBook.helper.ConnectionProvider"%>
<%@page import="com.myCodeBook.dao.PostDao"%>
<%@page import="com.myCodeBook.entities.Message"%>
<%@page import="com.myCodeBook.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null || user.getUserType().equals("normal")) {
	response.sendRedirect("LogIn.jsp");
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile_page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner-background {
	clip-path: polygon(0 0, 100% 0, 100% 63%, 68% 100%, 12% 88%, 0 100%);
}

</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark primary-color py-4">
		<a class="navbar-brand" href="#"> 
			<h1 style="  font-style: italic;">Admin Panel</h1>
		</a>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"> </a></li>
				<li class="nav-item dropdown"><a
					class="" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 
				
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<div class="col ">
							<div class="list-group">
								<a href="#" onClick="getPosts(0,this)"
									class="c-link list-group-item list-group-item-action active">
									All blogs </a>
							
							</div>
						</div>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp"></a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp"
					data-toggle="modal" data-target="#add-post-modal"> </a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"></a></li>

				<li class="nav-item">
			
				<a href="LogoutServlet" class="btn btn-outline-light btn-lg">
          <span class="glyphicon glyphicon-log-out fa fa-lock fa-fw"></span> Logout
           </a></li>
			</ul>
		</div>
	</nav>


	<!-- main -->
	<main >
		<div class="container admin ">
			 <div class="row mt-5">
            <div class="col-md-4">
            <div class="card">
              <div class="card-body text-center">
              <div class="container">
                <img style="max-width : 150px"  class="img-fluid" alt="users-image" src="img/team.png">
              </div>
              <%
              UserDao userDao =  new UserDao(ConnectionProvider.getConnection());
              
              %>
              <h2><%= userDao.getTotalUsers() %></h2>
                  <h1 class="text-uppercase text-muted">Users</h1>
              </div>
            </div>
            </div>
            
            
            <div class="col-md-4">
             <div class="card">
              <div class="card-body text-center">
              <div class="container">
                <img style="max-width : 150px"  class="img-fluid" alt="users-image" src="img/table.png">
              </div>
              
              <%
              CategoryDao catDao =  new CategoryDao(ConnectionProvider.getConnection());
              
              %>
              <h2><%= catDao.getTotalCategories() %></h2>
                    <h1 class="text-uppercase text-muted">Categories</h1>
              </div>
            </div>
            </div>
            
            <div class="col-md-4">
             <div class="card">
              <div class="card-body text-center">
              <div class="container">
                <img style="max-width : 150px"  class="img-fluid" alt="users-image" src="img/blog.png">
              </div>
             <%
              PostDao postDao =  new PostDao(ConnectionProvider.getConnection());
              
              %>
              <h2><%= postDao.getTotalBlogs() %></h2>
               <h1 class="text-uppercase text-muted">Blogs</h1>
              </div>
            </div>
            </div>
            
            
            </div>
            
            <div class="row mt-3">
            <div class="col-md-6">
            <div class="card">
              <div class="card-body text-center">
              <div class="container">
                <img style="max-width : 150px"  class="img-fluid" alt="users-image" src="img/categories.png">
              </div>
              <h4>Click here to add and remove category</h4>


          <a href="#" class="btn  btn-lg btn-success" data-toggle="modal" data-target="#addCategory">
          <span class="glyphicon glyphicon-log-out fa fa-plus fa-fw"></span> Add Category
           </a> 


           <a href="#" class="btn btn-lg btn-danger" data-toggle="modal" data-target="#deleteCategory">
          <span class="glyphicon glyphicon-log-out fa fa-trash fa-fw"></span> Remove Category
           </a> 
                       
            </div>
            </div>
            </div>
            
            
            <div class="col-md-6">
             <div class="card ">
              <div class="card-body text-center">
              <div class="container">
                <img style="max-width : 150px"  class="img-fluid" alt="users-image" src="img/admin.png">
              </div>
                 <h4>Click here to add and remove user</h4>
          <a href="#" class="btn  btn-lg btn-success" data-toggle="modal" data-target="#addUser">
          <span class="glyphicon glyphicon-log-out fa fa-plus fa-fw"></span> Add User
           </a> 
           
           <a href="#" class="btn btn-info btn-lg btn-danger" data-toggle="modal" data-target="#deleteUser">
          <span class="glyphicon glyphicon-log-out fa fa-trash fa-fw"></span> Remove User
           </a>              </div>
            </div>
            </div>
            </div>
		</div>
		
	</main>
	
	

<!-- Modal for add category -->
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-color text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add New Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form  action="AddCategoryServlet" method="post">
 
        
         <div class="form-group">
          <input type="text" class="form-control" name="categoryTitle" placeholder="Enter new Category" required="required">
         </div>
         
         <div class="form-group">
          <textarea style="height:200px" type="text" class="form-control mt-3" name="categoryDesc" placeholder="Enter Category Description" required="required">
         </textarea>
         </div>
         
           
  <div class="container text-center" id="loader" style="display: none;">
    <span class="fa fa-refresh fa-2x fa-spin"></span>
    <h4>Please wait...</h4>
  </div>
         
         <div class="container text-center">
                 <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
               <button type="submit-add-btn" class="btn btn-outline-success">Add</button>
         </div>
        </form>
        
      </div>
</div>
  </div>
</div>


<!-- Modal for delete category -->
<div class="modal fade" id="deleteCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-color text-white">
        <h5 class="modal-title" id="exampleModalLabel">Delete a Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="RemoveCategoryServlet" method="post">

        
         <div class="form-group">
          <input type="text" class="form-control" name="categoryNameForDelete" placeholder="Enter Category name" required="required">
         </div> 
         
         
         <div class="container text-center">
                 <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
        <button type="submit-btn" class="btn btn-outline-danger">Delete</button>
         </div>
        </form>
        
      </div>
    </div>
  </div>
</div>




<!-- Modal for add User -->
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-color text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add New User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
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
  <div class="container text-center">
      <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
       <button id="submit-btn" type="submit" class="btn btn-outline-primary">Add User</button>  
  </div>

</form>
   
        
      </div>
     
    </div>
  </div>
</div>



<!-- Modal for delete user -->
<div class="modal fade" id="deleteUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete a user</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
         <form action="RemoveUserServlet" method="post">
     
         <div class="form-group">
            <input type="text" class="form-control" name="userEmail" placeholder="Enter User Email" required="required">
         
         </div>
         
         <div class="container text-center">
                 <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
        <button type="submit-btn" class="btn btn-outline-danger">Delete User</button>
         </div>
        </form>
        
      </div>
    </div>
  </div>
</div>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		
	<script src="js/myjs.js" type="text/javascript"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




    <!-- Add User JS -->
    <script>
$(document).ready(function(){
	console.log("loaded...");
	
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
					
				swal("New User Added...")
				.then((value) => {
				     window.location="admin.jsp"
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