package com.myCodeBook.servelets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myCodeBook.entities.Message;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession s =  request.getSession();
		s.removeAttribute("currentUser");
		
		Message m  = new Message("Logout Successfuly","success","alert-success");
		s.setAttribute("msg", m);
		response.sendRedirect("LogIn.jsp");
		 
	}

}
