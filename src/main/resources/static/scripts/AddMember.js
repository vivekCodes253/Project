
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
