
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
<style>
    body {text-align: center;}
    #bg {BACKGROUND-COLOR:#e4ebed}
    #clr {COLOR:#1fc3f0}
    .header {
        background-color:#1fc3f0;
        color:white;
        padding:15px 0;
        display:flex;
        align-items:center;
        justify-content:space-between;
    }
    .header h2 {
        margin:0;
        font-size:20px;
    }
    #footer {
        background-color:#1fc3f0;
        padding:10px 0;
        font-size:13px;
    }
    .nav-links {
        display:flex;
        gap:30px;
    }
    .nav-links a {
        color:white;
        text-decoration:none;
    }
    .pass {
        display: <% if (request.getAttribute("userExists") != null && (boolean)request.getAttribute("userExists")) { %> block <% } else { %> none <% } %>;
    }
    .success-message {
        color: green;
        font-weight: bold;
    }
    .error-message {
        color: red;
        font-weight: bold;
    }
</style>
<script>
function togglePasswordVisibility() {
    var passwordField = document.getElementById("password");
    var confirmPasswordField = document.getElementById("confirmPassword");
    if (passwordField.type === "password") {
        passwordField.type = "text";
        confirmPasswordField.type = "text";
    } else {
        passwordField.type = "password";
        confirmPasswordField.type = "password";
    }
}
</script>
</head>
<body>
<div class="header">
    <div class="nav-links">
        <a href="AdminMenu.jsp" style="padding-left:20px">Home</a>
    </div>
    <h2>QVY INSURANCE ONLINE</h2>
    <div class="nav-links">
        <a href="login.jsp" style="padding-right:20px">Logout</a>
    </div>
</div>
<div id="bg" style="padding:250px">
    <form method="post" action="Servlet">
        <label for="userId">Underwriter ID:</label><br>
        <input type="text" id="userId" name="userId" value="<%= request.getParameter("userId") != null ? request.getParameter("userId") : "" %>" required><br><br>
        <input type="submit" name="checkUserId" value="Search"><br><br>
        
        <% 
        Boolean userExists = (Boolean)request.getAttribute("userExists");
        if (userExists != null && userExists) { %>
            <div class="pass">
                <form method="post" action="Servlet">
                    <label for="password">Enter Password:</label><br>
                    <input type="password" id="password" name="password" value="<%= request.getAttribute("password") != null ? request.getAttribute("password") : "" %>" required><br>
                    <label for="confirmPassword">Confirm Password:</label><br>
                    <input type="password" id="confirmPassword" name="confirmPassword" value="<%= request.getAttribute("confirmPassword") != null ? request.getAttribute("confirmPassword") : "" %>" required><br><br>
                    <input type="checkbox" onclick="togglePasswordVisibility()"> Show Password<br><br>
                    <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
                    <input type="submit" name="updatePassword" value="Submit">
                </form>
            </div>
        <% } %>
        
        <% 
        String message = (String)request.getAttribute("message");
        if (message != null) { %>
            <p class="<%= message.contains("successfully") ? "success-message" : "error-message" %>"><%= message %></p>
        <% } %>
        
        <% 
        String queryMessage = request.getParameter("message");
        if (queryMessage != null && queryMessage.equals("Password updated successfully.")) { %>
            <p class="success-message"><%= queryMessage %></p>
        <% } %>
    </form>
</div>
<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
</body>
</html>