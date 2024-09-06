package com.controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/roleChangeServlet")
public class RoleChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String role=request.getParameter("role");
		if(role.equals("Admin")) {			
			request.getRequestDispatcher("adminLogin.jsp").forward(request,response);
		}
		else {
			request.getRequestDispatcher("UnderWriterMenu.jsp").forward(request,response);
		}
		
	}
	
}
