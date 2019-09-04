<!DOCTYPE html SYSTEM "http://www.thymeleaf.org/dtd/xhtml1-strict-thymeleaf-spring4-4.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta charset="ISO-8859-1">
<title>Tasks</title>
<link href="css/styles.css" type="text/css" rel="stylesheet" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
-->

</head>
<body>
	<script>
		function EditPopup(jira_number, task_status, update_space, name, owner,
				start, end) {
			document.getElementById("task_Status").textContent = task_status;
			document.getElementById("task_Status").value = task_status;
			document.getElementById("jira_Number").value = jira_number;
			//document.getElementById("task_name").value	 = name;
			document.getElementById("owner").value = owner;
			//document.getElementById("start_date").value	 = start;
			document.getElementById("end_date").value	 = end;
			document.getElementById("update_space").value = update_space;

			var modal = document.getElementById("myModal");
			modal.style.display = "block";
		}

		
		function EditClose() {
			var modal = document.getElementById("myModal");
			modal.style.display = "none";
		}
		// When the user clicks anywhere outside of the modal, close it
	</script>
	<h2>Daily Update Capture Screen task</h2>
	<p>
		<a href="/">Home</a>
	</p>
	<table>
		<tr>
			<th>JIRA Number</th>
			<th>Task Name</th>
			<th>Owner</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Task Status</th>
			<th>Update Space</th>
			<th>Make Changes</th>
		</tr>
		<c:forEach var="t" items="${tasks}">
			<tr >
				<td>${t.jira_Number}</td>
				<td>${t.task_name}</td>
				<td>${t.owner}</td>
				<td>${t.start_date}</td>
				<td>${t.end_date}</td>
				<td>${t.task_status}</td>
				<td>${t.update_space}</td>
				<td><button id="myBtn" onclick="EditPopup('${t.jira_Number}','${t.task_status}','${t.update_space}','${t.task_name}','${t.owner}','${t.start_date}','${t.end_date}')">Edit</button></td>
			</tr>
		</c:forEach>
	</table>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close" onclick="EditClose()">&times;</span>
			<form action="/save" method="post">
				<center>
					<h3>Update Record</h3>
				</center>
				<p>JIRA Number:</p>
				<input type="text" id="jira_Number" name="jira_Number"
					readonly /><br />
				<p>Owner</p>
				 <input type="text" id="owner" name="owner" readonly /><br />
				<p>End Date</p>
				<input type="date" id="end_date" name="end_date"
					 /><br />
				<p>Task Status</p>
				<select id="task_status" name="task_status">
					<option id="task_Status" value="" selected hidden></option>
					<option value="Requirement Analysis">Requirement Analysis</option>
					<option value="Feasibility study">Feasiblity study</option>
					<option value="Development">Development</option>
					<option value="Unit Testing">Unit Testing</option>
					<option value="Integration Testing">Integration Testing</option>
					<option value="UAT Testing Coordination">UAT Testing
						Coordination</option>
					<option value="Deployment Activity">Deployment Activity</option>
					<option value="Post Release Activity">Post Release
						Activity</option>
				</select><br />
				<p>Update Space</p>
				<input type="text" id="update_space" name="update_space" /><br />
				<br /><input type="submit" value="Save" />
			</form>
		</div>

	</div>


	</form>
</body>
</html>