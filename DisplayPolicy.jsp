<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.beans.Policies" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		table {
			display:flex;
			justify-content:center;
			align-item:center;
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
		<h2 >QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px">logout</a>
		</div>
	</div>
	<DIV id="bg" STYLE="padding-bottom:650px ;padding-top:50px;">
	<!-- 
	<h2>Policy Details </h2>
	<p> Policy ID: ${policyId}</p>
	<p> Vehicle Details: ${vehicleNo}</p>
	<p> Expiry Date: ${ExpiryDate}</p>
	 -->
       <form action="RenewPolicy" method="post">
       	<input type="hidden" name="policyid" value="${policyId}">
       	<%
            Policies policy = (Policies) request.getAttribute("policy");
            if (policy != null) {
        %>
        <div Style="margin-left:100px">
            <h2>Policy Details</h2>
            <table style=" margin-left: auto;margin-right: auto;">
                <tr>
                    <th>Policy ID</th>
                    <td><%= policy.getPolicyNo() %></td>
                </tr>
                <tr>
                    <th>Vehicle No</th>
                    <td><%= policy.getVehicleNo() %></td>
                </tr>
                <tr>
                    <th>Vehicle Type</th>
                    <td><%= policy.getVehicleType() %></td>
                </tr>
                <tr>
                    <th>Customer Name</th>
                    <td><%= policy.getCustomerName() %></td>
                </tr>
                <tr>
                    <th>Engine No</th>
                    <td><%= policy.getEngineNo() %></td>
                </tr>
                <tr>
                    <th>Chasis No</th>
                    <td><%= policy.getChasisNo() %></td>
                </tr>
                <tr>
                    <th>Phone No</th>
                    <td><%= policy.getPnhNo() %></td>
                </tr>
                <tr>
                    <th>Type Of Insurance</th>
                    <td><%= policy.getTypeOfInsurance() %></td>
                </tr>
                <tr>
                    <th>Premium Amount</th>
                    <td><%= policy.getPremiumAmnt() %></td>
                </tr>
                <tr>
                    <th>From Date</th>
                    <td><%= policy.getFromDate() %></td>
                </tr>
                <tr>
                    <th>To Date</th>
                    <td><%= policy.getToDate() %></td>
                </tr>
                <tr>
                    <th>Underwriter ID</th>
                    <td> <%= policy.getUnderWriterId() %></td>
                </tr> 
            </table>
            

            
            </div>
            
       </form> 
       <form action="ClaimInsurance.jsp">
       	
       		<input type="submit" name="submit" value="Renew">
       			</form>
       <% } %>
       	
       </DIV>
	<div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
	</body>
</body>
</html>