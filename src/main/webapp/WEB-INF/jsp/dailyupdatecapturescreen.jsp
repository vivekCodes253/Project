<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Scrum Master</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
   <link href="css/updatetasksmodal.css" rel="stylesheet">
   <link rel = "stylesheet" href = "css/style.css">
 
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
			
			this.innerHTML = "Updated";
		}

		
		function EditClose() {
			var modal = document.getElementById("myModal");
			modal.style.display = "none";
		}

		

		function setSize(container){
			var theContainer = document.getElementById(container);

			var container_all = document.getElementById("all_tasks_container");
			var container_nearing = document.getElementById("nearing_tasks_container");
			var container_today = document.getElementById("today_tasks_container");
			
			container_all.classList.remove("col-xl-6", "col-sm-6","mb-6");
			container_all.classList.add("col-xl-3","col-sm-3","mb-3");
			container_nearing.classList.remove("col-xl-6","col-sm-6","mb-6");
			container_nearing.classList.add("col-xl-3","col-sm-3","mb-3");
			container_today.classList.remove("col-xl-6","col-sm-6","mb-6");
			container_today.classList.add("col-xl-3","col-sm-3","mb-3");
			
			theContainer.classList.add("col-xl-6","col-sm-6","mb-6");
			theContainer.classList.remove("col-xl-3","col-sm-3","mb-3");
			
		
		}

		function nearingTasksx(countOfNearingTasks){
			var elmtTable = document.getElementById('dataTable');
			var tableRows = elmtTable.getElementsByTagName('tr');
			var rowCount = tableRows.length;
			for (var x=1; x<rowCount; x++) {
			
			   	elmtTable.rows[x].style.visibility = 'hidden'
			}
			
			setSize("nearing_tasks_container")
			
			
		}

		function resetView(){
			var elmtTable = document.getElementById('dataTable');
			var tableRows = elmtTable.getElementsByTagName('tr');
			var rowCount = tableRows.length;
			for (var x=1; x<rowCount; x++) {
			
			   	elmtTable.rows[x].style.display = ''
			}
		}
		
		function nearingTasks(countOfNearingTasks){
			resetView();
			var elmtTable = document.getElementById('dataTable');
			var tableRows = elmtTable.getElementsByTagName('tr');
			var rowCount = tableRows.length;
			for (var x=1+countOfNearingTasks; x<rowCount; x++) {
				elmtTable.rows[x].style.display = 'none'
			}
		
			
			
		}

	

		function allTasks(){
			resetView();
		}
		
		
</script>
<style>
label{
margin-top:3%;margin-bottom:1%}
table{
transform:scale(0.92,0.92);
z-index:1;
table-layout:fixed;
font-size: 130%;

}
tr:not(:first-child){
	fint-weight:initial;
	transition: 0.2s;
 transform:scale(1,1);
 padding:10px;
 filter:alpha(opacity=30);
}

