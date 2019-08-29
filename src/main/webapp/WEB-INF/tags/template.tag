<%@tag description="Simple Wrapper Tag" pageEncoding="UTF-8"%>
<%@attribute name="color" required="false"%>
<%@attribute name="title" required="false"%>

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
<body	style="background-color: ${color};">
<div class="container">
	<jsp:doBody />
	</div>
	
</body>
</html>