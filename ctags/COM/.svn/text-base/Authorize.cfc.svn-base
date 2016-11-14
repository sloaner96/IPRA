<cfcomponent displayname="Authorize" hint="This component does Site Authentication.">
   
    <cfset init()>
	
   	<!--- Initialize the Component --->
	<cffunction name="init" access="remote" returnType="void" output="true" hint="Initialize the blog engine">
		
		<cfargument name="name" type="string" required="false" default="default">
				
		<!--- Not defined in var scope, so wil be global to CFC --->
		<cfset instance = structNew()>
		<cfset instance.name = "ipra">
		<cfset instance.dsn = "IPRA">
		<cfset instance.siteid = 1>
		<cfset instance.ownerEmail = "Webmaster@il-ipra.org">
	</cffunction>
	
	<!--- Authenticate the user --->
   	<cffunction name="authenticate" access="public" returntype="query">
		<cfargument name="username" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		
		<cfset var q = "">
		
		<cfquery name="q" datasource="#instance.dsn#">
			select 	*
			from	Members
			where	email = <cfqueryparam value="#arguments.username#" cfsqltype="CF_SQL_VARCHAR" maxlength="50">
			and		password = <cfqueryparam value="#arguments.password#" cfsqltype="CF_SQL_VARCHAR" maxlength="50">
		</cfquery>
		
		<cfreturn q>
	
	</cffunction>
	
	<!--- Set Username Cookie --->
	<cffunction name="RememberMe" access="public" returntype="boolean">
		<cfargument name="username" type="string" required="true">
		
		<cfset var user = true>
		<cfset var ExpireNinety =  DateAdd('d', 90, Now())>
		
		<cftry>
		  <cfcookie name="username" value="#Arguments.username#" expires="#ExpireNinety#"> 
		  
		  <cfcatch type="Any">
		      <cfset var user = true>
		  </cfcatch>  
		</cftry>
		
		<cfreturn user>
	</cffunction>
	
	<!--- Remove Username Cookie  --->
	<cffunction name="ForgetMe" access="public" returntype="boolean">
		<cfargument name="username" type="string" required="true">
		
		<cfset var user = true>
		
		<cftry>
		  <cfcookie name="username" value="#Arguments.username#" expires="NOW"> 
		  
		  <cfcatch type="Any">
		      <cfset var user = true>
		  </cfcatch>  
		</cftry>
		
		<cfreturn user>
	</cffunction>
</cfcomponent> 