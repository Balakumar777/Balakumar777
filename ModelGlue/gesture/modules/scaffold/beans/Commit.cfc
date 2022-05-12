<cfcomponent extends="ModelGlue.gesture.modules.scaffold.beans.AbstractScaffold" output="false" hint="I am used whever type=""commit"" is used in a scaffold tag.">
	
<cffunction name="makeModelGlueXMLFragment" output="false" access="public" returntype="string" hint="I make an instance of a modelglue xml fragment for this event">
	<cfargument name="advice" type="struct" required="true"/>
	<cfargument name="alias" type="string" required="true"/>
	<cfargument name="class" type="string" required="true"/>
	<cfargument name="eventtype" type="string" required="true"/>
	<cfargument name="orderedpropertylist" type="string" required="true"/>
	<cfargument name="prefix" type="string" required="true"/>
	<cfargument name="primarykeylist" type="string" required="true"/>
	<cfargument name="properties" type="struct" required="true"/>
	<cfargument name="propertylist" type="string" required="true"/>
	<cfargument name="suffix" type="string" required="true"/>
	
	<cfset var xml = '
		<event-handler name="#arguments.alias#.Commit" access="public"' />
	
	<cfif len(arguments.eventtype)>
		<cfset xml = xml & ' type="#arguments.eventtype#"' />
	</cfif>
	
	<cfset xml = xml & '>
			<broadcasts>
				<message name="ModelGlue.genericCommit">
					<argument name="criteria" value="#arguments.primaryKeyList#" />
					<argument name="object" value="#arguments.alias#" />
					<argument name="validationName" value="#arguments.alias#Validation" />
					<argument name="recordName" value="#arguments.alias#Record" />
				</message>
			</broadcasts>
			<views>
			</views>
			<results>
				<result name="commit" do="#arguments.alias#.List" redirect="true" preserveState="false" />
				<result name="validationError" do="#arguments.alias#.Edit" redirect="false" append="#arguments.primaryKeyList#" preserveState="false" />
			</results>
		</event-handler>
'>
	
	<cfreturn xml />
</cffunction>

</cfcomponent>
