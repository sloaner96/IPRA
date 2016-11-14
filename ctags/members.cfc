<cfcomponent displayname="Members" output="Yes">
		

		<cfset instance = StructNew()>
		
		<cfset Instance.IpraDSN = "ILIPRA">
		
		
		<cfset Instance.mailserver = "smtp.sbcglobal.yahoo.com">
		<cfset Instance.MailUser = "*********">
		<cfset Instance.MailPassword = "*************">
		
		
		

		<cfset Instance.Lock = "members_lock">
		

		<cfset init()> 
		
		<cffunction name="init" returnType="Void" access="Private">
		  <cfset Initialized = True>
		</cffunction>
		
		<cffunction name="GetMember" returnType="Query" access="public">
		  <cfargument name="MemberID" required="YES" Type="Numeric">
		  <cfset var getMem = "">
		  
		  <cfquery name="getMem" datasource="#Instance.IpraDSN#">
		     Select *
			 From Members
			 Where MemberID = #arguments.MemberID#
		  </cfquery>
		  
		  <cfreturn getMem />
		</cffunction>
		
		<cffunction name="GetAdmin" returnType="Query" access="public">
		  <cfargument name="AdminID" required="YES" Type="Numeric">
		  <cfset var getAdminInfo = "">
		  
		  <cfquery name="getAdminInfo" datasource="#Instance.IpraDSN#">
		     Select *
			 From dbo.SiteUsers
			 Where UserID = #arguments.MemberID#
		  </cfquery>
		  
		  <cfreturn getAdminInfo />
		</cffunction>
		
</cfcomponent>