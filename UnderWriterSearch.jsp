<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>template</title>
<style>
		#bg {BACKGROUND-COLOR:#e4ebed}
		#clr{COLOR:#1fc3f0}
		.header{
		background-color:#1fc3f0;
		color:white;
		padding:15px 0;
		display:flex;
		align-items:center;
		justify-content:space-between;
		position: sticky;
		top:0;
		
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
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            justify-content: center;
            align-items: center;
 
            margin: 0;
        }
        .container {
             max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }
        input[type="text"] {
            padding: 10px;
            margin: 10px 0;
            width: 30%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .answer {
        	margin-top: 20px;
        }
        table {
			text-align:center;
            width: 100%;
            max-width: 600px;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        
        th {
            background-color: #f4f4f4;
        }
</style>

</head>
<body >
	<div class="header">
		<div class="nav-links">
			<a href="AdminMenu.jsp" STYLE="padding-left:20px"><b>Home</b></a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px"><b>Logout</b></a>
		</div>
	</div>
	<div id="bg" STYLE="padding:190px">
	<div class="container">
		<h2>Search UnderWriter</h2>
        <form  action="searchServlet" method="post">
            <input type="text" id="underwriterId" name="underwriterId" placeholder="Enter UnderWriter ID" required>
            <br>
            <button type="submit">Search UnderWriter</button>
        </form>
        
 	</div>
 	<div class="answer">
 	<% String error=(String)request.getAttribute("error");
 	if( error==null && request.getMethod().equalsIgnoreCase("post")) {%>
 				<div >
			<table STYLE=" margin-left: auto;margin-right: auto;">
			 <tr>
                   <th>UnderWriter Id :</th>
					<td><%= (String) request.getAttribute("id") %></td>
			</tr>
			<tr>
                    <th>Name :</th>
                    <td><%= (String)  request.getAttribute("name")%></td>
              </tr>
			<tr>
                    <th>DOB :</th>
                    <td><%= (String) request.getAttribute("dob")%></td>
                </tr>
				<tr>
                    <th>Joining Date :</th>
                    <td><%= (String) request.getAttribute("join")%></td>
                </tr>

				</table>
				</div>

	<% }else if(error!=null && request.getMethod().equalsIgnoreCase("post")) {%>
	<b><%=error %></b>
	<%} %>
 	</div>
 	</div>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</html>