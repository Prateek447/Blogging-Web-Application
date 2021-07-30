package com.myCodeBook.servelets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myCodeBook.dao.CategoryDao;
import com.myCodeBook.entities.Category;
import com.myCodeBook.helper.ConnectionProvider;


@WebServlet("/RemoveCategoryServlet")
public class RemoveCategoryServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		CategoryDao dao  =  new CategoryDao(ConnectionProvider.getConnection());
		
		    String name =  request.getParameter("categoryNameForDelete");	
		   Category cat  =  new Category(name);
		    dao.removeCategory(cat);
	     response.sendRedirect("admin.jsp");
	}

}
