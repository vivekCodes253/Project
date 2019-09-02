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

  <title>SB Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
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
			alert(this.innerHTML)
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
table{
transform:scale(0.93,0.93);
z-index:1;
table-layout:fixed;
}
tr:not(:first-child){
	fint-weight:initial;
	transition: 0.2s;
 transform:scale(1,1);
}

tr:not(:first-child):hover{
height:120%;

transform: scale(1.1,1.1);
z-index: 3;
font-weight:bold;
}
 button
 {border-radius: 150%;
 	font-weight:bold;

 }
	
</style>

  

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html"><img style="width: 15%; height: auto"alt="" src="/logos/scrumlogo2.png"></a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-5 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
      	<form id="dashBoardForm" action ="/" method="post">
      		<input type="hidden" name="type" value="dashboard" />
	        <a class="nav-link" href="#" onclick="document.getElementById('dashBoardForm').submit();">
	          <i class="fas fa-fw fa-tachometer-alt"></i>
	          <span>Dashboard</span>
	        </a>
	        
	    </form>
      </li>
      <li class="nav-item">
      	<form id="editPageForm" action ="/" method="post">
      		<input type="hidden" name="type" value="editpage" />
	        <a class="nav-link" href="#" onclick="document.getElementById('editPageForm').submit();">
	          <i class="fas fa-fw fa-tachometer-alt"></i>
	          <span>Edit Pages</span>
	        </a>
	    </form>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
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
          <li class="float-right"  style="margin-left:65%;">
          	<div class="btn-group-justified float-right " style="font-weight:bold;text-align: right">

          
          <button onclick="allTasks()" id = "all_tasks_container" class="font-weight-bold btn btn-primary" selected>
            
                ALL TASKS (${taskcount})
          </button>
           <button onclick="nearingTasks(${todaytaskcount})"" id = "today_tasks_container" class="font-weight-bold btn btn-danger">
               DUE TODAY (${todaytaskcount})
          </button>
          
          <button onclick="nearingTasks(${deadlinetaskcount})" id = "nearing_tasks_container" class=" font-weight-bold btn btn-warning">
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
            <table class="table table-bordered table-hover" name="dataTable"id="dataTable" width="100%" cellspacing="0">
		   <tr>
			<th></th>
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
			<tr class="collapsed-row">
				<td>
					<div style="height:30%;width:auto" data-toggle="buttons">
					  <label class="btn-sm btn-normal btn btn-secondary active">
					    <input checked type="checkbox" name="${t.jira_Number}status" id="${t.jira_Number}check" autocomplete="off" style ="font-size: 50%" > Present
					  </label>
					  
					</div>
				</td>
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
	<div id="myModal" class="container modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close" onclick="EditClose()">&times;</span>
			<form action="/" method="post">
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
				<input type="hidden" name="type" value="save" />
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
	<form id="submitEmail" action ="/" method="post">
      		<input type="hidden" name="type" value="submitemail" />
      		<div style="text-align:center">
	        <button class="btn btn-danger" onclick="document.getElementById('submitEmail').submit();">Submit & Close Session</button>
	        </div>
	 </form>
	 
	
	
            
            	
           	</div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
