
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
<script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
    </head>

    <body>
			<form>
					<div class="form-group">
					  <label for="exampleFormControlInput1">TaskName</label>
					  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Enter Task Name">
					</div>
					<div class="form-group">
							<label for="exampleFormControlInput1">TaskOwner</label>
							<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Enter Task Owner">
					</div>
					<div class="form-group">
							<label for="exampleFormControlInput1">StartDate</label>
							<input type="Date" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
					</div>
					<div class="form-group">
							<label for="exampleFormControlInput1">EndDate</label>
							<input type="Date" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
					</div>
					<div class="form-group">
					  <label for="exampleFormControlSelect1">Team Member</label>
					  <select class="form-control" id="exampleFormControlSelect1">
						<option>Vivek</option>
						<option>Hemanth</option>
						<option>bhavana</option>
						<option>Samyukta</option>
						<option>Chandana</option>
					  </select>
					</div>
					<div class = "form-group">
					<button type = "button ">submit</button>
					</div>
				  </form>
    </body>
</html>