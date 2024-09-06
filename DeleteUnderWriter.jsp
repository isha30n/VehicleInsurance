<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>template</title>
<style>
		body{text-align: center;}
		#bg {BACKGROUND-COLOR:#e4ebed}
		#clr{COLOR:#1fc3f0}
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
		input{
		margin:10px;
		witdh:30px;
		padding:8px;
		border:1px solid #ccc;
		border-radius=4px;
		resize:vertical;}
	</style>

</head>
<body >
	<div class="header">
		<div class="nav-links">
			<a href="AdminMenu.jsp" STYLE="padding-left:20px">Home</a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px">logout</a>
		</div>
	</div>
	
	<DIV id="bg" STYLE="padding:230px">
	
<form action="DelteServlet" method="post">
  <label for="ID">Enter ID:</label><br>
  <input type="text" id="ID" name="ID"><br>
  <label for="Search">Search:</label><br>
  <input type="submit" id="Search" name="Search">
  <%String error=(String)request.getAttribute("Message");
  if(error!=null){%>
  <div style="colour:red;padding-top:10px;">
  <%=error %>
  </div>
  <%} %>
</form>
	</DIV>
	
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</html>