
	
<html>
<head>
	<title>IPRA Surveys</title>
	
	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</head>

<body bgcolor="C6DFAD">
<br><br>
<br><br>

<table bgcolor="black" cellspacing="0" align="center" width="332">
	<tr>
		<td>
<table bgcolor="white" cellspacing="0" border="0" cellpadding="5" align="center" width="310">
	<tr>
		<td align="center">
<cfif form.password eq "">
<!--- is email in database? --->
	<cfquery name="checkRequest" datasource="#ds#">
	select [#user_ID#] as respID, [#user_password#] as respPassword, [#user_email#] as respEmail from [#table_Users#]
	where [#user_userName#] like '#form.username#'
	AND siteConfigKey=#siteConfigurationKey#
	</cfquery>
	<cfif checkRequest.recordcount eq 0>
		<br><br><br>
		<font class="brightRedfont"><strong>Sorry, that email address is not listed in our current database.</strong> </font>
		<br><br>
		Please go <a href="javascript:history.back();"><strong>back</strong></a> and try again.
		<br><br><br><br>
	<cfelse>
		<cfmail to='#checkRequest.respEmail#'
				from='#survey_email#'
				subject="Online Surveys"
				query="checkRequest"  server="#Application.MailServer#" username="#Application.MailUser#" password="#Application.MailPassword#">
		Your password is: #checkRequest.respPassword#
		</cfmail>
		<br><br><br>
		<strong>Your password has been mailed to <font class="brightRedfont"><cfoutput>#checkRequest.respEmail#</cfoutput></strong></font>
		<br><br>
		<a href="survey_full.cfm?sid=<cfoutput>#sid#</cfoutput>"><strong>Back</strong></a>
		<br><br><br><br>
	</cfif>
<cfelse>
	<!--- is password correct? --->
	<cfquery name="verifyResp" datasource="#ds#">
	select [#user_ID#] as respID
	from [#table_Users#]
	where [#user_userName#] = '#form.username#'
	and [#user_password#] = #form.password#
	AND siteConfigKey=#siteConfigurationKey#
	</cfquery>
	<cfif verifyResp.recordcount eq 0>
		<br><br><br>
		<font class="brightRedfont"><strong>Your user name and/or password could not be verified.</strong></font>
		<br><br>
		Please go <a href="javascript:history.back();"><strong>back</strong></a> and try again.
		<br><br><br><br>
	<cfelse>
	<!--- does respondent belong to an authorized group? --->
		<cfquery name="getGroups" datasource="#ds#">
		select rgrRgID
		from Respondent_GroupRoster
		where rgrRespID=#verifyResp.respID#
		</cfquery>		
		<cfset isAuthorized="no">
		<cfoutput query="getGroups">
			<cfquery name="verifyGroup" datasource="#ds#">
			select rrRgID
			from Respondent_SurveyRoster
			where rrRgID=#rgrRgID#
			and rrSID=#SID#
			</cfquery>
			<cfif verifyGroup.recordcount neq 0>
				<cfset isAuthorized="yes">
			</cfif>
		</cfoutput>
		
		<cfif isAuthorized eq "no">
			<br><br><br>
			<font class="brightRedfont"><strong>Your are not authorized to take this survey.</strong></font>
			<br><br>
			Please go <a href="index.cfm"><strong>back</strong></a> and select a different survey.
			<br><br><br><br>
		<cfelse>
		<!--- has respondent already taken survey? --->
			<cfquery name="verifySR" datasource="#ds#">
			SELECT srID
			FROM survey_Responses
			WHERE srRespID=#verifyResp.respID#
			AND srSID=#SID#
			</cfquery>
			<cfif verifySR.recordcount neq 0>
				<br><br><br>
				<strong>Sorry</strong>
				<br><br>
				You have already responded to this survey.
				<br><br><br><br>
			<cfelse>
				<cfoutput>
				<cfset cookie.ID=#verifyResp.respID#>
				<br><br><br>
				<strong>Logged in!</strong>
				<br><br><br><br>
				<meta http-equiv="refresh" content="0;url=Survey_full.cfm?SID=#SID#">
				</cfoutput>
			</cfif>
		</cfif>
	</cfif>
</cfif>
</td>
	</tr>
</table>
</td>
	</tr>
</table>






</body>
</html>
