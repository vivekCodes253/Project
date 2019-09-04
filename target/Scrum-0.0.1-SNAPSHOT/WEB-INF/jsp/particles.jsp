<!DOCTYPE html>
<html lang="en">

<div class="background" id="particles-js"></div>
<head>
<meta charset="utf-8">
<title>particles.js</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel = "stylesheet" href = "css/login.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="description"
	content="particles.js is a lightweight JavaScript library for creating particles.">
<meta name="author" content="Vincent Garreau" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" media="screen" href="css/style.css">

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
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.shadow {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19)
}

.middle {
	margin: auto;
	vertical-align: center
}

.jumbotron {
	min-height: 300px
}

body {
	font-family: 'Roboto', sans-serif;
	background-size: cover
}

.main-section {
	margin: auto;
	margin-top: 40%
}

.center {
	margin: auto
}
</style>
</head>
<!-- particles.js container -->

<body>




	<!-- scripts -->
	<script src="js/particles.js"></script>
	<script src="js/app.js"></script>

	<!-- stats.js -->
	<script src="js/lib/stats.js"></script>



	<c:if test="${fn:length(Error)>0}">
		<div class="wrapper fadeInDown">
			<div id="formContent">

				<form method="POST" action="/">
					<input minlength="1" type="text" id="login" name="username"
						placeholder="login"> <input minlength="1" type="text"
						id="password" name="password" placeholder="password">
					<div class="text-danger">${Error}</div>
					<input type="submit" value="Log In">
				</form>

				<div id="formFooter">
					<a class="underlineHover" href="#">Forgot Password?</a>
				</div>

			</div>
		</div>
	</c:if>
	<c:if test="${fn:length(Error)<1}">
	<div class="wrapper fadeInDown center">
	<div class="text-center">
				<img style="width:65%;height:auto" src="/logos/scrumlogo2.png" class="rounded" alt="...">
			</div>
		<div id="formContent">

			




		</div>
		<form method="POST" action="/">
			<input minlength="1" type="text" id="login" class="fadeIn second"
				name="username" placeholder="login"> <input minlength="1"
				type="text" id="password" class="fadeIn third" name="password"
				placeholder="password"> <input type="submit"
				class="fadeIn fourth" value="Log In">
		</form>
		<div id="formFooter">
			<a class="underlineHover" href="#">Forgot Password?</a>
		</div>
	</div>
</c:if>






</body>
</html>


<!-- 
<script>
  var count_particles, stats, update;
  stats = new Stats;
  stats.setMode(0);
  stats.domElement.style.position = 'absolute';
  stats.domElement.style.left = '0px';
  stats.domElement.style.top = '0px';
  document.body.appendChild(stats.domElement);
  count_particles = document.querySelector('.js-count-particles');
  update = function() {
    stats.begin();
    stats.end();
    if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
      count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
    }
    requestAnimationFrame(update);
  };
  requestAnimationFrame(update);
</script>

 -->