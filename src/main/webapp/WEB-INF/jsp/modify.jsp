<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel = "stylesheet" href = "css/add.css">
<script>



function update(name) {
	
	 var URL = "getx?task_id=" + $("#selected_task").val();
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container register">
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
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                                <select  id="selected_task" onchange = "update(this)"class="form-control">
                                                    <option class="hidden"  selected disabled>Select Task</option>
                                                     <c:forEach var="task" items="${tasks}">
                                                			<option value=${task.jira_Number} }>${task.task_name}</option>
                                            			</c:forEach>
                                                    
                                                </select>
                                            </div>
                                        <div class="form-group">
                                            <input type="text" id="task_owner" class="form-control" placeholder="TaskOwner" value="" disabled />
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
                                            <select class="form-control">
                                                <option class="hidden"  selected disabled>New Owner</option>
                                                
                                                <option>person1</option>
                                                <option>person2</option>
                                                <option>person3</option>
                                            </select>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Submit"/>
                                    </div>
                                </div>
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