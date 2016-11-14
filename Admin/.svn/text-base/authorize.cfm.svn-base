

<cfif LEN(Trim(form.username)) EQ 0>
  <meta http-equiv="refresh" content="0;url=/admin/Login.cfm?e=1">
  <cfabort>
</cfif>

<cfif LEN(Trim(form.Password)) EQ 0>
  <meta http-equiv="refresh" content="0;url=/admin/Login.cfm?e=2">
  <cfabort>
</cfif>

<cfquery name="LookupLogin" datasource="#Application.dsn#">
  Select * 
  From SiteUsers
  Where Username = '#form.username#'
  AND Password = '#form.password#'
</cfquery>  

<cfif LookupLogin.recordcount GT 0>
  
  <cfset Session.AdminLogin = true>
  
  <cfset session.AdminInfo = LookupLogin>

  <cfquery name="UpdateLogin" datasource="#Application.dsn#">
    Update SiteUsers
	Set LastLogin = #CreateODBCDateTime(Now())#
	Where UserID = #LookupLogin.UserID#
  </cfquery> 
 <!---  <cfdump var="#session#">
  <cfdump var="#CGI#">
  <cfabort>---> 
  <meta http-equiv="refresh" content="0;url=/admin/index.cfm">
  <!--- <cflocation url="/admin/index.cfm" addtoken="no"> --->
<cfelse>
  <meta http-equiv="refresh" content="0;url=/admin/Login.cfm?e=3">
  <!--- <cflocation url="/admin/Login.cfm?e=3" addtoken="No"> --->
</cfif>