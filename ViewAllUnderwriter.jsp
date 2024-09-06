<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ViewUnderWriters</title>
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
	<form action="ViewAllUnderWriterServlet" method="post">
				
			<input class="button" type="submit" value="View All Underwriters">
		</form>
			<% String tableHtml=(String) request.getAttribute("tableHTML");
			//System.out.println(tableHtml);
			if(tableHtml!=null)
				out.print(tableHtml);
			
			%>
		
	</DIV>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</html>