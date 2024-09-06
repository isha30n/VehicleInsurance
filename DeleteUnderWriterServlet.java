package com.controller;
import com.beans.underwriter;
import com.dao.DeleteUnderWriterDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DelteServlet")
public class DeleteUnderWriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("ID"));
		
		if(DeleteUnderWriterDAO.delete(id)>0) {
			
			request.setAttribute("Message", "Underwriter with ID :"+id+" is deleted.");
			request.getRequestDispatcher("DeleteUnderWriter.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("Message", "No Such Underwriter exists with given Id");
			request.getRequestDispatcher("DeleteUnderWriter.jsp").forward(request, response);
		}
		
	}

}
