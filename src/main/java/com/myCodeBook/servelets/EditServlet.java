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

import com.myCodeBook.dao.UserDao;
import com.myCodeBook.entities.Message;
import com.myCodeBook.entities.User;
import com.myCodeBook.helper.ConnectionProvider;
import com.myCodeBook.helper.Helper;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		 String userEmail = request.getParameter("user_email");
		 String userName = request.getParameter("user_name");
		 String userPassword  = request.getParameter("user_password");
		 String userAbout  = request.getParameter("user_about");
		 Part profile  =  request.getPart("image");
		 String profileName  =  profile.getSubmittedFileName();
		 
		 
		 HttpSession session  = request.getSession();
		 User user  =  (User)session.getAttribute("currentUser");
		 user.setName(userName);
		 user.setEmail(userEmail);
		 user.setPassword(userPassword);
		 user.setAbout(userAbout);
		 String oldFile =  user.getProfile();
		 user.setProfile(profileName);
		 
		 PrintWriter out =  response.getWriter();
		 
		 UserDao dao  =  new UserDao(ConnectionProvider.getConnection());
		boolean f =  dao.updateUser(user);
		
		if(f) {
			//update
			String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			String pathOldFile = request.getRealPath("/")+"pics"+File.separator+oldFile;
			
			if(!oldFile.equals("default.jpg"))
			Helper.deleteFile(pathOldFile);
			
//			if(Helper.deleteFile(path)) {
				if(Helper.saveFile(profile.getInputStream(), path)) {
					
					Message msg = new Message("Profile updated...","success","alert-success");
					session.setAttribute("msg", msg);
					out.println("<h1>Profile updated</h1>");
				}
				else {
					out.println("<h1>Not updated</h1>");

					Message msg = new Message("Something went wrong...","error","alert-danger");
					session.setAttribute("msg", msg);
				}
				
				response.sendRedirect("profile.jsp");
			//}		
		}
		else {
			//not updated
			out.println("<h1>Not updated</h1>");
		}
		 
		 
		 
	}

}
