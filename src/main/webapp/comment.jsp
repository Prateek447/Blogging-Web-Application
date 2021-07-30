<%@page import="com.myCodeBook.entities.Message"%>
<%@page import="com.myCodeBook.entities.User"%>
<%@page import="com.myCodeBook.helper.ConnectionProvider"%>
<%@page import="com.myCodeBook.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myCodeBook.dao.PostDao"%>

<% 

User user = (User) session.getAttribute("currentUser");

if (user == null) {
	response.sendRedirect("LogIn.jsp");
	
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="en">
    
<head>


        <!-- title -->
        <title>Blog Homepage</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1" />
        <meta name="author" content="ThemeZaa">
        <!-- description -->
        <meta name="description" content="POFO is a highly creative, modern, visually stunning and Bootstrap responsive multipurpose agency and portfolio HTML5 template with 25 ready home page demos.">
        <!-- keywords -->
        <meta name="keywords" content="creative, modern, clean, bootstrap responsive, html5, css3, portfolio, blog, agency, templates, multipurpose, one page, corporate, start-up, studio, branding, designer, freelancer, carousel, parallax, photography, personal, masonry, grid, coming soon, faq">
        <!-- favicon -->
        <link rel="shortcut icon" href="images/favicon.png">
        <link rel="apple-touch-icon" href="images/apple-touch-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
        <!-- animation -->
        <link rel="stylesheet" href="css/animate.css" />
        <!-- bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- et line icon --> 
        <link rel="stylesheet" href="css/et-line-icons.css" />
        <!-- font-awesome icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css" />
        <!-- themify icon -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- swiper carousel -->
        <link rel="stylesheet" href="css/swiper.min.css">
        <!-- justified gallery  -->
        <link rel="stylesheet" href="css/justified-gallery.min.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="css/magnific-popup.css" />
        <!-- revolution slider -->
        <link rel="stylesheet" type="text/css" href="revolution/css/settings.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="revolution/css/navigation.css">
        <!-- bootsnav -->
        <link rel="stylesheet" href="css/bootsnav.css">
        <!-- style -->
        <link rel="stylesheet" href="css/style.css" />
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css" />
        <!--[if IE]>
            <script src="js/html5shiv.js"></script>
        <![endif]-->
        
           
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
    
        <!-- start header -->
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
  <!-- end header -->
        
        
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
        
        
        
        <!-- start blog section -->
        <section class="p-0 wow fadeIn">
            <div class="container-fluid">
                <div class="row blog-post-style4">
                    <div class="col-12 px-3 p-md-0">
                        <ul class="blog-grid blog-4col gutter-small">
                            <li class="grid-sizer"></li>
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-01.html"><img src="images/blog-page-03-img5.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-01.html" class="text-white-2 text-deep-pink-hover">Get to know the world</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            
                            
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.2s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-05.html"><img src="images/blog-page-03-img6.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 no-margin-bottom"><a href="blog-post-layout-05.html" class="text-white-2 text-deep-pink-hover">The most beautiful sky</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.4s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-02.html"><img src="images/blog-page-03-img7.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-02.html" class="text-white-2 text-deep-pink-hover">I can't change the rule</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.6s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-03.html"><img src="images/blog-page-03-img8.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-03.html" class="text-white-2 text-deep-pink-hover">Happiness is something</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-04.html"><img src="images/blog-page-03-img9.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-04.html" class="text-white-2 text-deep-pink-hover">This is the secret of success</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.2s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-05.html"><img src="images/blog-page-03-img10.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-05.html" class="text-white-2 text-deep-pink-hover">Clouds come floating life</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.4s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-01.html"><img src="images/blog-page-03-img11.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-01.html" class="text-white-2 text-deep-pink-hover">Nothing is impossible</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.6s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-02.html"><img src="images/blog-page-03-img12.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-02.html" class="text-white-2 text-deep-pink-hover">What lies behind you</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-03.html"><img src="images/blog-page-03-img1.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-03.html" class="text-white-2 text-deep-pink-hover">Perfection is not attainable</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.2s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-04.html"><img src="images/blog-page-03-img2.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-04.html" class="text-white-2 text-deep-pink-hover">The spirit of adventure</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.4s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-01.html"><img src="images/blog-page-03-img3.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-01.html" class="text-white-2 text-deep-pink-hover">All you need is the plan</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                            <!-- start blog post item -->
                            <li class="grid-item wow fadeInUp" data-wow-delay="0.6s">
                                <figure>
                                    <div class="blog-img bg-extra-dark-gray">
                                        <a href="blog-post-layout-01.html"><img src="images/blog-page-03-img4.jpg" alt="" ></a>
                                    </div>
                                    <figcaption>
                                        <div class="portfolio-hover-main text-left">
                                            <div class="blog-hover-box align-bottom">
                                                <span class="post-author text-extra-small text-medium-gray text-uppercase d-block margin-5px-bottom sm-margin-5px-bottom">25 April 2017 | by <a href="blog-masonry.html" class="text-medium-gray">Jay Benjamin</a></span>
                                                <h6 class="alt-font d-block text-white-2 font-weight-600 mb-0"><a href="blog-post-layout-01.html" class="text-white-2 text-deep-pink-hover">We know what we are</a></h6>
                                                <p class="text-medium-gray margin-10px-top width-80 md-width-100 blog-hover-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            </div>
                                        </div>
                                    </figcaption>
                                </figure>
                            </li>
                            <!-- end blog post item -->
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- end post content -->
        
        
        
        
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
        
        
        <!-- start scroll to top -->
        <a class="scroll-top-arrow" href="javascript:void(0);"><i class="ti-arrow-up"></i></a>
        <!-- end scroll to top  -->
        <!-- javascript libraries -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/modernizr.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/skrollr.min.js"></script>
        <script type="text/javascript" src="js/smooth-scroll.js"></script>
        <script type="text/javascript" src="js/jquery.appear.js"></script>
        <!-- menu navigation -->
        <script type="text/javascript" src="js/bootsnav.js"></script>
        <script type="text/javascript" src="js/jquery.nav.js"></script>
        <!-- animation -->
        <script type="text/javascript" src="js/wow.min.js"></script>
        <!-- page scroll -->
        <script type="text/javascript" src="js/page-scroll.js"></script>
        <!-- swiper carousel -->
        <script type="text/javascript" src="js/swiper.min.js"></script>
        <!-- counter -->
        <script type="text/javascript" src="js/jquery.count-to.js"></script>
        <!-- parallax -->
        <script type="text/javascript" src="js/jquery.stellar.js"></script>
        <!-- magnific popup -->
        <script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
        <!-- portfolio with shorting tab -->
        <script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
        <!-- images loaded -->
        <script type="text/javascript" src="js/imagesloaded.pkgd.min.js"></script>
        <!-- pull menu -->
        <script type="text/javascript" src="js/classie.js"></script>
        <script type="text/javascript" src="js/hamburger-menu.js"></script>
        <!-- counter  -->
        <script type="text/javascript" src="js/counter.js"></script>
        <!-- fit video  -->
        <script type="text/javascript" src="js/jquery.fitvids.js"></script>
        <!-- skill bars  -->
        <script type="text/javascript" src="js/skill.bars.jquery.js"></script> 
        <!-- justified gallery  -->
        <script type="text/javascript" src="js/justified-gallery.min.js"></script>
        <!--pie chart-->
        <script type="text/javascript" src="js/jquery.easypiechart.min.js"></script>
        <!-- retina -->
        <script type="text/javascript" src="js/retina.min.js"></script>
        <!-- revolution -->
        <script type="text/javascript" src="revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="revolution/js/jquery.themepunch.revolution.min.js"></script>
        <!-- revolution slider extensions (load below extensions JS files only on local file systems to make the slider work! The following part can be removed on server for on demand loading) -->
        <!--<script type="text/javascript" src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script>-->
        <!-- setting -->
        
        
        	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		
		
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="></script>
	<script
	
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
		
		
        <script type="text/javascript" src="js/main.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
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