package com.controller;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PolicyRenewalServlet")
public class RenewalPolicyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int policyId=Integer.parseInt(request.getParameter("policyid"));
//		String action=request.getParameter("action");
//		
//			
			String vehicleType = request.getParameter("vehicleType");
			String claimedInsurance = request.getParameter("claimedInsurance");
			String vehicleState = request.getParameter("vehicleState");
			double vehicleValue = Double.parseDouble(request.getParameter("vehicleValue"));
			
			double premium = 0.0;
			double ncb = 1000.0;  
			
			if ("new".equals(vehicleState)) {
				if ("2 wheeler".equals(vehicleType)) {
					premium = vehicleValue * 0.1;
				} else if ("4 wheeler".equals(vehicleType)) {
					premium = vehicleValue * 0.15;
				}
			} else if ("old".equals(vehicleState)) {
				if ("2 wheeler".equals(vehicleType)) {
					if ("yes".equals(claimedInsurance)) {
						premium = vehicleValue * 0.1;
					} else if ("no".equals(claimedInsurance)) {
						premium = vehicleValue * 0.1 - ncb;
					}
				} else if ("4 wheeler".equals(vehicleType)) {
					if ("yes".equals(claimedInsurance)) {
						premium = vehicleValue * 0.15;
					} else if ("no".equals(claimedInsurance)) {
						premium = vehicleValue * 0.15 - ncb;
					}
				}
			}
			
			request.setAttribute("premium", String.format("%.2f", premium));
			request.getRequestDispatcher("ClaimInsurance.jsp").forward(request, response);
			
		}
		    }
		

	
	


