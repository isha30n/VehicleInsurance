<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view_policy</title>
<style>
		body{text-align: center;}
		#bg {BACKGROUND-COLOR:#e4ebed}
		#clr{COLOR:#1fc3f0}
		.button{
			BACKGROUND-COLOR:#4caf50;
			border: none;
  			color: white;
  			padding: 10px 25px;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 18px;
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
		input {
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
<body>
<div class="header">
		<div class="nav-links">
			<a href="UnderWriterMenu.jsp" STYLE="padding-left:20px">Home</a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px">logout</a>
		</div>
	</div>
	<DIV id="bg" STYLE="padding:215px">
			<form action="policyViewServlet" method="post">
				<label for="policyid"><B>Policy ID</B></label>
				<input type="text" name="policyid" ><br><br>
				<input type="submit" value="submit" class="button" >
			</form><br><br>
			<% String error= (String)request.getAttribute("present");
			if(error==null && request.getMethod().equalsIgnoreCase("Post")){ %>
			<div >
			<table STYLE=" margin-left: auto;margin-right: auto;">
			 <tr>
                   <th>Policy ID</th>
					<td><%= (String) request.getAttribute("policyId") %></td>
			</tr>
			<tr>
                    <th>Vehicle No</th>
                    <td><%= (String) request.getAttribute("VehicleNo")%></td>
              </tr>
			<tr>
                    <th>Vehicle Type</th>
                    <td><%= (String) request.getAttribute("VehicleType")%></td>
                </tr>
				<tr>
                    <th>Customer Name</th>
                    <td><%= (String) request.getAttribute("CustomerName")%></td>
                </tr>
				<tr>
                    <th>Engine No</th>
                    <td><%= (String) request.getAttribute("EngineNo")%></td>
                </tr>
                <tr>
                    <th>Phone No</th>
                    <td><%= (String) request.getAttribute("PhoneNo")%></td>
                </tr>
				<tr>
                    <th>Type Of Insurance</th>
                    <td><%= (String) request.getAttribute("TypeOfInsurance")%></td>
                </tr>
				 <tr>
                    <th>Premium Amount</th>
                    <td><%= (String) request.getAttribute("PremiumAmnt")%></td>
                </tr>
				 <tr>
                    <th>From Date</th>
                    <td><%= (String) request.getAttribute("FromDate")%></td>
                </tr>
				<tr>
                    <th>To Date</th>
                    <td><%= (String) request.getAttribute("ToDate")%></td>
                </tr>
				<tr>
                    <th>Underwriter ID</th>
                    <td><%= (String) request.getAttribute("underWriterId")%></td>
                </tr>
				</table>
				</div>
				<% }else if(request.getMethod().equalsIgnoreCase("Post")){ %>
				<%= error %>
				<%} %>
	</DIV>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
</body>
</html>