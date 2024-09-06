<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login_page</title>
<style>
body {
	text-align: center;
	background-image: url("images.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}


#clr {
	COLOR: #1fc3f0
}

button {
	BACKGROUND-COLOR: #4caf50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 6px 9px;
	border-radius: 15px;
}

#header {
	background-color: #1fc3f0;
	color: white;
	padding: 15px 0;
	font-size: 20px;
	postion: sticky;
	top: 0%;
}

#footer {
	background-color: #1fc3f0;
	padding: 10px 0;
	font-size: 13px;
}
</style>
</head>
<body>
	<div id="header">QVY INSURANCE ONLINE</div>
	<DIV id="bg" STYLE="padding-bottom: 230px">


		<B style="font-size: 25px">LOGIN<BR>
		<BR></B><br> <a href="adminLogin.jsp"><button
				style="margin-left: 20px" type="button">
				<B>ADMIN LOGIN</B>
			</button></a> <a href="UnderwriterLogin.jsp"><button style="margin-left: 20px"
				type="button">
				<B>UNDERWRITER</B>
			</button></a>
	</DIV>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
</body>
</html>