<!DOCTYPE html SYSTEM "http://www.thymeleaf.org/dtd/xhtml1-strict-thymeleaf-spring4-4.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Tasks</title>
<link th:href="@{/styles/styles.css}" type="text/css" rel="stylesheet" />
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


</head>
<body>
	<script th:inline="javascript">
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
		<tr th:each="t:${tasks}">
			<td th:text="${t.getJira_Number()}"></td>
			<td th:text="${t.getTask_name()}"></td>
			<td th:text="${t.getOwner()}"></td>
			<td th:text="${t.getStart_date()}"></td>
			<td th:text="${t.getEnd_date()}"></td>
			<td th:text="${t.getTask_status()}"></td>
			<td th:text=${t.getUpdate_space()}></td>
			<td><button id="myBtn" th:data-jira="${t.getJira_Number()}"
					th:data-status="${t.getTask_status()}"
					th:data-space="${t.getUpdate_space()}"
					th:data-name="${t.getTask_name()}" th:data-owner="${t.getOwner()}"
					th:data-start="${t.getStart_date()}"
					th:data-end="${t.getEnd_date()}"
					onclick="EditPopup(this.getAttribute('data-jira'),this.getAttribute('data-status'),this.getAttribute('data-space'),this.getAttribute('data-name'),this.getAttribute('data-owner'),this.getAttribute('data-start'),this.getAttribute('data-end'))">
					Edit</button></td>
		</tr>
	</table>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close" onclick="EditClose()">&times;</span>
			<form th:action="@{/save}" method="post">
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