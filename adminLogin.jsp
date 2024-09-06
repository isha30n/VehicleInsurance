<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin_login_page</title>
<style>
		body{text-align: center;}
		#bg {BACKGROUND-COLOR:#e4ebed}
		#clr{COLOR:#1fc3f0}
		.button{
			BACKGROUND-COLOR:#4caf50;
			border: none;
  			color: white;
  			padding: 15px 32px;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 12px;
  			margin: 6px 9px;
			border-radius:20px;
		}
		.input {
			margin:10px;
  			width: 30%;
  			padding: 8px;
  			border: 1px solid #ccc;
  			border-radius: 4px;
  			resize: vertical;
		}

		label {
  			padding: 12px 12px 12px 0;
  			display: inline-block;
		}
		.header{
		background-color:#1fc3f0;
		color:white;
		padding:15px 0;
		display:flex;
		align-items:center;
		justify-content:space-between;
		}
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
</style>
</head>

<body >

	<div class="header">
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-left:20px">Home</a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px">logout</a>
		</div>
	</div>
	<DIV id="bg" STYLE="padding:150px">
	
			<B style="font-size:25px">ADMIN LOGIN<BR><BR></B><br>
			<form action="adminLogin.jsp" method="post">
				<label for="username"><B>USER NAME</B></label>
				<input class="input" type="text" id="username" name="username" STYLE="MARGIN:20PX"><br>
				<label for="password"><B>PASSWORD</B></label>
				<input class="input" type="password" id="password" name="password" STYLE="MARGIN:20PX"><br>
				
				<input class="button" type="submit" value="ADMIN LOGIN">
				
				<% 
				String uname="admin";
				String pwd="admin123";
				String error=null;
				HttpSession s=request.getSession(true);
				s.setMaxInactiveInterval(10);
				s.setAttribute("user","admin");
				
				
				if("POST".equalsIgnoreCase(request.getMethod()))
					
				{
					String un=request.getParameter("username");
					String pw=request.getParameter("password");
					if(uname.equalsIgnoreCase(un) && pwd.equalsIgnoreCase(pw))
					{
						response.sendRedirect("AdminMenu.jsp");
					}
					else{
						error="Invalid Credentials.please try again";
					 }		
				}
				%>
				<div style="color:red;padding-top:10px;">
				<%
				if(error!=null) {%>
					<%= error %>
				<% }%>
				</div>
			</form>
			

		
	</DIV>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</html>