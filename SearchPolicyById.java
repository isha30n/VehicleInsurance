package com.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import com.dao.sqlite;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Psearch")
public class SearchPolicyById extends HttpServlet {

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		int id = Integer.parseInt(req.getParameter("pid"));
		PrintWriter out=res.getWriter();
		System.out.println(sqlite.search(id));
	
			if(sqlite.search(id)) {
				 req.setAttribute("policyId", id);

			        // Forward the request to SecondServlet
			        RequestDispatcher dispatcher = req.getRequestDispatcher("DisplayPolicy.jsp");
			        dispatcher.forward(req, res);
				
			}
			else {
				req.setAttribute("error", "Not valid id");
				RequestDispatcher dispatcher = req.getRequestDispatcher("RenewalPolicy.jsp");
		        dispatcher.forward(req, res);
			}
				
		
		
	}
	
}
