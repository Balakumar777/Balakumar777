<cfcomponent>

	<cfset variables.dsn = "">

	<cffunction name="init" access="public" output="false">

		<cfargument name="settings" type="any" required="true">
		<cfset var config = arguments.settings.getConfig()>
		<cfset variables.dsn = config.dsn>
		<cfreturn this>

	</cffunction>	

	<cffunction name="getUser"  returntype="any" access="public">

		<cfquery name="userCheck" datasource="#variables.dsn#">
			SELECT * FROM logintodo 
		</cfquery>
		<cfreturn userCheck>

	</cffunction>

	<cffunction name="insertUser"  returntype='void' access="public">

		<cfargument name="username" type="string">
		<cfargument name="password" type="string">
		<cfargument name="email" type="string">
		<cfquery name="insert" datasource="#variables.dsn#">
			INSERT into logintodo(username,password,email)values('#arguments.username#','#arguments.password#','#arguments.email#')
		</cfquery>

	</cffunction>

	<cffunction name="deleteUser"  returntype='void' access="public">

		<cfargument name="id" type="string">
		<cfquery name="delete" datasource="#variables.dsn#">
			delete from logintodo where id = '#arguments.id#'
		</cfquery>

	</cffunction>

	<cffunction name="editUser"  returntype='void' access="public">

		<cfargument name="id" type="string">
		<cfargument name="username" type="string">
		<cfargument name="password" type="string">
		<cfargument name="email" type="string">
		<cfquery name="update" datasource="#variables.dsn#">
			update logintodo set username='#arguments.username#',password='#arguments.password#',email='#arguments.email#' where id='#arguments.id#'
		</cfquery>

	</cffunction>

	<cffunction name="editUserGet"  returntype='any' access="public">

		<cfargument name="id" type="string">
		<cfquery name="editUserGet" datasource="#variables.dsn#">
			select * from logintodo where id= '#arguments.id#'
		</cfquery>
		<cfreturn editUserGet>

	</cffunction>

	<cffunction name="editUserGetAjax"  returntype='any' access="remote" returnformat="json">

		<cfargument name="username" type="string">
		<cfquery name="editUserGet" datasource="wordDSN">
			select * from logintodo where username= '#arguments.username#'
		</cfquery>
		<cfreturn serializeJSON(editUserGet)>

	</cffunction>

</cfcomponent>