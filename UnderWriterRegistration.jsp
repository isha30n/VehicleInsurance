<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.UnderWriterDAO"%>
<!DOCTYPE html>
<html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Underwriter Registration</title>
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
			background-color:#1fc3f0;
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
			padding: 100px 20px 20px 20px;
			flex: 1;
			display: flex;
			flex-direction: column;
			align-items: center;
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
			width: 80px;
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
		
		#footer {
			background-color: #1fc3f0;
			padding: 10px 0;
			font-size: 13px;
			position: fixed;
			bottom: 0;
			width: 100%;
			z-index: 1;
			text-align: center;
		}
		
		h1 {
			color: #1fc3f0;
			text-align: center;
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
	<% int idd= UnderWriterDAO.generateId();%>
	<div id="bg">
		<h1><b>UNDERWRITER REGISTRATION</b></h1><br>
		<form action="UnderwriterServlet" method="post">
			<div class="form-group">
				<label for="id">Underwriter ID:</label>
				 <%=idd %>
				
			</div>
			<br>
			<div class="form-group">
				<label for="name">Underwriter Name:</label><br>
				<input type="text" id="name" name="name" required>
				
			</div>
			<br>
			<div class="form-group">
				<label for="dob">Date of Birth:</label><br>
				<input type="date" id="dob" name="dob" required max='2024-08-07'>
			</div>
			<br>
			<div class="form-group">
				<label for="doj">Date of Joining:</label><br>
				<input type="date" id="doj" name="doj" required min='2024-08-07'>
			</div>
			<br>
			<div class="form-group">
				<label for="password">Default Password:  </label>Password@123
				
			</div>
			<input type="submit" value="Register">
			
		</form>
		<%
		String msg=null;
		if(request.getMethod().equalsIgnoreCase("post"))
		{
			msg=(String)request.getAttribute("message");
		}
		if(msg!=null){ 
		%>
		<%= msg %>
		<%} %>
	</div>
	<div id="footer">
		Copyright &copy; 2022 QVY Insurance Online
	</div>
</body>
</html>