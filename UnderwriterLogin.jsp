<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>underwriter_login_page</title>
<style>
		body{text-align: center;}
		#bg {BACKGROUND-COLOR:#e4ebed}
		#clr{COLOR:#1fc3f0}
		.button{
			BACKGROUND-COLOR:#4caf50;
			border: none;
  			color: white;
  			padding: 12px 25px;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 16px;
  			margin: 6px 9px;
			border-radius:10px;
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
	<DIV id="bg" STYLE="padding:160px">
			<B  style="font-size:25px">UNDERWRITER LOGIN<BR><BR></B><br>
			<form action="underwriterLoginServlet" method="post">
				<label for="userid" STYLE="padding-right:30PX;"><B>USER ID</B></label>
				<input class="input" type="text" id="userid" name="userid" STYLE="MARGIN:20PX;" required><br>
				<label for="password"><B>PASSWORD</B></label>
				<input class="input" type="password" id="password" name="password" STYLE="MARGIN:20PX" required><br>
				<input class="button" type="submit" value="LOGIN">
				<% String error= (String)request.getAttribute("message");
				if(error!=null){
				%>
				<div style="color:red;padding-top:10px;">
				<%=error %>
				</div>
				<%} %>
			</form>
			
		
	</DIV>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</html>