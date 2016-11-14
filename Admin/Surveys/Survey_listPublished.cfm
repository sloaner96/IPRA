

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<cfoutput>
<body onload="this.window.focus();">
<strong>Published Surveys</strong>
<hr><br><br>
</cfoutput>

<cfquery name="getSurveys" datasource="#Application.dsn#">
Select * from surveys
where sPublished = 1
order by sName asc
</cfquery>

<!--- set default survey to first in list, if none in list set survey to zero. If surveys, query for selected survey (default unless specified) --->
<cfif getSurveys.recordcount eq 0>
	<cfset survey=0>
<cfelse>
	<cfif not isDefined('survey')>
		<cfoutput query="getSurveys">
			<cfif currentrow eq 1><cfset survey=#sID#></cfif>
		</cfoutput>
	</cfif>
	<cfquery name="getThisSurvey" datasource="#Application.dsn#">
	Select * from surveys
	where SID=#survey#
	AND sPublished = 1
	order by sName asc
	</cfquery>
</cfif>
<cfif survey eq 0>
<table cellpadding="5" border="1" align="center" width="570">
	<tr bgcolor="lightgrey">
		<td valign="top" width="570">
		<div align="center"><br><br><strong> - No Surveys Published - </strong></div>
		<br><br>
		</td>
	</tr>
</table><!--- end main table --->
<cfelse>
<table cellpadding="5" border="1" align="center" width="670">
	<tr bgcolor="gray">
		<td><font class="lightfont"><strong>Published Surveys</strong></font></td>
		<td><font class="lightfont"><strong>Survey Options</strong></font></td>
	</tr>
	<tr bgcolor="lightgrey">
		<td valign="top" width="325">
		<table cellpadding="0" cellspacing="2" width="100%">
		<cfoutput query="getSurveys">
		<tr>
			<cfif survey neq #sID#>
			<a href="survey_listPublished.cfm?survey=#sid#">
			<td valign="middle" align="right" width="16"><img src="/images/Surveys/survey_blur.gif"></td>
			<td valign="middle"><a href="survey_listPublished.cfm?survey=#sid#">&nbsp;<strong>#sName#</strong></a></td>
			</a>
			<cfelse>
			<td valign="middle" align="right" width="16"><img src="/images/Surveys/survey.gif"></td>
			<td valign="middle" bgcolor="white">&nbsp;<strong>#sName#</strong></td>
			</cfif>
		</tr>
		</cfoutput>
		</table>
		</td>
<!--- end first column --->
		<td valign="top" width="325">
		<cfoutput query="getThisSurvey">
		<ul>
			<li><a href="##" onClick="window.open('Survey_preview.cfm?SID=#SID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">View Survey</a></li>
			<li><a href="##" onClick="window.open('Survey_reName.cfm?SID=#SID#&pub=yes','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Edit Survey Header</a></li>
			<li><a href="##" onClick="window.open('survey_options.cfm?sID=#sID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=475');">Edit Publishing Options</a></li>
			<cfif sAnonymous eq 0>
			<li><a href="##" onClick="window.open('survey_invite.cfm?sID=#sID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">Invite Respondents</a></li>
			</cfif>
		</ul>	
		</cfoutput>
		</td>
	</tr>
	<tr bgcolor="gray">
		<td><font class="lightfont"><strong>Responding Groups</strong></font></td>
		<td><font class="lightfont"><strong>Survey Results</strong></font></td>
	</tr>
	<tr bgcolor="lightgrey">
		<td valign="top" width="325">
		<cfif getThisSurvey.sAnonymous eq 'yes'>
			<img src="/images/Surveys/folder_open.gif">&nbsp;<strong>All Respondents</strong><br>
			<cfset group=0>
		<cfelse>
			<cfif not isDefined('group')>
				<cfset group=0>
			</cfif>
			<table cellpadding="5" border="0" align="center" width="100%">
			<tr bgcolor="lightgrey">
				<cfquery name="getGroups" datasource="#Application.dsn#">
				SELECT * FROM Respondent_Groups, Respondent_SurveyRoster
				WHERE rgID=rrRgID
				AND rrSID=#survey#
				
				ORDER BY rgName asc
				</cfquery>
				<td width="200" valign="top">
				<img src="/images/Surveys/folder_open.gif">&nbsp;
				<cfif group eq 0>	
					<strong>All Respondents</strong><br>
					<cfoutput query="getGroups">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/Surveys/folder.gif">&nbsp;<a href="Survey_listPublished.cfm?survey=#survey#&group=#rgID#">#rgName#</a><br>
					</cfoutput>
				<cfelse>
					<cfoutput>
					<a href="Survey_listPublished.cfm?survey=#survey#&group=0">All Respondents</a><br>
					</cfoutput>
					<cfoutput query="getGroups">
						<cfif group eq #rgID#>
							<cfset groupName=#rgName#>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/Surveys/folder_open.gif">&nbsp;<strong>#rgName#</strong><br>
						<cfelse>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/Surveys/folder.gif">&nbsp;<a href="Survey_listPublished.cfm?survey=#survey#&group=#rgID#">#rgName#</a><br>
						</cfif>
					</cfoutput>
				</cfif>
				</td>
			</tr>
			</table>
		</cfif>
		</td>
