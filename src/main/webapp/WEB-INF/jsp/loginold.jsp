-<!DOCTYPE html>
<%@ taglib prefix = "form"  uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
  <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
  <link rel="stylesheet" type="text/css" href="style.css">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    .shadow {box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)}
    .middle {margin: auto; vertical-align: center}
    .jumbotron {min-height: 300px}
    body { font-family: 'Roboto', sans-serif;
            background: url('https://i.ytimg.com/vi/sOfdDibgjbk/maxresdefault.jpg') center no-repeat;
            background-size: cover  }
    .main-section { margin: auto;
                    margin-top: 40%}
    .center { margin:auto }
   
    
  </style>
</head>

<BODY >

  <div class="modal-dialog   text-center " >
    <div class="col-12 main-section">
      
      <div class="modal-content ">
        <div class="col-12 center ">
          <img src="https://www.fabulous-stives.co.uk/wp-content/uploads/2018/03/WELCOME-ST-IVES.jpg" alt="" style="max-width: 50%;margin-top: -10%;border-radius: 5%">
        </div>
        
        <div class="col-12  ">
            <hr>
          <form action="login" method = "POST">
            <div class="form-group ">
           
             <input type="text" class="form-control" placeholder="Enter name" id="name" name="name">  
            
            </div>
              <div class="form-group">
              <input type="password" class="form-control" placeholder="Enter password" id="password" name="password">  
            </div>
            <c:forEach var="Error" items = "${ErrorList}">
					<p style="color: red;padding-left:2%; font-size: 70%; float: left;">${Error}</p>
					<br>
			</c:forEach>
            <hr>
          <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>Login</button>
          </form>
         
        </div>
        </div>
    </div>
  </div>
      



  

</BODY>
</html>