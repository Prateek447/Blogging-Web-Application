
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
	  <!-- Material Kit CSS -->
  <link href="css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
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
								<%
								PostDao daa = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list2 = daa.getAllCategories();
								for (Category cc : list2) {
								%>
								<a href="#" onclick="getPosts(<%=cc.getcId()%>,this)"
									class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>
								<%
								}
								%>
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

				<li class="nav-item"><a href="LogoutServlet" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out fa fa-lock fa-fw"></span> Logout
           </a></li>
			</ul>
		</div>
	</nav>


	<!-- main -->
	<main >
		<div class="container">
			     <div class="row mt-5">
            <div class="col-md-4">
            <div class="card">
              <div class="card-body text-center">
              <div class="container">
                <img style="max-width : 150px"  class="img-fluid" alt="users-image" src="img/team.png">
              </div>
              <h2>1234</h2>
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
                  <h2>62526</h2>
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
              <h2>78652</h2>
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

          <a href="#" class="btn btn-info btn-lg btn-success" data-toggle="modal" data-target="#addCategory">
          <span class="glyphicon glyphicon-log-out fa fa-plus fa-fw"></span> Add Category
           </a> 


           <a href="#" class="btn btn-info btn-lg btn-danger" data-toggle="modal" data-target="#deleteCategory">
          <span class="glyphicon glyphicon-log-out fa fa-trash fa-fw"></span> Remove Category
           </a> 
                       
            </div>
            </div>
            </div>
            
            
            <div class="col-md-6">
             <div class="card">
              <div class="card-body text-center">
              <div class="container">
                <img style="max-width : 150px"  class="img-fluid" alt="users-image" src="img/admin.png">
              </div>
                 <h4>Click here to add and remove user</h4>
   <a href="#" class="btn btn-info btn-lg btn-success">
          <span class="glyphicon glyphicon-log-out fa fa-plus fa-fw"></span> Add User
           </a> 
           
           <a href="#" class="btn btn-info btn-lg btn-danger">
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
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form action="#">
         <div class="form-group">
          <input type="text" class="form-control" name="category" placeholder="Enter new Category" required="required">
         </div>
        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Add</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal for delete category -->
<div class="modal fade" id="deleteCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete a Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form action="#">
         <div class="form-group">
          <input type="text" class="form-control" name="category" placeholder="Enter category for delete" required="required">
         </div>
        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Delete</button>
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

	<script
		src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$('#profile-details').hide();
					$('#profile-edit').show();
					$(this).text("Back");
					editStatus = true;
				} else {
					$('#profile-details').show();
					$('#profile-edit').hide();
					$(this).text("Edit");
					editStatus = false;
				}
			});
		});
	</script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!--  -->

	<!-- Add Post JS -->

	<script>
		$(document).ready(function(e) {
			//execute it when form is submited.....
			$("#add-post-form").on("submit", function(event) {
				event.preventDefault();
				let form = new FormData(this);
				//now requesting to server
				$.ajax({
					url : "AddPostServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						//execute after successfully return from the server...
						if (data.trim() == "Done") {
							swal({
								title : "Good job!",
								text : "Saved Successfully",
								icon : "success",
								button : "Done!",
							});
						} else {
							swal({
								title : "Error!",
								text : "Something went wrong try again...",
								icon : "error",
								button : "Back!",
							});
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						swal({
							title : "Error!",
							text : "Something went wrong try again...",
							icon : "error",
							button : "Back!",
						});
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>

	<script>
	function getPosts(catId,temp){
		$("#loader").show;
		$("#post-container").hide();
		$(".c-link").removeClass('active');
		$.ajax({
			url:"load_posts.jsp",
			data:{cId:catId},
			success: function(data, textStatus, jqXHR){
				console.log(data);
				$("#loader").hide();
				$("#post-container").show();
				$("#post-container").html(data);
				$(temp).addClass('active')
			}
		});
		
	}
	$(document).ready(function(e) {
		
		let allPostRef = $(".c-link")[0]
		getPosts(0,allPostRef)
	});
	
	</script>

</body>
</html>