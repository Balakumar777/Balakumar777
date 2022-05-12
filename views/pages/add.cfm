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
		  		}
		  		##add,##reset{
		  			width: 90px;
		  		}h1{
		  			text-align: center;
		  		}
		  	</style>
		  	<script type="text/javascript">
		  		$(function(){
		  			var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
		  			$('##add').on('click',function(){
		  				if($('##userName').val()!='' && $('##email').val()!=''&& $('##password').val()!=''&& $('##confirmPassword').val()!='') {
		  					if(re.test($('##email').val()) && $('##password').val() == $('##confirmPassword').val()){
		  						if($('##password').val().length > 4 && $('##password').val().length > 4){
		  							return true;
		  						}else{
		  							$('.modal-body h4').text('Minimum password length is 5');
			  						$("##myModal").modal();
			  						return false;
		  						}
		  					}else{
			  					$('.modal-body h4').text('Invalid Email or password mismatch');
			  					$("##myModal").modal();
			  					return false;
		  					}
		  				}else{
		  					$('.modal-body h4').text('All fields must be filled');
		  					$("##myModal").modal();
		  					return false;
		  				}
		  			});

		  			$('##check').on('click', function(e) {
		  				e.preventDefault();
		  				if($('##userName').val()!=''){
			  				$.ajax({
	  							url: 'model/userService.cfc?method=editUserGetAjax',
	  							type: 'GET',
	  							data: {username: $('##userName').val()},
	  						})
	  						.done(function(response) {
	  							var result = JSON.parse(response);
	  							if(!result.DATA.length){
	  								$('##add').show();
	  								$('##hiddenUser').val($('##userName').val());
	  								$('##userName').attr('disabled',true);
	  								$('##check').hide();
	  								$('##email,##password,##confirmPassword').removeAttr('disabled');
	  							}else{
				  					$('.modal-body h4').text('Username exists');
				  					$("##myModal").modal();
	  							}
	  						})
  						}else{
		  					$('.modal-body h4').text('Username is empty');
		  					$("##myModal").modal();
  						}
		  			});

		  			$('##reset').on('click',function(event) {
		  				$('##userName').removeAttr('disabled');
		  				$('##email,##password,##confirmPassword').attr('disabled',true);
	  					$('##check').show();
				  		$('##add').hide();
		  			});
		  		});
		  	</script>
		</head>
		<body class="container">
			<form action="#event.linkto('action.addUser')#" method="post" id="addForm">
				<div class="container-fluid">
					<h1>ADD USER</h1><br>
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input id="userName" type="text" class="form-control" name="user" placeholder="Username" value="">
						<input type="hidden" class="form-control" name="userName" id='hiddenUser' value="">
					</div><br>
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						<input id="email" type="text" class="form-control" name="email" placeholder="Email" value="" disabled>
					</div><br>
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input id="password" type="password" class="form-control" name="password" placeholder="Password" value="" disabled>
					</div><br>
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input id="confirmPassword" type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" value="" disabled>
					</div><br>
					<input type="submit" name="submit" id="add" class="btn btn-success" style='display:none'>
					<button type="button" name="check" id="check" class="btn btn-info">Username Availability</button>
					<input type="reset" name="reset" id="reset" class="btn btn-danger">
				</div>
			</form>
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