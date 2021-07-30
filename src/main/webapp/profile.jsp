
<%@page import="com.myCodeBook.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myCodeBook.helper.ConnectionProvider"%>
<%@page import="com.myCodeBook.dao.PostDao"%>
<%@page import="com.myCodeBook.entities.Message"%>
<%@page import="com.myCodeBook.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
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

body {
	background: url(img/postBBB.jpg);
	background-size: cover;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
}


.left-half{
    height: 100%;
    overflow-y:hidden;
    position: fixed;
    bottom: 0;
    height: 100vh;

}

</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark primary-color py-4">
		<a class="navbar-brand" href="#"> <span class="fa fa-certificate"></span>
			BloggersSpot
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"> <span class="fa fa-home"></span> Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-plus-square"></span>
						Categories
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
				<li class="nav-item"><a class="nav-link" href="contact.jsp"><span
						class="	fa fa-phone-square"></span> About us</a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="	fa fa-object-ungroup"></span> Create Blog</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle-o "></span> <%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-lock "></span> Logout</a></li>
			</ul>
		</div>
	</nav>


	<%
	Message m = (Message) session.getAttribute("msg");

	if (m != null) {
	%>

	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>


	<!-- main -->
	<main>
		<div class="container-fluid">
			<div class="row mt-4">
			<div></div>
				<div class="col-md-2 ">
					<div class="list-group">
						<a href="#" onClick="getPosts(0,this)"
							class="c-link list-group-item list-group-item-action active">
							All blogs </a>
						<%
						PostDao da = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = da.getAllCategories();
						for (Category cc : list1) {
						%>
						<a href="#" onclick="getPosts(<%=cc.getcId()%>,this)"
							class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>
						<%
						}
						%>
					</div>
				</div>
				<div class="col-md-10">
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-3x fa-spin"></i>
						<h2 class="mt-2">Loading...</h2>
					</div>
					<div class="container-fluid" id="post-container"></div>
				</div>
			</div>
		</div>
		
	</main>
	
	

	<!-- Modal for edit profile-->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-color text-white">
					<h5 class="modal-title" id="exampleModalLabel">BloggersSpot</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">

					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px">
						<h5 class="modal-title" id="exampleModalLabel">
							<%=user.getName()%></h5>
					</div>

					<div id="profile-details">
						<table class="table table-dark">
							<tbody>
								<tr>
									<th scope="row">ID :</th>
									<td><%=user.getId()%></td>
								</tr>

								<tr>
									<th scope="row">Email :</th>
									<td><%=user.getEmail()%></td>
								</tr>



								<tr>
									<th scope="row">Status :</th>
									<td><%=user.getAbout()%></td>
								</tr>

								<tr>
									<th scope="row">Gender :</th>
									<td><%=user.getGender()%></td>
								</tr>


								<tr>
									<th scope="row">Registered on :</th>
									<td><%=user.getDateTime().toString()%></td>
								</tr>


							</tbody>
						</table>

					</div>


					<div id="profile-edit" class="container text-center"
						style="display: none">

						<h3 class="mt-2">Please Edit Carefully</h3>

						<form action="EditServlet" method="post"
							enctype="multipart/form-data">

							<table class="table table-dark">

								<tr>
									<td>ID :</td>
									<td><%=user.getId()%></td>
								</tr>


								<tr>
									<td>Name :</td>
									<td><input type="text" class="form-control"
										name="user_name" value="<%=user.getName()%>"></td>
								</tr>


								<tr>
									<td>Email :</td>
									<td><input type="email" class="form-control"
										name="user_email" value="<%=user.getEmail()%>"></td>
								</tr>

								<tr>
									<td>Password :</td>
									<td><input type="password" class="form-control"
										name="user_password" value="<%=user.getPassword()%>"></td>
								</tr>

								<tr>
									<td>Update Profile:</td>
									<td><input type="file" name="image" class="form-control">
									</td>
								</tr>

								<tr>
									<td>About :</td>
									<td><textarea rows="5" cols="4" class="form-control"
											name="user_about"><%=user.getAbout()%></textarea></td>
								</tr>

							</table>

							<div class="container">

								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>


						</form>



					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal for create post -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add blog
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
								PostDao postDao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postDao.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getcId()%>">
									<%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="pTitle" placeholder="Enter Post title"
								class="form-control" />
						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="height: 200px" placeholder="Enter your Content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control" style="height: 200px"
								placeholder="Enter your Code(if any)"></textarea>
						</div>
						<div class="form-control">
							<label>Add image to blog</label><br> <input type="file"
								name="pic">
						</div>
						<div class="container text-center ">
							<button type="submit" class="btn btn-outline-primary mt-3">Save
								Post</button>
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