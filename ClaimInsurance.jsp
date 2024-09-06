<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vehicle Details Form</title>
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
    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: inline-block;
        text-align: left;
    }
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
    }
    input, select {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }
    input[type="submit"] {
        background-color: #1fc3f0;
        color: white;
        border: none;
        cursor: pointer;
        width: auto;
    }
</style>
</head>
<body>
<div class="header">
    <div class="nav-links">
        <a href="UnderWriterMenu.jsp" style="padding-left: 20px;">Home</a>
    </div>
    <h2>QVY INSURANCE ONLINE</h2>
    <div class="nav-links">
        <a href="login.jsp" style="padding-right: 20px;">Logout</a>
    </div>
</div>
<div id="bg" style="padding: 100px;">
    <form action="PolicyRenewalServlet" method="post">
        <label for="vehicleType">Vehicle Type:</label>
        <select id="vehicleType" name="vehicleType" required>
            <option value="2 wheeler">2 Wheeler</option>
            <option value="4 wheeler">4 Wheeler</option>
        </select>
        
        <label for="claimedInsurance">Claimed Insurance:</label>
        <select id="claimedInsurance" name="claimedInsurance" required>
            <option value="yes">Yes</option>
            <option value="no">No</option>
        </select>
        
        <label for="vehicleState">Vehicle State:</label>
        <select id="vehicleState" name="vehicleState" required>
            <option value="new">New</option>
            <option value="old">Old</option>
        </select>
        
        <label for="vehicleValue">Vehicle Value:</label>
        <input type="text" id="vehicleValue" name="vehicleValue" required>
        
        <input type="submit" value="Submit">
    </form>

    <% String premium = (String) request.getAttribute("premium"); %>
    <% if (premium != null) { %>
        <h3>Calculated Premium: <%= premium %></h3>
    <% } %>
</div>
<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
</body>
</html>