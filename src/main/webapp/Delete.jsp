<html>
<head>
  <meta charset="utf-8">
  <title>Comcast Coding Challenge</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body onload="SetDate();">
<h1>*****   Comcast Coding Challenge   *****</h1>
 
 <input type="text" id="userId"  placeholder="Enter User Name"><br>
 <button id="delete">Delete User</button>

<script>
$(document).ready(function()
		{
	 $("#delete").click(function(){
		 var userInfo = {
				 "UserId DELETED - " : $("#userId").val(),
				 "EmailId DELETED - " : $("#emailId").val(),
				 "Registered Date - " : $("#date").val()
		 };
	   	  $.ajax({ type: "POST",contentType: "application/json; charset=utf-8",
	   	 	url: "http://localhost:8080/SpringRest/users/delete",
	   	 	data: JSON.stringify(userInfo),
	   	  }).then(function(data) {
	   		      alert(data);
	   	     }); 
	   });
	 
});
</script>
</body>
</html>