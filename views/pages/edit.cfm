<!DOCTYPE html>
<cfoutput>
	<html>
		<head>
			<title></title>
			<link rel="stylesheet" href="assets/bootstrap.min.css">
		  	<script src="assets/jquery.min.js"></script>
		  	<script src="assets/bootstrap.min.js"></script>
		  	<style type="text/css">
		  		form{
	  			    width: 400px;
					margin: 10% auto;
					padding: 30px 0;
					border: 1px solid rgba(0, 0, 0, 0.125);
    				border-radius: 0.25rem;
    				background-color:##fff;
		  		}h1,##add{
		  			text-align: center;
		  		}
		  	</style>
		  	<script type="text/javascript">
		  		$(function(){
		  			var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		  			$('##add').on('click',function(e){
	  					if($('##email').val().match(re) && $('##password').val().length > 4){
	  						return true;
	  					}else{
	  						$('.modal-body h4').text('Invalid Email Or minimum password length is 5');
		  					$("##myModal").modal();
	  						return false;
	  					}
		  			});

		  			$('input').on('keyup',function(e){
		  				e.preventDefault();
		  				if($(this).val()==''){
		  					$('##add').attr('disabled',true);
		  				}else{
		  					$('##add').removeAttr('disabled');
		  				}
		  			});
		  		});
		  	</script>
		</head>
		<body class="container">
			<cfif structKeyExists(session,"editDetails")>
				<cfset editUserId = 'id=#session.editDetails.id#'>
				<form action="#event.linkto('action.editUser','#editUserId#')#" method="post" id="addForm">
					<div class="container-fluid">
						<h1>EDIT USER</h1>
						<div class="form-group">
							<label>Username</label>
							<input id="userName" type="text" class="form-control" name="user" placeholder="Username" value="#session.editDetails.username#" disabled>
							<input type="hidden" class="form-control" name="username" value="#session.editDetails.username#">
						</div>
						<div class="form-group">
							<label>Email</label>
							<input id="email" type="text" class="form-control" name="email" placeholder="Email" value="#session.editDetails.email#">
						</div>
						<div class="form-group">
							<label>Password</label>
							<input id="password" type="password" class="form-control" name="password" placeholder="Password" value="#session.editDetails.password#">
						</div>
						<input type="submit" name="submit" id="add" class="btn btn-info" value="Update">
					</div>
				</form>
			</cfif>
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="background-color:steelblue;">
							<button type="button" class="close" data-dismiss="modal" style="color:white;opacity:1;">&times;</button>
						</div>
						<div class="modal-body" style="padding:1.5rem">
							<h4></h4>
						</div>
					</div>
				</div>
			</div>
		</body>
	</html>
</cfoutput>