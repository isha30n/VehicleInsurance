<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%     HttpSession sessions = request.getSession(false);


	response.setHeader("Cache-Control", "no-cache,no-store,must revalidate");
	response.setHeader("Pragma", "no-cache") ; 
	response.setDateHeader("Expires", 0 ) ; 

    if (sessions == null || 
            sessions.getAttribute("user") == null || 
            sessions.getAttribute("user") == "" 
        ) {
        sessions.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body{text-align: center;
margin:0;
padding:0;}
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
<body>
<div class="header">
<%	HttpSession s=request.getSession(true);
s.setMaxInactiveInterval(10);
s.setAttribute("user","admin"); %>
		<div class="nav-links">
			<a href="AdminMenu.jsp" STYLE="padding-left:20px">Home</a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px">logout</a>
		</div>
	</div>
</body>
</html>