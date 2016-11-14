

<cfif LEN(Trim(form.username)) EQ 0>
  <cflocation url="index.cfm?e=1" addtoken="No">
</cfif>

<cfif LEN(Trim(form.Password)) EQ 0>
  <cflocation url="index.cfm?e=2" addtoken="No">
</cfif>

<cfquery name="LookupLogin" datasource="#Application.dsn#">
  Select *
  From dbo.CoopRegistration
  Where SecEmail = '#Form.username#'
  AND SecPassword = '#form.password#'
</cfquery>  

<cfif LookupLogin.recordcount GT 0>
  
  <cfset session.UserInfo = querynew('MemberID, Firstname, Lastname, Email, AgencyID, MainPhone, Fax, IsCoopSecAdmin, RegistrationID')>
  
  <cfset tmp = QueryAddRow(Session.UserInfo)>
  
  <cfset tmp = QuerySetCell(Session.UserInfo, 'MemberID', LookupLogin.MemberID)>
  <cfset tmp = QuerySetCell(Session.UserInfo, 'Firstname', LookupLogin.SecFirstname)>
  <cfset tmp = QuerySetCell(Session.UserInfo, 'Lastname', LookupLogin.SecLastname)>
  <cfset tmp = QuerySetCell(Session.UserInfo, 'Email', LookupLogin.SecEmail)>
  <cfset tmp = QuerySetCell(Session.UserInfo, 'AgencyID', LookupLogin.AgencyID)> 
  <cfset tmp = QuerySetCell(Session.UserInfo, 'MainPhone', LookupLogin.SecPhone)>
  <cfset tmp = QuerySetCell(Session.UserInfo, 'Fax', LookupLogin.SecFax)>
  <cfset tmp = QuerySetCell(Session.UserInfo, 'IsCoopSecAdmin', 1)>
  <cfset tmp = QuerySetCell(Session.UserInfo, 'RegistrationID', LookupLogin.RegistrationID)>
   
  <cfquery name="UpdateLogin" datasource="#Application.dsn#">
    Update CoopRegistration
	Set LastEntered = #CreateODBCDateTime(now())#
	Where RegistrationID = #LookupLogin.RegistrationID#
  </cfquery> 
  
  <cflocation url="/membersOnly/index.cfm" addtoken="No">
<cfelse>
  <cflocation url="index.cfm?e=3" addtoken="No">
</cfif>