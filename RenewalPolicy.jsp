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
        .h2 {
            color: #333;
        }
       
		.header{
		background-color:#1fc3f0;
		color:white;
		padding:20px 0;
		position: sticky;
        top: 0;
		margin:0;
		display:flex;
		align-items:center;
		justify-content:space-between;
		}
		
	</style>

</head>
<body >
<div >
	<div class="header">
		<div class="nav-links">
			<a href="UnderWriterMenu.jsp" STYLE="padding-left:20px">Home</a>
		</div>
		<h2 >QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px">logout</a>
		</div>
	</div>
		<div class="menu" style="padding-bottom:200px;">
        <h2 style="padding-bottom:30px; padding-top:50px;">Manage Vehicle Insurance</h2>
    
		<form action="" method="post" style="display:flex; justify-content:center; align-items:center; padding-bottom:103px; ">
		
       	<div>
       
			<h3>Enter Policy id: </h3> 
			<input type="text" name="pid">
       	<br><br>
			<input type="submit">
		<% String error =(String) request.getAttribute("error");
		if(error!=null){%>
		<p Style="color:red;"><%=error %></p>
		<%} %>
		
		</div>	
        </form>
        </div>
		</div>
        
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</html>