tr:not(:first-child):hover{
height:120%;
padding-top:10%;
padding-bottom:10%;
transform: scale(1.1,1.1);
z-index: 3;
font-weight:bold;
background-color: #bbbbbb;
filter:alpha(opacity=100);


}
 button
 {border-radius: 150%;
 	font-weight:bold;

 }
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

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html"><img style="width: 15%; height: auto"alt="" src="/logos/scrumlogo2.png"></a>

    

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
        <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <form id="dashBoardForm" action="/" method="post">
          <input type="hidden" name="type" value="dashboard" />
          <a class="nav-link" href="#" onclick="document.getElementById('dashBoardForm').submit();">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>

        </form>
      </li>
      <li class="nav-item">
        <form id="editForm" action="/" method="post">
          <input type="hidden" name="type" value="editpage" />
          <a class="nav-link" href="#" onclick="document.getElementById('editForm').submit();">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Edit Pages</span>
          </a>
        </form>
      
       <li class="nav-item">
        <form id="taskForm" action="/" method="post">
          <input type="hidden" name="type" value="addtasks" />
          <a class="nav-link" href="#" onclick="document.getElementById('taskForm').submit();">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>-Add Task</span>
          </a>
        </form>
      </li>
       <li class="nav-item">
        <form id="memberForm" action="/" method="post">
          <input type="hidden" name="type" value="editpage" />
          <a class="nav-link" href="#" onclick="document.getElementById('memberForm').submit();">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>-Add Member</span>
          </a>
        </form>
      </li>
      </li>
       <li class="nav-item">
        <form id="modifyForm" action="/" method="post">
          <input type="hidden" name="type" value="modify" />
          <a class="nav-link" href="#" onclick="document.getElementById('modifyForm').submit();">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>-Modify Task Owner</span>
          </a>
        </form>
      </li>
       <br><br><hr><br>
       <li class="nav-item">
        <form id="logoutForm" action="/" method="post">
          <input type="hidden" name="type" value="logout" />
          <a class="nav-link" href="#" onclick="document.getElementById('logoutForm').submit();">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>-Logout</span>
          </a>
        </form>
      </li>
    </ul>


    <div id="content-wrapper">

      <div class="container-fluid">
			
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
        
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
          <li class="float-right"  style="margin-left:60%;">
          	<div class="btn-group-justified float-right " style="font-weight:bold;text-align: right;transform:scale(0.7,0.7)">

          
          <button onclick="allTasks()" id = "all_tasks_container" class="font-weight-bold btn btn-outline-dark" selected>
            
                ALL TASKS (${taskcount})
          </button>
           <button onclick="nearingTasks(${todaytaskcount})"" id = "today_tasks_container" class="font-weight-bold btn btn-outline-dark">
               DUE TODAY (${todaytaskcount})
          </button>
          
          <button onclick="nearingTasks(${deadlinetaskcount})" id = "nearing_tasks_container" class=" font-weight-bold btn btn-outline-dark">
               DUE SOON (${deadlinetaskcount})
             
            
          </button>
          
           
          
         
         
         
          
        </div>
          	
          </li>
        </ol>
               
               

        <!-- Icon Cards-->
        
         

        
        <!-- DataTables Example -->
        <div class="card mb-3" >
          
            
            
          <div class="card-body">
            <div class="table-responsive">
            <table class="table table-bordered" style="border:1px solid blue;"name="dataTable"id="dataTable" width="100%" cellspacing="0">
		   <tr>
			
			<th>Owner</th>
			<th>JIRA Number</th>
			<th>Task Name</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Task Status</th>
			<th>Update Space&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>Make Changes</th>
		</tr>
		<c:forEach var="t" items="${tasks}" varStatus = "status">
			<tr class="">
				
				<td>${members[status.index]} (${t.owner})</td>
				<td>${t.jira_Number}</td>
				<td>${t.task_name}</td>
				<td>${t.start_date}</td>
				<td>${t.end_date}</td>
				<td>${t.task_status}</td>
				<td >${t.update_space}</td>
				<td><button class="btn btn-link"id="myBtn" onclick="EditPopup('${t.jira_Number}','${t.task_status}','${t.update_space}','${t.task_name}','${t.owner}','${t.start_date}','${t.end_date}')">Edit</button></td>
			</tr>
		</c:forEach>
	</table>
	 <form action="/" method="POST">
	 <input type="hidden" name="type" value="showEmployee" />
	 	<input type="submit" class="btn btn-danger" value="Conclude session">
	 </form>
	</div>
	</div>
	</div>

	
	<div  id="myModal" class="modal" >

		<!-- Modal content -->
		
			

	  <div id="formContent" call="modal-content" style="margin-left:40%;margin-top:0%">
	  <span class="close" onclick="EditClose()">&times;</span>
    <form action="/save" method = "POST" class="registerForm">
    <h1 style="font-size:220%">Update</h1><hr>
    <label>Jira Number : </label>
      <input type="text" id="jira_Number" class="fadeIn second" name="jira_Number" placeholder="Jira number" readonly>
      
     <label>Task owner : </label>
      <input type="text" id="owner" class="fadeIn third" name="owner" placeholder="Jira Owner" readonly>
      
      
      <label>Task end date : </label>
      <input type = "date" id = "end_date" class = "fadeIn fifth" name ="end_date" placeholder = "Ending Date" style="background-color:white">
      <label>Task Status :</label>
      <div>
  <select id = "task_status" name="task_status" class = "fadeIn sixth custom-select" style="width:390px; text-align:center">
  <option id="task_Status" value="" selected hidden></option>
        <option value = "Requirement Analysis">Requirement Analysis</option>
        <option value = "Feasibility study">Feasibility study</option>
        <option value = "Development">Development</option>
        <option value = "Unit Testing">Unit Testing</option>
        <option value = "Integration Testing">Integration Testing</option>
        <option value = "UAT Testing Coordination">UAT Testing Coordination</option>
        <option value="Deployment Activity">Deployment Activity</option>
        <option value="Post Release Activity">Post Release Activity</option>
  </select>
</div>

	<label>Updates and Comments : </label><br>
	<div class="container-fluid">
      <textarea  rows ="3"  id = "update_space" class = "form-control fadeIn fourth" name ="update_space" placeholder = "UpdateSpace" style="background-color:white;">
      </textarea>
      </div><br>
      <input type="submit" class="fadeIn seventh " value="Submit">
    </form>
  </div>
	
	
	
            
            	
           	
          </div>
       
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
     

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

 
  
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type = "text/javascript" src = "js/try.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>

</body>

</html>
