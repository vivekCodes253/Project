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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="css/add.css">
 
  <!-- Validator framework -->
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
  <!-- End of validator framework -->

		

				

<script>
$(document).ready(function() {
    $('.registerForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	template: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'Taskname required!'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'The username can only consist of alphabetical, number and underscore'
                    }
                }
            },
            task_name: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'Taskname required!'
                    }
                }
            },
            start_date: {
                message: 'The date is not valid',
                validators: {
                    notEmpty: {
                        message: 'Start date required!'
                    }
                }
            },
            end_date: {
                message: 'The date is not valid',
                validators: {
                    notEmpty: {
                        message: 'End date required!'
                    }
                    
                }
            },
            update_space: {
                message: 'The update is not valid',
                validators: {
                    notEmpty: {
                        message: 'Update required!'
                    },
       
                }
            },
            task_phase: {
                message: 'The task phase is not valid',
                validators: {
                    notEmpty: {
                        message: 'Task phase required!'
                    }
                   
                }
            },
            employee: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'Employee name required!'
                    }
       
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            }
        }
    });
});
</script>
  

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
      <li class="nav-item">
      	<form id="dashBoardForm" action ="/" method="post">
      		<input type="hidden" name="type" value="dashboard" />
	        <a class="nav-link" href="#" onclick="document.getElementById('dashBoardForm').submit();">
	          <i class="fas fa-fw fa-tachometer-alt"></i>
	          <span>Dashboard</span>
	        </a>
	        
	    </form>
      </li>
      <li class="nav-item active">
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
        <ol class="breadcrumb" style="margin-bottom:-2%">
        
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
          
     
        </ol>
               
               

        <!-- Icon Cards-->
        
         
<div class="register"> <!-- <div class="container register"> -->
	<div class="row">

		<div class="col-md-12 register-right">
			<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="addtasks" role="tab"
						aria-controls="nav-home" selected="false">Task</a>
				</li>
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="addmembers" role="tab"
					aria-controls="nav-home" selected="true">Member</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="modify" role="tab" aria-controls="profile"
					aria-selected="false">Modify</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
                    <h3 class="register-heading">Add Members</h3>
                    <form action="addmembers" method="POST">
                        <div class="row register-form">
                            <div class="col-md-6">
                               
                                    <div class="form-group">
                                        <input name ="SOEID" type="text" class="form-control" placeholder="SOEID"
                                            value="" />
                                    </div>
                                    <div class="form-group">
                                        <input name="name" type="text" class="form-control" placeholder="Name"
                                            value="" />
                                    </div>
                                    <div class="form-group">
                                        

                                    </div>
                                    <div class="form-group"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <select class="form-control" name="scrum_master">
                                        <option class="hidden" selected disabled>Secondary
                                            Scrum Master</option>
                                        <option>Yes</option>
                                        <option selected="selected">No</option>

                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <select class="form-control" name="role">
                                        <option class="hidden" selected disabled>Select Role</option>
                                        <option>Developer</option>
                                        <option>Quality Analyst</option>
                                        <option>DB Developer</option>
                                        <option>Data Analyst</option>
                                        <option>Manager</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Project-1"
                                        value="Project 1" disabled />
                                </div>
                                <input type="submit" class="btnRegister" value="Submit" />
                            </div>
                    
                        </div>
                    </form>
				</div>
				
				<div class="tab-pane fade show" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<h3 class="register-heading">Apply as a Hirer</h3>
					<div class="row register-form">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="First Name *" value="" />
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Last Name *" value="" />
							</div>
							<div class="form-group">
								<input type="email" class="form-control" placeholder="Email *"
									value="" />
							</div>
							<div class="form-group">
								<input type="text" maxlength="10" minlength="10"
									class="form-control" placeholder="Phone *" value="" />
							</div>


						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="password" class="form-control"
									placeholder="Password *" value="" />
							</div>
							<div class="form-group">
								<input type="password" class="form-control"
									placeholder="Confirm Password *" value="" />
							</div>
							<div class="form-group">
								<select class="form-control">
									<option class="hidden" selected disabled>Please select
										your Sequrity Question</option>
									<option>What is your Birthdate?</option>
									<option>What is Your old Phone Number</option>
									<option>What is your Pet Name?</option>
								</select>
							</div>
							<input type="submit" class="btnRegister" value="Register" />
						</div>
					</div>
				</div>
			</div>
		</div>
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

  
</body>

</html>
