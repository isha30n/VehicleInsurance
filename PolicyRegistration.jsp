<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ page import="com.dao.policyRegisterDao"%>
<% int idd = policyRegisterDao.generateId();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
            margin: 0;
        }
       

        h1 {
            text-align: center;
            color: #333;
        }
        .FormCon {
        	display: flex;
        	justify-content: center;
        	margin-top: 10px;
        	margin-bottom: 10px;
        }

        form {
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 50%;
            
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        input[type="tel"],
        input[type="date"],
        select {
			width: calc(100% - 22px);
            padding: 10px;
            
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }
</style>
<script>
        function calculatePremium() {
            const vehicleType = document.getElementById('vehicleType').value;
            const vehicleValue = parseFloat(document.getElementById('vehicleValue').value);
            let premiumAmount = 0;

            if (vehicleType === '2Wheeler' && !isNaN(vehicleValue)) {
                premiumAmount = vehicleValue * 0.035;
            } else if (vehicleType === '4Wheeler' && !isNaN(vehicleValue)) {
                premiumAmount = vehicleValue * 0.035;
            }

            document.getElementById('premiumAmount').value = premiumAmount.toFixed(2);
        }
        
        function setToDate() {
            let fromDate = document.getElementById('fromDate').value;
            if (fromDate) {
                let fromDateObj = new Date(fromDate);
                let toDateObj = new Date(fromDateObj);
                toDateObj.setFullYear(toDateObj.getFullYear() + 1);
                let year = toDateObj.getFullYear().toString();
                let month = (toDateObj.getMonth() + 1).toString().padStart(2, '0');
                let day = toDateObj.getDate().toString().padStart(2, '0');
                //const todate = year-month-day;
                let todate = year+"-"+month+"-"+day;
                document.getElementById('toDate').value = todate;
            	
            }
        }
    </script>
</head>
<body>
<div class="header">
		<div class="nav-links">
			<a href="UnderWriterMenu.jsp" STYLE="padding-left:20px"><b>Home</b></a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="LogoutServlet" STYLE="padding-right:20px"><b>Logout</b></a>
		</div>
</div>
<% HttpSession sessions=request.getSession();
int uid=(int) sessions.getAttribute("underwriterId");
%>
<div class="FormCon">
    <form action="policyRegister" method="post">
    	<h1>Create New Policy</h1>
    	
    	<label for="policyid">Policy ID:</label>
		<input type="text" id="policyid" name="policyid" value=<%=idd %> readonly required> <br><br>
        <label for="vehicleNo">Vehicle No:</label>
        <input type="text" id="vehicleNo" name="vehicleNo" maxlength="10" required><br><br>

        <label for="vehicleType">Vehicle Type:</label>
        <select id="vehicleType" name="vehicleType" onchange="calculatePremium()" required>
            <option value="2Wheeler">2 Wheeler</option>
            <option value="4Wheeler">4 Wheeler</option>
        </select><br><br>

        <label for="vehicleValue">Vehicle Value:</label>
        <input type="number" id="vehicleValue" name="vehicleValue" oninput="calculatePremium()" required><br><br>

        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" maxlength="50" required><br><br>

        <label for="engineNo">Engine No:</label>
        <input type="number" id="engineNo" name="engineNo" required><br><br>

        <label for="chasisNo">Chasis No:</label>
        <input type="number" id="chasisNo" name="chasisNo" required><br><br>

        <label for="phoneNo">Phone No:</label>
        <input type="tel" id="phoneNo" name="phoneNo" pattern="[0-9]{10}" required><br><br>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="Full Insurance">Full Insurance</option>
            <option value="Third Party">Third Party</option>
        </select><br><br>
		<label for="fromDate">From Date:</label>
        <input type="date" id="fromDate" name="fromDate" oninput="setToDate()" required><br><br>
  
        <label for="toDate">To Date:</label>
        <input type="date" id="toDate" name="toDate"   readonly>
    

        <label for="premiumAmount">Premium Amount:</label>
        <input type="number" id="premiumAmount" name="premiumAmount" readonly required><br><br>

        <label for="underWriterId">UnderWriter Id:</label>
        <input type="text" id="underWriterId" name="underWriterId" value="<%= uid%>" required readonly ><br><br>

        <button type="submit">Create Policy</button>
    </form>
</div>
    <div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>

</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.policyRegisterDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
            margin: 0;
        }
       

        h1 {
            text-align: center;
            color: #333;
        }
        .FormCon {
        	display: flex;
        	justify-content: center;
        	margin-top: 10px;
        	margin-bottom: 10px;
        }

        form {
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 50%;
            
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        input[type="tel"],
        input[type="date"],
        select {
			width: calc(100% - 22px);
            padding: 10px;
            
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }
        
        .answer {
        	margin-top: 20px;
        }
</style>
<script>
        function calculatePremium() {
            const vehicleType = document.getElementById('vehicleType').value;
            const vehicleValue = parseFloat(document.getElementById('vehicleValue').value);
            let premiumAmount = 0;

            if (vehicleType === '2Wheeler' && !isNaN(vehicleValue)) {
                premiumAmount = vehicleValue * 0.035;
            } else if (vehicleType === '4Wheeler' && !isNaN(vehicleValue)) {
                premiumAmount = vehicleValue * 0.035;
            }

            document.getElementById('premiumAmount').value = premiumAmount.toFixed(2);
        }
    </script>
</head>
<body>
<div class="header">
		<div class="nav-links">
			<a href="UnderWriterMenu.jsp" STYLE="padding-left:20px"><b>Home</b></a>
		</div>
		<h2>QVY INSURANCE ONLINE</h2>
		<div class="nav-links">
			<a href="login.jsp" STYLE="padding-right:20px"><b>Logout</b></a>
		</div>
</div>
<% int idd = policyRegisterDao.generateId();%>

<div class="FormCon">
    <form action="policyRegister" method="post">
    	<h1>Create New Policy</h1>
    	
    	<label for="policyid">Policy ID:</label>
		<input type="text" id="policyid" name="policyid" value=<%=idd %> readonly required> <br><br>
		
        <label for="vehicleNo">Vehicle No:</label>
        <input type="text" id="vehicleNo" name="vehicleNo" maxlength="10" required><br><br>

        <label for="vehicleType">Vehicle Type:</label>
        <select id="vehicleType" name="vehicleType" onchange="calculatePremium()" required>
            <option value="2Wheeler">2 Wheeler</option>
            <option value="4Wheeler">4 Wheeler</option>
        </select><br><br>

        <label for="vehicleValue">Vehicle Value:</label>
        <input type="number" id="vehicleValue" name="vehicleValue" oninput="calculatePremium()" required><br><br>

        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" maxlength="50" required><br><br>

        <label for="engineNo">Engine No:</label>
        <input type="number" id="engineNo" name="engineNo" required><br><br>

        <label for="chasisNo">Chasis No:</label>
        <input type="number" id="chasisNo" name="chasisNo" required><br><br>

        <label for="phoneNo">Phone No:</label>
        <input type="tel" id="phoneNo" name="phoneNo" pattern="[0-9]{10}" required><br><br>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="FullInsurance">Full Insurance</option>
            <option value="ThirdParty">Third Party</option>
        </select><br><br>

        <label for="fromDate">From Date:</label>
        <input type="date" id="fromDate" name="fromDate" required><br><br>

        <label for="toDate">To Date:</label>
        <input type="date" id="toDate" name="toDate" required><br><br>

        <label for="premiumAmount">Premium Amount:</label>
        <input type="number" id="premiumAmount" name="premiumAmount" readonly required><br><br>

        <label for="underWriterId">UnderWriter Id:</label>
        <input type="text" id="underWriterId" name="underWriterId" required><br><br>

        <button type="submit">Create Policy</button>
    </form>
</div>
<div class="answer">
		<%
		String msg=null;
		if(request.getMethod().equalsIgnoreCase("post"))
		{
			msg=(String)request.getAttribute("message");
		}
		if(msg!=null){ 
		%>
		<b><%= msg %></b>
		<%} %>
</div>
    <div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>

</body>
</html> --%>