<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp" %>
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
        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        select {
            width: 50%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 10px 0;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function performAction() {
            const action = document.getElementById("action").value;
            if(action == "Search Underwriter by Id")
            {
            	window.location.href = 'UnderWriterSearch.jsp';
            }
            else if(action == "UnderWriter Registration")
            {
            	window.location.href = 'UnderWriterRegistration.jsp';
            }
            else if(action == "Update Underwriter Password")
            {
            	window.location.href = 'UpdateUnderWriterPwd.jsp';
            }
            else if(action == "Delete UnderWriter by Id")
            {
            	window.location.href = 'DeleteUnderWriter.jsp';
            }
            else if(action == "View All UnderWriter")
            {
            	window.location.href = "ViewAllUnderwriter.jsp";
            }
            else if(action == "View All Vehicle specific to UnderWriter id")
            {
            	window.location.href = 'ViewPolicybyUnderWriterID.jsp';
            }
            else{
            	alert("Choose some other options");
            }
        }

        function logOut() {
            window.location.href = 'login.jsp'; 
        }
    </script>
</head>
<body>

 <div  id="bg" STYLE="padding: 200px">
 <div class="container">
        <h1>Admin Dashboard</h1>
        <label for="action" >Select Action</label>
        <select id="action" >
            <option value="UnderWriter Registration">UnderWriter Registration</option>
            <option value="Search Underwriter by Id">Search Underwriter by Id</option>
            <option value="Update Underwriter Password">Update Underwriter Password</option>
            <option value="Delete UnderWriter by Id">Delete UnderWriter by Id</option>
            <option value="View All UnderWriter">View All UnderWriter</option>
            <option value="View All Vehicle specific to UnderWriter id">View All Vehicle specific to UnderWriter id</option>
        </select>
        <button onclick="performAction()">Perform Action</button>
        </div>
    </div>
    <div id="footer">&#169; QVY INSURANCE ONLINE 2024</div>
</body>
</html>