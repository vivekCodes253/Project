
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<html>



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