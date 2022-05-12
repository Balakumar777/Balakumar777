<!DOCTYPE html>
<cfoutput>

	<html>
		<head>
			<title></title>
			<link rel="stylesheet" href="assets/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
		  	<script src="assets/jquery.min.js"></script>
		  	<script src="assets/bootstrap.min.js"></script>
		  	<style type="text/css">
		  		table{
		  			background-color:white !important;
		  		}table a{
		  			background-color: white !important;
		  		}table a .fa{
		  			color: black;
		  		}.action{
		  			text-align: center;
		  		}
		  	</style>
		  	<script type="text/javascript">
		  		$(function(){
		  			$('.btn-danger').on('click',function(){
		  				if(confirm("Are you sure want to delete")) {
							return true;
						}
						else{
							return false;
						}
		  			});
		  		});
		  	</script>
		</head>
		<body class="container">
			<h1 style="text-align:center">Model Glue framework</h1>
			<a href="#event.linkto('page.add')#" class="btn btn-dark btn-md">
				<i class="fa fa-user-plus"></i>
			</a><br><br>
			<table class="table table-bordered">
			    <thead class="thead-dark">
			      <tr>
			        <th>USERNAME</th>
			        <th>EMAIL</th>
			        <th>PASSWORD</th>
			        <th class="action">EDIT</th>
			        <th class="action">DELETE</th>
			      </tr>
			    </thead>
		    	<tbody>
			    	<cfif structKeyExists(session,"userDetails")>
				    	<cfloop index="i" from="1" to="#session.userDetails.recordCount#">
					      <tr>
					        <td>#session.userDetails['username'][i]#</td>
					        <td>#session.userDetails['email'][i]#</td>
					        <td>#session.userDetails['password'][i]#</td>
					        <td class="action"> 
					        	<cfset editId = 'id=#session.userDetails['id'][i]#'>
					        	<a href="#event.linkto('action.editUserRecordGet',editId)#" class="btn btn-info btn-sm">
	          						<i class="fa fa-pencil"></i>
	        					</a>
	        				</td>
					        <td class="action"> 
					        <cfset deleteId = 'id=#session.userDetails['id'][i]#'>
							<a href="#event.linkto('action.deleteUser',deleteId)#" class="btn btn-danger btn-sm">
	          					<i class="fa fa-trash"></i> 
	        				</a>
	        				</td>
					      </tr>
				    	</cfloop>
			    	</cfif>
		    	</tbody>
		  	</table>
		</body>
	</html>
</cfoutput>