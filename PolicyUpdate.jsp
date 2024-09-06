<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="com.beans.Policies" %>
<head>
    <meta charset="UTF-8">
    <title>Search Policy</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
        }
        
        .header {
            background-color: #1fc3f0;
            color: white;
            padding: 15px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1;
        }
        
        .header h2 {
            margin: 0;
            font-size: 20px;
        }
        
        .nav-links {
            display: flex;
            gap: 30px;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
        }
        
        #bg {
            padding: 100px 20px 100px 20px; 
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: auto; 
        }
        
        #bg form {
            width: 100%;
            max-width: 600px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .form-group {
            display: flex;
            width: 100%;
            margin-bottom: 20px;
        }
        
        .form-group label {
            width: 150px;
            text-align: right;
            margin-right: 50px;
        }
        
        .form-group input {
            width: 350px;
            height: 25px;
        }
        
        #bg input[type="submit"] {
            width: 100px;
            height: 30px;
            margin-top: 20px;
            background-color: #1fc3f0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        #bg input[type="submit"]:hover {
            background-color: #0d93f2;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .btn {
            width: 150px;
            height: 40px;
            background-color: #1fc3f0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .btn:hover {
            background-color: #0d93f2;
        }
        
        #footer {
            background-color: #1fc3f0;
            padding: 10px 0;
            font-size: 13px;
            /* position: fixed; */
            /*bottom: 0; */
            width: 100%;
        
            text-align: center;
        }
        
        h1 {
            color: #1fc3f0;
            text-align: center;
        }

        table {
            width: 100%;
            max-width: 600px;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="nav-links">
            <a href="UnderWriterMenu.jsp" style="padding-left:20px">Home</a>
        </div>
        <h2>QVY INSURANCE ONLINE</h2>
        <div class="nav-links">
            <a href="LogoutServlet" style="padding-right:20px">Logout</a>
        </div>
    </div>
    
    <div id="bg">
        <h1>Search for Policy</h1>
        <form action="SearchPolicyServlet" method="post">
            <div class="form-group">
                <label for="policyId">Policy ID:</label>
                <input type="text" id="policyId" name="policyId" required>
            </div>
            <input type="submit" value="Search">
        </form>
        
        <%
            Policies policy = (Policies) request.getAttribute("policy");
            if (policy != null) {
        %>
            <h2>Policy Details</h2>
            <table>
                <tr>
                    <th>Policy ID</th>
                    <td><%= policy.getPolicyNo() %></td>
                </tr>
                <tr>
                    <th>Vehicle No</th>
                    <td><%= policy.getVehicleNo() %></td>
                </tr>
                <tr>
                    <th>Vehicle Type</th>
                    <td><%= policy.getVehicleType() %></td>
                </tr>
                <tr>
                    <th>Customer Name</th>
                    <td><%= policy.getCustomerName() %></td>
                </tr>
                <tr>
                    <th>Engine No</th>
                    <td><%= policy.getEngineNo() %></td>
                </tr>
                <tr>
                    <th>Chasis No</th>
                    <td><%= policy.getChasisNo() %></td>
                </tr>
                <tr>
                    <th>Phone No</th>
                    <td><%= policy.getPnhNo() %></td>
                </tr>
                <tr>
                    <th>Type Of Insurance</th>
                    <td><%= policy.getTypeOfInsurance() %></td>
                </tr>
                <tr>
                    <th>Premium Amount</th>
                    <td><%= policy.getPremiumAmnt() %></td>
                </tr>
                <tr>
                    <th>From Date</th>
                    <td><%= policy.getFromDate() %></td>
                </tr>
                <tr>
                    <th>To Date</th>
                    <td><%= policy.getToDate() %></td>
                </tr>
                <tr>
                    <th>Underwriter ID</th>
                    <td><%= policy.getUnderWriterId() %></td>
                </tr>
            </table>
            
            <div class="btn-group">
                <form action="UpdatePolicyServlet" method="post">
                    <input type="hidden" name="policyId" value="<%= policy.getPolicyNo() %>">
                    <input type="submit" class="btn" value="Update Policy">
                </form>
                
                <form action="CancelPolicyServlet" method="post">
                    <input type="submit" class="btn" value="Cancel">
                </form>
            </div>
            
        <%
            } else if (request.getAttribute("error") != null) {
            	
        %>
            <p><%= request.getAttribute("error") %></p>
        <%
            } else if (request.getAttribute("success") != null) {
        %>
            <p><%= request.getAttribute("success") %></p>
        <%
            }
        %>
        <%
            if (policy != null) {
            	if (request.getAttribute("errorUpdate") != null){
        %>

            <p><%= request.getAttribute("errorUpdate") %></p>
        <%
                } else if (request.getAttribute("successUpdate") != null) {
            %>
                <p><%= request.getAttribute("successUpdate") %></p>
            <%
                }
            %>
        <% } %>
        
    </div>
    
    <div id="footer">
        Copyright &copy; 2022 QVY Insurance Online
    </div>
</body>
</html>
