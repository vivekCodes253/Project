<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"/>
<title>Shippers</title>
</head>
<script type="text/javascript">
function validateform(){
	let isvalid = true
	let ele = document.getElementById('shipper').value;
	alert(ele.length)
		if(ele.length < 1){
			isvalid = false
		}
		if(isvalid == false){
			alert("Do not leave name empty")
			
		}
		else{
		}
}
</script>
<body>
	<h2>Northwind Shippers</h2>
	<p>
		<a href="/">Home</a>
	</p>
	<table style="width: 40%">
		<tr>
			<td>ID</td>
			<td><span id="sid"></span></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input id="shipper" type="text"/></td>
		</tr>
		<tr>
			<td>Phone</td>
			<td><input id="phone" type="text"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="save" type = "button" onclick="saveShipper()" disabled="disabled">Save
					Shipper</button> &nbsp;
				<button id="add" type = "button" onclick="validateform()">New Shipper</button>
			</td>
		</tr>
	</table>
	<table id="shippers">
		<thead>
			<tr>
				<th width="5%">Id</th>
				<th width="20%">Name</th>
				<th width="15%">Phone</th>
				<th width="15%">Operation</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</body>
</html>