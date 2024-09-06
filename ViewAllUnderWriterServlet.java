package com.controller;
import com.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.underwriter;


/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/ViewAllUnderWriterServlet")
public class ViewAllUnderWriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		PrintWriter out = resp.getWriter();
		StringBuilder tableHtml=new StringBuilder();
		List<underwriter> list = ViewAllUnderWriterDAO.Students();
		tableHtml.append("<table border='1' width='100%'");
		tableHtml.append("<tr><th>Id</th><th>Name</th><th>Dob</th><th>doj</th></tr>");
		
//		out.print("<tr><td>"+list.get(0).getId()+"</td><td>"+list.get(0).getName()+"</td><td>"+list.get(0).getDob()+"</td><td>"+list.get(0).getDoj()+"</td></tr>");
		for (underwriter s:list) {
			tableHtml.append("<tr><td>"+s.getId()+"</td><td>"+s.getName()+"</td><td>"+s.getDob()+"</td><td>"+s.getJod()+"</td></tr>");
		}
		tableHtml.append("</table>");
		req.setAttribute("tableHTML", tableHtml.toString());
		req.getRequestDispatcher("ViewAllUnderwriter.jsp").forward(req, resp);
	}
	

}
