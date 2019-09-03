
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container register">
                <div class="row">
                 
                    <div class="col-md-12  register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Task</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="addmembers" role="tab" aria-controls="profile" aria-selected="false">Member</a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="modify" role="tab" aria-controls="profile" aria-selected="false">Modify</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Add Task </h3>
                                <form action="/" method="get" id="mainform" class="registerForm">
		                                <div class="row register-form">
		                                    <div class="col-md-6">
		                                        <div class="form-group">
		                                            <input name ="task_name" type="text" class="form-control" placeholder="Taskname" value="" />
		                                        </div>
		                                        <div class="form-group">
		                                             <select name="employee" class="form-control">
		                                                <option class="hidden"  selected disabled>Select Employee</option>
		                                                <c:forEach var="employee" items="${employeelist}">
		                                                	<option value=${employee.soeid} }>${employee.name}</option>
		                                            	</c:forEach>
		                                            </select>
		                                        </div>
		                                        <div class="form-group">
		                                            <input name="start_date" type="date" class="form-control" placeholder="Start-Date" value="" />
		                                        </div>
		                                        <div class="form-group">
		                                            <input name="end_date" type="date" class="form-control"  placeholder="End-Date" value="" />
		                                        </div>
		                                      <div class="form-group">
		                                            
		                                        </div>
		                                    </div>
		                                    <div class="col-md-6">
		                                        <div class="form-group">
		                                            <input name="update_space" type="text" class="form-control" placeholder="Update Space" value="" />
		                                        </div>
		                                        <div class="form-group">
		                                                <select name="task_phase" class="form-control">
		                                                    <option class="hidden"  selected disabled>Select Task Phase</option>
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
		                                                </select>
		                                            </div>
		                                        <div class="form-group">
		                                       
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