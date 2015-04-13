<html>
<head>
  <meta charset="utf-8">
  <title>Comcast Coding Challenge</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body onload="SetDate();">
<h2>*****   Comcast Coding Challenge   *****</h2>
 <fieldset style="text-align: center"><legend>User Details</legend>
 <form name="myForm"  >
 <input type="text" id="userId"  placeholder="Enter User Name"><br>
 <input type="text" id="emailId"  placeholder="Enter Email Id"><br> 
 <input type="date" id="date" /><br><br>
 
  <button id="add">Add User</button>&emsp;&emsp;
  <button id="delete">Delete User</button>&emsp;&emsp;

  <button id="registeredusers">Registered Users</button>
  <!-- the result of the search will be rendered inside this div -->
	<div id="result"></div>
	</form>
 </fieldset>
<script>
$(document).ready(function()
		{
	 $("#registeredusers").click(function()
	 	{
   		$.ajax({ url:"http://localhost:8080/SpringRest/users/registereduser"}).then(function(data) 
   	   		{
       		alert(data);
	   		}); 
   		});
	 	
	 $("#add").click(function(){
		   if( document.myForm.userId.value == "" )
		   {
		     alert( "Please provide a Username  !" );
		     document.myForm.userId.focus() ;
		     return false;
		   }
		   if( document.myForm.emailId.value == "" )
		   {
		     alert( "Please provide a Email  !" );
		     document.myForm.emailId.focus() ;
		     return false;
		   }
		 var userInfo = {
				 "UserId ADDED - " : $("#userId").val(),
				 "EmailId ADDED - " : $("#emailId").val(),
				 "Registered Date - " : $("#date").val()
		 };
	   	  $.ajax({ type: "POST",contentType: "application/json; charset=utf-8",
	   	 	url: "http://localhost:8080/SpringRest/users/save",
	   	 	data: JSON.stringify(userInfo),
	   	  }).then(function(data) {
	   		      alert(data,"Added Successfully");
	   	     }); return true;
	   });
	 
	 $("#delete").click(function()
		{
		   if( document.myForm.userId.value == "" )
		   {
		     alert( "Please provide a Username  !" );
		     document.myForm.userId.focus() ;
		     return false;
		   }
		   if( document.myForm.emailId.value == "" )
		   {
		     alert( "Please provide a Email  !" );
		     document.myForm.emailId.focus() ;
		     return false;
		   }
		 
		 var userInfo = {
				 "UserId DELETED - " : $("#userId").val(),
				 "EmailId DELETED - " : $("#emailId").val(),
				 "Registered Date - " : $("#date").val()
				 };
	   	  $.ajax({ type: "POST",contentType: "application/json; charset=utf-8",
	   	 	url: "http://localhost:8080/SpringRest/users/delete",
	   	 	data: JSON.stringify(userInfo),
	   	  }).then(function(data) {
	   		      alert(data,"Deleted Successfully");
	   	     });
	   });
	 
});
function SetDate()
{
var date = new Date();
var day = date.getDate();
var month = date.getMonth() + 1;
var year = date.getFullYear();

if (month < 10) month = "0" + month;
if (day < 10) day = "0" + day;

var today =  month + "-" + day+ "-" +year;

document.getElementById('date').value = today;
}
</script>
</body>
</html>