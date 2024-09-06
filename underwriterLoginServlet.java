package com.controller;
import com.dao.*;
import java.io.IOException;
import java.sql.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class underwriterLoginServlet
 */
@WebServlet("/underwriterLoginServlet")
public class underwriterLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public underwriterLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("userid"));
		String pwd=request.getParameter("password");
		if(sqlite.underwriter_login(uid, pwd)) {
			HttpSession session=request.getSession();
			session.setAttribute("underwriterId",uid);
			response.sendRedirect("UnderWriterMenu.jsp");
		}
		else {
			request.setAttribute("message", "Invalid Credentials. Please try Again...");
			request.getRequestDispatcher("underwriterLogin.jsp").forward(request, response);
		}
	}

}
