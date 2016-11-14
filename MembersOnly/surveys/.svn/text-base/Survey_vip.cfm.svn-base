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
		<cfquery name="verifyResp" datasource="#ds#">
		select [#user_ID#] as UserID
		from [#table_users#]
		where [#user_ID#] = #url.respID#
		AND siteConfigKey=#siteConfigurationKey#
		</cfquery>
		<cfif verifyResp.recordcount eq 0>
			<br><br><br>
			<font class="brightRedfont"><strong>Login Failed</strong>
			<br><br>
			Please go to the <a href="Respondent_login.cfm"><strong>login page</strong></a> and try again.
			<br><br><br><br>
		<cfelse>
			<cfset respondentID=#verifyResp.userID#>
			<!--- does respondent belong to an authorized group? --->
				<cfquery name="getGroups" datasource="#ds#">
				select rgrRgID
				from Respondent_GroupRoster
				where rgrRespID=#respondentID#
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
					WHERE srRespID=#url.respID#
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
						<cfset cookie.ID=#respondentID#>
						<br><br><br>
						<strong>Logged in!</strong>
						<br><br><br><br>
						<meta http-equiv="refresh" content="0;url=Survey_full.cfm?SID=#SID#">
						</cfoutput>
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
