

<%@page import="com.myCodeBook.entities.User"%>
<%@page import="com.myCodeBook.dao.LikeDao"%>
<%@page import="com.myCodeBook.entities.Post"%>
<%@page import="com.myCodeBook.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.myCodeBook.helper.ConnectionProvider"%>
<%@page import="com.myCodeBook.dao.PostDao"%>

<link href="css/mystyle.css" rel="stylesheet" type="text/css" />

<style>

div.b {
  white-space: nowrap; 
  width: 420px; 
  overflow: hidden;
  text-overflow: ellipsis; 
  border: 1px solid #FFF;
  font-family: verdana;
}

p {
    display: -webkit-box;
    -webkit-line-clamp: 4;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

.left-half{
    height: 100%;
    overflow-y:hidden;
    position: fixed;
    bottom: 0;
    height: 100vh;

}

</style>


<div class="row">


<%

User user =  (User)session.getAttribute("currentUser");

PostDao dao = new PostDao(ConnectionProvider.getConnection());


int cId =  Integer.parseInt(request.getParameter("cId"));


List<Post> list = null;

if(cId==0){
	list =  dao.getAllPost();
}

if(cId>0){
	list =  dao.getPostByCatId(cId);
}



for(Post p : list){
	
	%>
	
	<div class="col-md-4 mt-2 admin">
	<div class="card">
  <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title" style=" text-shadow: 2px  #4c4c4c; font-weight: 900;"><%= p.getpTitle() %></h5>
     <div><p style="  font-family: verdana;"><%= p.getpContent() %></p></div>

    <div class="card-footer primary-color text-center mt-3">
     <% 
         LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
      %>
      
       <a href="#" onclick="doLike(<%= user.getId() %>, <%= p.getpId()%>)" class="btn btn-outline-light btn-sm "><i class="fa fa-thumbs-o-up"> </i> <span class="like-counter"><%= ld.countLikeOnPost(p.getpId()) %></span> Like</a>

       <a href="blog_page.jsp?post_id=<%= p.getpId() %>" class="btn btn-outline-light btn-sm ">Read More...</a>

      
    </div>
    
                            
   
  </div>
</div>
	
	
	</div>
	
	
	
	<%
	
}

%>

</div>