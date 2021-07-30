package com.myCodeBook.servelets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.myCodeBook.dao.PostDao;
import com.myCodeBook.entities.Post;
import com.myCodeBook.entities.User;
import com.myCodeBook.helper.ConnectionProvider;
import com.myCodeBook.helper.Helper;


@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out  =  response.getWriter();
		
		
		String pTitle =  request.getParameter("pTitle");
		int cid =  Integer.parseInt(request.getParameter("cid"));
		String pContent =  request.getParameter("pContent");
		String pCode =  request.getParameter("pCode");
		Part part =  request.getPart("pic");
		
		//getting the current log in user....
		HttpSession session  =  request.getSession();
		User user  = (User)session.getAttribute("currentUser");
		
		//out.println(part.getSubmittedFileName());
		Post p = null;
		if(!part.getSubmittedFileName().isEmpty()) {
		  p =  new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,user.getId());
		}
		else {
			p =  new Post(pTitle,pContent,pCode,"defaultPost.jpg",null,cid,user.getId());
		}
		PostDao dao =  new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)) {
		
			String path = request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
			//out.println("path=="+path);
			Helper.saveFile(part.getInputStream(), path);
			out.println("Done");
		}
		else {
			out.println("Error");
		}
		
	}

}
