package com.myCodeBook.servelets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myCodeBook.dao.UserDao;
import com.myCodeBook.entities.User;
import com.myCodeBook.helper.ConnectionProvider;


@WebServlet("/RemoveUserServlet")
public class RemoveUserServlet extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email =  request.getParameter("userEmail");
		User user  = new User(email);
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		dao.removeUser(user);
		response.sendRedirect("admin.jsp");
	}

}
