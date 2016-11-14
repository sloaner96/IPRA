

<!--- Check that the form was submitted and that the variables exist --->
<cfif Len(Trim(form.username)) EQ 0>
   <cflocation url="ResLogin.cfm?e=1" addtoken="NO">
</cfif>

<cfif Len(Trim(form.password)) EQ 0>
   <cflocation url="ResLogin.cfm?e=2" addtoken="NO">
</cfif>

<!--- check the users credentials against the jobpositings table --->
 <cfset chkLogin = request.CareersComponent.SearchLogin(form.username, form.password)>
 
 <cfif chkLogin.recordcount GT 0>
    <!--- Update the LastLogin --->
    <cfset updatelastLogin = request.CareersComponent.setSearchLastLogin(chkLogin.JobID)>
	
	<!--- Set the Job into a session variable --->
	<cfset Session.ResSearch = chkLogin>
	
	<!--- if this is the first login send the user to change password screen, else take them to the resume search screen --->
	<cfif chkLogin.LastLogin EQ "">
	   <cflocation url="changepassword.cfm" addtoken="NO">
	<cfelse>
	   <cflocation url="ResumeSearch.cfm" addtoken="NO">
	</cfif>
 <cfelse>
   <cflocation url="ResLogin.cfm?e=3" addtoken="NO">
 </cfif>

