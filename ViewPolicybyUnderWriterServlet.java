package com.controller;

import com.dao.ViewPolicyByUnderWriterID;
import com.beans.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ViewPolicybyUnderWriterServlet")
public class ViewPolicybyUnderWriterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        StringBuilder result = new StringBuilder();

        try (Connection connection = ViewPolicyByUnderWriterID.getConnection()) {
            underwriter uw = ViewPolicyByUnderWriterID.getUnderwriter(connection, userId);
            if (uw != null) {
                List<Policies> policies = ViewPolicyByUnderWriterID.getPolicies(connection, userId);
                if (!policies.isEmpty()) {
                    result.append("<h3>Underwriter ID: ").append(uw.getId()).append("</h3>");
                    result.append("<p>Name: ").append(uw.getName()).append("</p>");
                    result.append("<p>Joining Date: ").append(uw.getJod()).append("</p>");
                    result.append("<h3>Policies:</h3>");
                    for (Policies policy : policies) {
                        result.append("<p>Vehicle No: ").append(policy.getVehicleNo()).append("</p>");
                        result.append("<p>Premium Amount: ").append(policy.getPremiumAmnt()).append("</p>");
                        result.append("<p>From Date: ").append(policy.getFromDate()).append("</p>");
                        result.append("<p>To Date: ").append(policy.getToDate()).append("</p>");
                        result.append("<hr>");
                    }
                } else {
                    result.append("<h3>Underwriter ID: ").append(uw.getId()).append("</h3>");
                    result.append("<p>Name: ").append(uw.getName()).append("</p>");
                    result.append("<p>Joining Date: ").append(uw.getJod()).append("</p>");
                    result.append("<p>No vehicles registered under this underwriter.</p>");
                }
            } else {
                result.append("<p>Invalid underwriter ID.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            result.append("<p>Database error: ").append(e.getMessage()).append("</p>");
        }

        request.setAttribute("result", result.toString());
        request.getRequestDispatcher("/ViewPolicybyUnderWriterID.jsp").forward(request, response);
    }
}
