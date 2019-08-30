<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/add.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container register">
	<div class="row">

		<div class="col-md-12 register-right">
			<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="addtasks" role="tab"
					aria-controls="nav-home" selected="false">Task</a></li>
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
                                <!--   <div class="form-group">
                                                    <select class="form-control">
                                                        <option class="hidden"  selected disabled>Select Task</option>
                                                        <option>Project 1</option>
                                                        <option>Project 2</option>
                                                        <option>Project 3</option>
                                                    </select>
                                                </div> -->
                                
                                    <div class="form-group">
                                        <input name ="SOEID" type="text" class="form-control" placeholder="SOEID"
                                            value="" />
                                    </div>
                                    <div class="form-group">
                                        <input name="name" type="text" class="form-control" placeholder="Name"
                                            value="" />
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control" name="manager" >
                                            <option class="hidden" selected disabled>Select
                                                Manager</option>
                                            <c:forEach var="manager" items="${managerlist}">
                                                <option value=${manager.soeid} }>${manager.name}</option>
                                            </c:forEach>

                                        </select>

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
                                <!-- <div class="form-group">
                                                    <select class="form-control">
                                                        <option class="hidden"  selected disabled>Select Task Phase</option>
                                                        <option>Stage 1</option>
                                                        <option>Stage 2</option>
                                                        <option>Stage 3</option>
                                                    </select>
                                                </div>-->
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
                                        value="1" disabled />
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