package com.controller;

import com.dao.UpdateUnderWriterPwdDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servlet")
public class UpdateUnderWriterPWDServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String action = request.getParameter("checkUserId") != null ? "checkUserId" : "updatePassword";

        request.setAttribute("userExists", false);
        request.setAttribute("message", "");
        request.setAttribute("password", password);
        request.setAttribute("confirmPassword", confirmPassword);

        try (Connection connection = UpdateUnderWriterPwdDAO.getConnection()) {
            if ("checkUserId".equals(action)) {
                // Check if underwriter ID exists
                boolean exists =UpdateUnderWriterPwdDAO.underwriterExists(connection, userId);
                request.setAttribute("userExists", exists);
                if (!exists) {
                    request.setAttribute("message", "Invalid underwriter ID.");
                }
                request.getRequestDispatcher("UpdateUnderWriterPwd.jsp").forward(request, response);
            } else if ("updatePassword".equals(action)) {
                if (password == null || confirmPassword == null || userId == null) {
                    request.setAttribute("message", "All fields are required.");
                } else {
                    // Validate and update password
                    String validationMessage = validatePassword(password);
                    if (validationMessage.isEmpty()) {
                        if (password.equals(confirmPassword)) {
                        	UpdateUnderWriterPwdDAO.updatePassword(connection, userId, password);
                            // Redirect to initial state after successful password update
                            response.sendRedirect("UpdateUnderWriterPwd.jsp?message=Password updated successfully.");
                            return; // Exit the method to avoid forwarding after redirect
                        } else {
                            request.setAttribute("message", "Passwords do not match.");
                        }
                    } else {
                        request.setAttribute("message", validationMessage);
                    }
                }
                request.setAttribute("userExists", true);
                request.getRequestDispatcher("UpdateUnderWriterPwd.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.getRequestDispatcher("UpdateUnderWriterPwd.jsp").forward(request, response);
        }
    }

    private String validatePassword(String password) {
        final String LOWERCASE_REGEX = ".*[a-z].*";
        final String UPPERCASE_REGEX = ".*[A-Z].*";
        final String DIGIT_REGEX = ".*\\d.*";
        final String SPECIAL_CHAR_REGEX = ".*[\\W_].*";
        final int MIN_LENGTH = 8;

        StringBuilder message = new StringBuilder();

        if (!password.matches(LOWERCASE_REGEX)) {
            message.append("Password must contain at least one lowercase letter.<br>");
        }
        if (!password.matches(UPPERCASE_REGEX)) {
            message.append("Password must contain at least one uppercase letter.<br>");
        }
        if (!password.matches(DIGIT_REGEX)) {
            message.append("Password must contain at least one digit.<br>");
        }
        if (!password.matches(SPECIAL_CHAR_REGEX)) {
            message.append("Password must contain at least one special character.<br>");
        }
        if (password.length() < MIN_LENGTH) {
            message.append("Password must be at least 8 characters long.<br>");
        }

        return message.toString();
    }
}
