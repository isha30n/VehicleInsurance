package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Policies;
import com.dao.policyRegisterDao;
@WebServlet("/policyRegister")
public class PolicyRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	int policyid = Integer.parseInt(request.getParameter("policyid"));
    	String vehicleno = request.getParameter("vehicleNo");
    	String vehicletype = request.getParameter("vehicleType");
        String name = request.getParameter("customerName");
        int engineno = Integer.parseInt(request.getParameter("engineNo"));
        int chasisno = Integer.parseInt(request.getParameter("chasisNo"));
        long phoneno = Long.parseLong(request.getParameter("phoneNo"));
        String type = request.getParameter("type");
        Double amt = Double.parseDouble(request.getParameter("premiumAmount"));
        String fromdate = request.getParameter("fromDate");
        System.out.print("i am called"+request.getParameter("toDate"));
        String todate = request.getParameter("toDate");     
        System.out.println(todate);
        int writerId = Integer.parseInt(request.getParameter("underWriterId"));

        Policies user = new Policies(policyid,vehicleno,vehicletype,name,engineno,chasisno,phoneno,type,amt,fromdate,todate,writerId);
        boolean isAdded=false;
        try {
			isAdded=policyRegisterDao.insert(user);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(isAdded)
		{
			request.setAttribute("message", "REGISTRATION SUCCESSFUL !");
			request.getRequestDispatcher("PolicyRegistration.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("message", "REGISTRATION FAILED !");
			request.getRequestDispatcher("PolicyRegistration.jsp").forward(request, response);
		}
        //response.sendRedirect("login.jsp"); // redirect to login page after registration
    
    }    
    
  
}