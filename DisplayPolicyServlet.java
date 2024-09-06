
package com.controller;
import com.beans.Policies;
import com.dao.*;
import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DisplayPolicy")
public class DisplayPolicyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int policyId = (Integer) request.getAttribute("policyId");
			Policies policy=sqlite.displayPolicies(policyId);
//			request.setAttribute("policyId", policy.getPolicyNo());
//			request.setAttribute("vehicleNo", policy.getVehicleNo());
			request.setAttribute("policy", policy);
			request.getRequestDispatcher("DisplayPolicy.jsp").forward(request,response);
}
}