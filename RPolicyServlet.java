package com.controller;
import com.dao.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RenewPolicyServlet2")
public class RPolicyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long policyId = (long) Integer.parseInt(request.getParameter("policyId"));
        double premiumAmount = Double.parseDouble(request.getParameter("premiumAmount"));
        boolean userExist=sqlite.search(policyId);
        if(userExist) {
        boolean isExpired;
		try {
			isExpired = RenewPolicyDAO.isPolicyExpired( policyId);
            if (!isExpired) {
                request.setAttribute("message", "Policy has not expired.");
            } 
            else 
            {
	                 RenewPolicyDAO.createNewPolicy(policyId, premiumAmount);
	                 request.setAttribute("message", "Policy updated successfully with new dates.");
            }
		}
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
       }
        else
        {
        	request.setAttribute("message", "Policy not found.");
//        	request.getRequestDispatcher("PRenewal.jsp").forward(request, response);
        }
            request.getRequestDispatcher("PRenewal.jsp").forward(request, response);
        } 
    
    
    }

