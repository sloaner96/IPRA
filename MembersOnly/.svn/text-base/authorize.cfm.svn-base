<cfif Not IsDefined("Session.LoginTry")>
  <cflock type="EXCLUSIVE" scope="SESSION" timeout="10">
     <cfset Session.LoginTry = 0>
  </cflock>
</cfif>

<cfif IsDefined("Form.SendTo") OR IsDefined("Session.outURL")>
  <cfif IsDefined("FORM.SendTo")>
     <cfset senduserTo = "#Form.SendTO#">
  <cfelse>
     <cfif IsDefined("Session.outURL")>
	    <cfset senduserTo = "#Session.outURL#">
	 </cfif>
  </cfif>
  
<cfelse>
  <cfset senduserTo = ""> 
</cfif>

<cfif Len(Trim(form.user)) EQ 0>
  <cflock type="EXCLUSIVE" scope="SESSION" timeout="10">
    <cfset Session.LoginTry = Session.LoginTry + 1>
  </cflock>
  <!--- <meta http-equiv="refresh" content="0;url=/MembersOnly/Login.cfm?E=1"> --->
  <cflocation url="#Application.baseurl#/MembersOnly/Login.cfm?E=1&refer=#senduserto#" addtoken="No">
</cfif>

<cfif Len(Trim(form.password)) EQ 0>
  <cflock type="EXCLUSIVE" scope="SESSION" timeout="10">
      <cfset Session.LoginTry = Session.LoginTry + 1>
  </cflock>
  <!--- <meta http-equiv="refresh" content="0;url=/MembersOnly/Login.cfm?E=2"> --->
  <cflocation url="#Application.baseurl#/MembersOnly/Login.cfm?E=2&refer=#senduserto#" addtoken="No">
</cfif>

<cfif findnocase("@", form.user, 1) GT 0>
	<cfquery name="GetUser" datasource="#Application.dsn#">
	  Select *
	  From Members
	  Where Email = '#Form.user#'
	  And Password = '#form.password#'
	</cfquery>
	
	<cfif getuser.recordcount gt 0>
	   <cfset session.userinfo = getuser>
	   
	   <!--- @@@ Version 2.0 Membership Enhancement 
	   <cfif getuser.MembershipExpire LT now()>
	      <cflocation url="#Application.baseurl#/Members/Register.cfm?E=1" addtoken="No">
	   </cfif> --->
	   <cfif Isdefined("form.rememberme")>
	    <cfcookie name="username" value="#getuser.email#" expires="NEVER">
	   </cfif>
	   
	   <cfif trim(senduserto) EQ "">
	    <cfmodule template="#Application.TagDir#/goto.cfm" location="/MembersOnly/index.cfm">
	   <cfelse>
	     <cfmodule template="#Application.TagDir#/goto.cfm" location="#senduserto#"> 	
	   </cfif>>
	<cfelse>
	   <cflock type="EXCLUSIVE" scope="SESSION" timeout="10">
         <cfset Session.LoginTry = Session.LoginTry + 1>
       </cflock> 
	   <!--- <meta http-equiv="refresh" content="0;url=/MembersOnly/Login.cfm?E=3"> --->
	  <cflocation url="#Application.baseurl#/MembersOnly/Login.cfm?E=3&refer=#senduserto#" addtoken="No">
	</cfif>
<cfelse>
   <cfif Not IsNumeric(form.Password)>
      <cflock type="EXCLUSIVE" scope="SESSION" timeout="10">
	      <cfset Session.LoginTry = Session.LoginTry + 1>
	  </cflock>
	  <!--- <meta http-equiv="refresh" content="0;url=/MembersOnly/Login.cfm?E=4"> --->
	  <cflocation url="#Application.baseurl#/MembersOnly/Login.cfm?E=4&refer=#senduserto#" addtoken="No"> 
	  <cfabort>
   </cfif>
   
	   <cfquery name="GetUser" datasource="#Application.dsn#">
		  Select *
		  From Members
		  Where Lastname = '#form.user#'
		  AND IPRAMemberID = #form.password#
	   </cfquery>
   
   <cfif getuser.recordcount gt 0>
	   <cfset session.userinfo = getuser>
	    <cfif IsDefined("form.rememberme") AND NOT ISDefined("cookie.username")>
	     <cfcookie name="username" value="#GetUser.Email#" expires="NEVER">
	   </cfif>
	   
	  <!--- @@@@@@ Version 2.0 Membership restrictions  
	   <cfif getuser.MembershipExpire LT now()>
	      <cflocation url="#Application.baseurl#/MembersOnly/MembershipRenewal.cfm" addtoken="No">
	   </cfif> --->
	   <cfif trim(senduserto) EQ "">
	    <cfmodule template="#Application.TagDir#/goto.cfm" location="/MembersOnly/changelogin.cfm">
	   <cfelse>
	     <cfmodule template="#Application.TagDir#/goto.cfm" location="#senduserto#"> 	
	   </cfif>
	<cfelse>
	   <cflock type="EXCLUSIVE" scope="SESSION" timeout="10">
         <cfset Session.LoginTry = Session.LoginTry + 1>
       </cflock> 
	   <!--- <meta http-equiv="refresh" content="0;url=/MembersOnly/Login.cfm?E=3"> --->
	   <cflocation url="#Application.baseurl#/MembersOnly/Login.cfm?E=3&refer=#senduserto#" addtoken="No">
	</cfif>
	 
</cfif>