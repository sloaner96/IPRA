<cfsetting enablecfoutputonly="Yes">

<CFPARAM Name="Attributes.Action"	default="">
<CFPARAM Name="Attributes.Message"	default="<none>">
<CFPARAM Name="Attributes.User"		default="">
<CFPARAM Name="Attributes.IsAdmin"		default="0">
<CFPARAM Name="Attributes.Status"		default="0K">

<cfquery name="LogEntry" datasource="#Application.DSN#">
	INSERT into AuditLog
		(Action,
		 DateCreated,
		 Status,
		 <cfif Attributes.User is not "">UserID,</cfif>
		 Message,
		 IPAddress,
		 UserAgent,
		 IsAdmin
		)
	VALUES
		('#Attributes.Action#',
		  #CreateODBCDateTime(Now())#,
		  '#Attributes.Status#',
		 <cfif Attributes.User is not "">#Attributes.User#,</cfif>
		 '#Attributes.Message#',
		 '#CGI.REMOTE_ADDR#',
		 '#CGI.HTTP_USER_AGENT#',
		 #Attributes.IsAdmin#
		)
</cfquery>

<cfsetting enablecfoutputonly="No">
