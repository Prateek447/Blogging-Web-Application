package com.myCodeBook.servelets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myCodeBook.dao.UserDao;
import com.myCodeBook.entities.Message;
import com.myCodeBook.entities.User;
import com.myCodeBook.helper.ConnectionProvider;


@WebServlet(urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userEmail  = request.getParameter("email");
		String userPassword =  request.getParameter("password");
		UserDao dao =  new UserDao(ConnectionProvider.getConnection());
		User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(user==null) {
			
			Message msg = new Message("Invalid details try again...","error","alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("LogIn.jsp");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
			if(user.getUserType().equals("admin"))
			response.sendRedirect("admin.jsp");
			else if(user.getUserType().equals("normal")) {
				response.sendRedirect("profile.jsp");
			}
			
		}
		
	}

}