<!--- end first column --->
		<td valign="top" width="325">
		<cfif group eq 0>
			<cfquery name="getResp" datasource="#Application.dsn#">
			SELECT srID, [#user_First#] as respFirst, [#user_Last#] as respLast, [#user_ID#] as respID
			FROM [#table_Users#] R, Survey_Responses
			WHERE [#user_ID#]=srRespID
			AND srSid=#survey#
			</cfquery>
		<cfelse>
			<cfquery name="getResp" datasource="#Application.dsn#">
			SELECT srID, [#user_First#] as respFirst, [#user_Last#] as respLast, [#user_ID#] as respID, rgName
			FROM [#table_Users#] R, Respondent_GroupRoster G, Survey_Responses, Respondent_Groups
			WHERE [#user_ID#]=rgrRespID
			AND rgrRgID=#group#
			AND rgID=#group#
			AND [#user_ID#]=srRespID
			AND srSid=#survey#
			AND [#user_ID#] <> 0
			</cfquery>
		</cfif>	
		<cfoutput>
		<table border="0" cellpadding="0" cellspacing="5" bgcolor="white" width="100%">
		<tr>
			<td colspan="2" bgcolor="lightgrey">
			<br>
			<div align="center"><strong><cfif group eq 0>All Respondents<cfelse>#GroupName#</strong></cfif></div>
			<br>
			</td>
		</tr>
		<cfif getResp.recordcount eq 0>
		<tr>
			<td colspan="2" align="center"> - No responses - </td>
		</tr>
		<cfelse>
			<tr>
				<td colspan="2" align="center">
				<cfif group eq 0>
				<a href="##" onClick="window.open('Report_byGroup.cfm?sID=#survey#&rgID=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">
				View Overall Results</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="##" onClick="window.open('Survey_ConfirmDelAllResponse.cfm?sid=#survey#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">
				Delete All Results</a>
				<cfelse>
				<a href="##" onClick="window.open('Report_byGroup.cfm?sID=#survey#&rgID=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">
				View Group Results</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="##" onClick="window.open('Survey_ConfirmDelGroupResponse.cfm?sid=#survey#&group=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">
				Delete Group Results</a>
				</cfif>
				<br><br>
				</td>
			</tr>
			<cfloop query="getResp">
			<tr>
				<td width="30" align="right"><img src="/images/Surveys/user.gif">&nbsp;&nbsp;</td>
				<td width="285">
				<a href="##" onClick="window.open('Report_byIndiv.cfm?sID=#survey#&respID=#respID#&srID=#srID#&group=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">#respFirst# #respLast#</a></td>
			</tr>
			</cfloop>
		</cfif>
		</table>
		</cfoutput>
		</td>
	</tr>
</table><!--- end main table --->
</cfif>	

<!---




	
	--->	
</body>
</html>
