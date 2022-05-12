<cfcomponent output="false">

	<!--- Application settings --->
	<cfset this.name = createUUID() />
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimeSpan(0,0,30,0)>

	<cfsetting showdebugoutput="yes">

	<cfset this.mappings["/ModelGlue"] = getDirectoryFromPath(getCurrentTemplatePath()) & "ModelGlue/">
	<cfset this.mappings["/ColdSpring"] = getDirectoryFromPath(getCurrentTemplatePath()) & "ColdSpring/">
	<cfset this.mappings["/mgtemplate"] = getDirectoryFromPath(getCurrentTemplatePath())>

	<cffunction name="onError">
		<cfdump var="#arguments#" />
		<cfabort />
	</cffunction>

	<cffunction name="onSessionStart">
		
	</cffunction>

</cfcomponent>
