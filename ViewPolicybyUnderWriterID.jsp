<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Underwriter</title>
<style>
    body {text-align: center;}
    #bg {background-color: #e4ebed;}
    #clr {color: #1fc3f0;}
    .header {
        background-color: #1fc3f0;
        color: white;
        padding: 15px 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .header h2 {
        margin: 0;
        font-size: 20px;
    }
    #footer {
        background-color: #1fc3f0;
        padding: 10px 0;
        font-size: 13px;
    }
    .nav-links {
        display: flex;
        gap: 30px;
    }
    .nav-links a {
        color: white;
        text-decoration: none;
    }
</style>
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
<div id="bg" style="padding:260px">
    <form action="ViewPolicybyUnderWriterServlet" method="post">
        <label for="userId">Underwriter ID:</label><br>
        <input type="text" id="userId" name="userId" required><br><br>
        <input type="submit" value="Search">
    </form>
    <div id="result">
        <%
            String result = request.getAttribute("result") != null ? (String) request.getAttribute("result") : "";
            out.print(result);
        %>
    </div>
</div>
<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
</body>
</html>

