<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="css/login.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${fn:length(Error)>0}">
<div class="wrapper center">
		<div class="text-center">
			<img style="width: 70%; height: auto" src="/logos/scrumlogo2.png"
				class="rounded" alt="...">
		</div>
		<div id="formContent">
		<form method="POST" action="/">
		
			<input style="margin-top: 6%" minlength="1" type="text" id="login" 
				name="username" placeholder="SOEID"> 
				
				<input minlength="1"
				type="text" id="password"  name="password"
				placeholder="PASSWORD"> 
				<div class="text-danger foat-left">${Error}</div>
				<input style="margin-top: 10%" type="submit"  value="Log In">
		</form>
		
		
		</div>
		<div id="formFooter">
			<a class="underlineHover" href="#">Forgot Password?</a>
		</div>
		
	</div>
</c:if>
	
<c:if test="${fn:length(Error)<1}">
	<div class="wrapper fadeInDown center">
		<div class="text-center">
			<img style="width: 70%; height: auto" src="/logos/scrumlogo2.png"
				class="rounded" alt="...">
		</div>
		<div id="formContent">
		<form method="POST" action="/">
		
			<input style="margin-top: 6%" minlength="1" type="text" id="login" class="fadeIn second"
				name="username" placeholder="SOEID"> 
				
				<input minlength="1"
				type="text" id="password" class="fadeIn third" name="password"
				placeholder="PASSWORD"> 
				<input style="margin-top: 10%" type="submit" class="fadeIn fourth" value="Log In">
		</form>
		
		
		</div>
		<div id="formFooter">
			<a class="underlineHover" href="#">Forgot Password?</a>
		</div>
		
	</div>
</c:if>
</head>
</html>