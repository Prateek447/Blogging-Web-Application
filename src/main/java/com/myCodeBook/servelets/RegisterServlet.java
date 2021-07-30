package com.myCodeBook.servelets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.myCodeBook.dao.UserDao;
import com.myCodeBook.entities.User;
import com.myCodeBook.helper.ConnectionProvider;


@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		      String check  =  request.getParameter("check");
		      
		      if(check==null) {
		    	  out.println("Please Agree the term and conditions");
		      }
		      else {
		    	  String name =  request.getParameter("user_name");
		    	  String email =  request.getParameter("user_email");
		    	  String password  =  request.getParameter("user_password");
		    	  String gender =  request.getParameter("user_gender");
		    	  String about =  request.getParameter("about");
		    	  
		    	  User user =  new User(name,email,about,password,gender);
		    	  
		    	  UserDao dao = new UserDao(ConnectionProvider.getConnection());
		    	  
		    	  if(dao.saveUser(user)) {
		    		  out.println("Saved Successfully");
		    	  }
		    	  else {
		    		  out.println("Error occurred");
		    	  }
		    	  
		    	  
		    	  
		      }
	}

}
