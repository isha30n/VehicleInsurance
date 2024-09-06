<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="ISO-8859-1">
<title>UWMenu</title>
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
<body >
<div >
	<div class="header">
		<div class="nav-links">
			<a href="UnderWriterMenu.jsp" STYLE="padding-left:20px">Home</a>
		</div>
		<h2 >QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="LogoutServlet" STYLE="padding-right:20px">logout</a>
		</div>
	</div>
		<div class="menu" >
        <h2 style="padding-bottom:20px; padding-top:20px;">Manage Vehicle Insurance</h2>
    
		<form action="" style="display:flex; justify-content:center; align-items:center; padding-bottom:103px; ">
		
        <table>
            <tr><td><a href="PolicyRegistration.jsp">Create a new Vehicle Insurance</a></tr>
            <tr><td><a href="PRenewal.jsp">Renewal of a Policy</a></tr>
            <tr><td><a href="PolicyUpdate.jsp">Changing of a Policy</a></td></tr>
            <tr><td><a href="ViewPolicy.jsp">View Policy</a></td></tr>
        </table>
		</form>
		<div class="role-switch" style="padding-bottom:220px;">
            <form action="roleChangeServlet" method="post">
                <label for="roles">Switch Role:</label>
                <select name="role" id="roles">
                    <option value="underwriter">UnderWriter Role</option>
                    <option value="Admin">Admin Role</option>
                    
                </select>
                <input type="submit" value="Switch Role">
            </form>
      	  </div>
			</div> 
    	</div>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</html>