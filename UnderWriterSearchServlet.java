package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.underwriter;
import com.dao.UnderWriterSearchDAO;

@WebServlet("/searchServlet")
public class UnderWriterSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
   


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idd = Integer.parseInt(request.getParameter("underwriterId"));
		String[] s = UnderWriterSearchDAO.getUnderWriterById(idd);
			if(s!=null)
			{
				System.out.print(s[0]);
				System.out.print(s[1]);
				request.setAttribute("id", s[0]);
				request.setAttribute("name", s[1]);
				request.setAttribute("dob", s[2]);
				request.setAttribute("join", s[3]);
				request.getRequestDispatcher("UnderWriterSearch.jsp").forward(request, response);
			}
			else {
				request.setAttribute("error", "User not Found");
				request.getRequestDispatcher("UnderWriterSearch.jsp").forward(request, response);

			}
	}

}
