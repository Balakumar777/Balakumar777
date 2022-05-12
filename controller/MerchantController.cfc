<cfcomponent output="false" hint="I am a Model-Glue controller." extends="ModelGlue.gesture.controller.Controller" 
	beans="userService">

	<cffunction name="init" access="public" output="false" hint="Constructor">
		<cfargument name="framework" />
		<cfset super.init(framework) />
		<cfreturn this />
	</cffunction>

	<cffunction name="userCheck" access="public">
		<cfset session.userDetails = beans.userService.getUser()>
	</cffunction>

	<cffunction name="addUser" access="public">
		<cfset beans.userService.insertUser(username=form.userName,password=form.password,email=form.email)>
	</cffunction>

	<cffunction name="deleteUser" access="public">
		<cfset beans.userService.deleteUser(id='#replace(url.id,'=','')#')>
	</cffunction>

	<cffunction name="editUser" access="public">

		<cfset beans.userService.editUser(username=form.userName,password=form.password,email=form.email,id='#replace(url.id,'=','')#')>
		<cfset structdelete(session,'editDetails')>
	</cffunction>

	<cffunction name="editUserGet" access="public">
		<cfset session.editDetails=beans.userService.editUserGet(id='#replace(url.id,'=','')#')>
	</cffunction>

</cfcomponent>
	
