<cfcomponent displayname="Login">
    <cfset instance = StructNew()>
		
    <cfset Instance.IpraDSN = "ILIPRA">
	<cfset Instance.mailserver = "mail.ilipra.org">
	<cfset Instance.MailUser = "webuser">
	<cfset Instance.MailPassword = "**********">
	<cfset Instance.Lock = "login_lock">
		
    <cfset init()> 
		

  <cffunction name="init" returnType="Void" access="Private">
     <cfset Initialized = True>
  </cffunction>
   
  <cffunction name="MemberLogin" access="Public" returnType="query">
     <cfargument name="username" type="string" required="YES">
	 <cfargument name="password" type="string" required="YES">
	 
	 <cfset var GetUser ="">
	 
	 <cfif findnocase("@", arguments.username, 1) GT 0>
		 <cfquery name="GetUser" datasource="#instance.IpraDSN#">
		   Select *
		   From Members
		   Where Email = '#arguments.username#'
		   And Password = '#arguments.password#'
		 </cfquery>
	 <cfelse>
	    <cfif IsNumeric(arguments.password)>
			 <cfquery name="GetUser" datasource="#instance.IpraDSN#">
			   Select *
			   From Members
			   Where Lastname = '#arguments.username#'
			   AND IPRAMemberID = #arguments.password#
			 </cfquery>
		 <cfelse>
		     <cfset getUser = QueryNew('MemberID')>
		 </cfif>
	 </cfif>  
	 
	<cfreturn getUser />
  </cffunction> 
  
  <cffunction name="getMemberInfo" access="Public" returnType="query">
    <cfargument name="MemberID" type="Numeric" required="YES">
	
	<cfset getMbr ="">
	<cfquery name="GetMbr" datasource="#instance.IpraDSN#">
	   Select *
	   From Members
	   Where MemberID = #Arguments.memberID#
    </cfquery>
	
	<cfreturn getMbr />
  </cffunction>

</cfcomponent>