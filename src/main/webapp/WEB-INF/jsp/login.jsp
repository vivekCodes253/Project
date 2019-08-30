<html>
    <head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel = "stylesheet" href = "css/login.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <c:if test="${fn:length(Error)>0}">
<div class="wrapper">
  <div id="formContent">
    


	    <form method ="POST" action="/">
	      <input minlength="1" type="text" id="login"  name="username" placeholder="login">
	      <input minlength="1" type="text" id="password"  name="password" placeholder="password">
	      <div class="text-danger">${Error}</div>
	      <input type="submit"  value="Log In">
	    </form>
	 
	    
    

    
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
</c:if>
<c:if test="${fn:length(Error)<1}">
<div class="wrapper fadeInDown">
  <div id="formContent">
    

   
	    <form method ="POST" action="/">
	      <input minlength="1" type="text" id="login" class="fadeIn second" name="username" placeholder="login">
	      <input minlength="1" type="text" id="password" class="fadeIn third" name="password" placeholder="password">
	      
	      <input type="submit" class="fadeIn fourth" value="Log In">
	    </form>
	   
	   
	    
	   
	   
    

    
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
</c:if>
</head>
</html>