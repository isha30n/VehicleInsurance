package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Policies;
import com.dao.PolicyDAO;


@WebServlet("/UpdatePolicyServlet")
public class UpdatePolicyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int policyId = Integer.parseInt(request.getParameter("policyId"));
    	HttpSession session=request.getSession();
		int uid=(int) session.getAttribute("underwriterId");
        Policies policy;
		try {
			policy = PolicyDAO.getPolicyById(policyId,uid);
			if (policy != null) {
	            request.setAttribute("policy", policy);
			}
			if (policy != null) {
	            if (policy.getTypeOfInsurance().equalsIgnoreCase("Full Insurance")) {
	                PolicyDAO.updatePolicyType(policyId, "Third Party");
	                request.setAttribute("successUpdate", "Policy Type Updated Successfully To 'Third Party Insured'.");
	            } else {
	                request.setAttribute("errorUpdate", "Cannot Change Policy Type To 'Fully Insured'.");
	            }
	        } else {
	            request.setAttribute("errorUpdate", "Policy Not Found.");
	        }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
        request.getRequestDispatcher("PolicyUpdate.jsp").forward(request, response);
    }
}