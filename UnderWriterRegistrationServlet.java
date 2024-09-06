//com.cotroller
package com.controller;
import com.dao.UnderWriterDAO;
import com.beans.underwriter;

import java.io.IOException;
import java.util.Random;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/UnderwriterServlet")
public class UnderWriterRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id = generateId();
//   
//
//        request.setAttribute("id", id);
//
//
//        RequestDispatcher rd = request.getRequestDispatcher("/UnderwriterRegistration.jsp");
//        rd.forward(request, response);
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String doj = request.getParameter("doj");
        int id =UnderWriterDAO.generateId();
        String password = "Password@123";

        underwriter underwriter = new underwriter(id, name, dob, doj);
        boolean isAdded=false;
        try {
			isAdded=UnderWriterDAO.insert(underwriter);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(isAdded)
		{
			request.setAttribute("message", "REGISTRATION SUCCESSFUL !");
			request.getRequestDispatcher("UnderWriterRegistration.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("message", "REGISTRATION FAILED !");
			request.getRequestDispatcher("UnderWriterRegistration.jsp").forward(request, response);
		}
        response.sendRedirect("login.jsp"); // redirect to login page after registration
    
    }    
}