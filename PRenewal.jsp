<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Policy</title>
 <style>
		body{text-align: center;}
		#bg {BACKGROUND-COLOR:#e4ebed}
		#clr{COLOR:#1fc3f0}
		.header h2{
		margin:0;
		font-size:20px;
		
		}
		#footer{
		background-color:#1fc3f0;
		padding:10px 0;
		font-size:13px;
		}
		.nav-links{
		display:flex;
		gap:30px;
		}
		.nav-links a{
		color:white;
		text-decoration:none;
		
		}
        .menu {
            margin: 1px;
           
        }
        .menu h2 {
            color: #333;
        }
        .menu tr {
            list-style-type: none;
            padding: 0;
        }
        .menu tr td {
            margin: 1px 0;
        }
        .menu a {
            text-decoration: none;
            color: #007BFF;
        }
        .menu a:hover {
            text-decoration: underline;
        }
        .role-switch {
            margin: 10px 0;
            }
        
		.header{
		background-color:#1fc3f0;
		color:white;
		padding:15px 0;
		display:flex;
		align-items:center;
		justify-content:space-between;
		}
		
	</style>
</head>
<body>
<div class="header">
		<div class="nav-links">
			<a href="UnderWriterMenu.jsp" STYLE="padding-left:20px"><b>Home</b></a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="LogoutServlet" STYLE="padding-right:20px"><b>Logout</b></a>
		</div>
</div>

<div id="bg" style="padding: 205px;">
    <form action="RenewPolicyServlet2" method="post">
        <label for="policyId">Policy ID:</label><br>
        <input type="text" id="policyId" name="policyId" required><br><br>

        <label for="premiumAmount">New Premium Amount:</label><br>
        <input type="text" id="premiumAmount" name="premiumAmount" required><br><br>

        <input type="submit" value="Update Policy">
    </form>

    <br><br>
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
            out.print("<p style='color: red;'>" + message + "</p>");
        }
    %>
</div>

<div id="footer">&#169; QVY INSURANCE ONLINE</div>
</body>
</html>

