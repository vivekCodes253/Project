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






function update(name) {
	
	 var URL = "getTaskDetails?task_id=" + $("#selected_task").val();
     $.ajax({
         type: "GET",
         url: URL,
         dataType: 'JSON',
         cache: false,
    
     })
     .done(function (data) {

    	
         document.getElementById("task_owner").value = data.owner;
         document.getElementById("start_date").value = data.start_date;
         document.getElementById("end_date").value = data.end_date;
         document.getElementById("task_status").value = data.task_status;
         
     })
     .fail(function (data) {
         
         console.log("fail() called, with data " + data);
     })
     .always(function (data) {
    	
         
         console.log("always() called, with data " + data);
     });
}
</script>

</script>
  <style>
.has-error .help-block{
color: red;
}</style>

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html"><img style="width: 15%; height: auto"alt="" src="/logos/scrumlogo2.png"></a>

   
  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
       <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <form id="dashBoardForm" action="/" method="post">
          <input type="hidden" name="type" value="dashboard" />
          <a class="nav-link" href="#" onclick="document.getElementById('dashBoardForm').submit();">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>

        </form>
      </li>
      <li class="nav-item active">
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
       <li class="nav-item active">
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
        <ol class="breadcrumb" style="margin-bottom:-2%">
        
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
          
     
        </ol>
               
               

        <!-- Icon Cards-->
        
         
<div class="register"><!-- <div class="container register"> -->
                <div class="row">
                 
                    <div class="col-md-12 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="addtasks" role="tab" aria-controls="nav-home" selected="false">Task</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="home-tab" data-toggle="tab" href="addmembers" role="tab" aria-controls="nav-home" selected="true">Member</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" id="profile-tab" data-toggle="tab" href="modify" role="tab" aria-controls="profile" aria-selected="false">Modify</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Modify Task - Change Owner</h3>
                                <form method="POST" action="/">
                                <input type="hidden" name="type" value="modify" />
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                                <select  name ="jira_no" id="selected_task" onchange = "update(this)"class="form-control">
                                                    <option class="hidden"  selected disabled>Select Task</option>
                                                     <c:forEach var="task" items="${tasks}">
                                                			<option value=${task.jira_Number} }>${task.task_name} (${task.jira_Number})</option>
                                            			</c:forEach>
                                                    
                                                </select>
                                            </div>
                                        <div class="form-group">
                                            <input type="text" id="task_owner" name = "task_owner" class="form-control" placeholder="TaskOwner" value="" disabled />
                                        </div>
                                        <div class="form-group">
                                            <input id = "start_date" type="text" class="form-control" placeholder="Start-Date" value="" disabled/>
                                        </div>
                                        <div class="form-group">
                                            <input id="end_date"type="text" class="form-control"  placeholder="End-Date" value="" disabled/>
                                        </div>
                                      <div class="form-group">
                                            
                                       </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input id="task_status"type="text" class="form-control" placeholder="Current Status" value="" disabled />
                                        </div>
                                        <!-- <div class="form-group">
                                                <select class="form-control">
                                                    <option class="hidden"  selected disabled>Select Task Phase</option>
                                                    <option>Stage 1</option>
                                                    <option>Stage 2</option>
                                                    <option>Stage 3</option>
                                                </select>
                                            </div>-->
                                        <div class="form-group">
                                            <select name="owner" class="form-control">
		                                                <option class="hidden"  selected disabled>Select Employee</option>
		                                                <c:forEach var="employee" items="${employeelist}">
		                                                	<option value=${employee.soeid} }>${employee.name}</option>
		                                            	</c:forEach>
		                                            </select>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Submit"/>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Apply as a Hirer</h3>
                               
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="Phone *" value="" />
                                        </div>


                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Confirm Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control">
                                                <option class="hidden"  selected disabled>Please select your Sequrity Question</option>
                                                <option>What is your Birthdate?</option>
                                                <option>What is Your old Phone Number</option>
                                                <option>What is your Pet Name?</option>
                                            </select>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register"/>
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
            <span>Copyright � Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  
</body>

</html>
