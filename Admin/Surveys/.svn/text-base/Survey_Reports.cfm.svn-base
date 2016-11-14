<cfquery name="getS" datasource="#Application.dsn#">
SELECT sID, sName, sAnonymous FROM Surveys
WHERE sID=#SID#

</cfquery>



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

<body onload="this.window.focus();">
<cfoutput>
<hr><br>
<table bgcolor="lightgrey" border="0" cellspacing="0" cellpadding="5" align="center" width="400">
	<tr>
		<td align="center" colspan="2"><br><br><strong><font class="bigfont">#getS.sName#</font></strong> (Published)<hr></td>
	</tr>
	<tr>
		<td width="100">&nbsp;</td>
		<td valign="top" width="290">
		<ul>
			<li><a href="survey_ClearAll.cfm?sid=#sid#" onClick="return confirm('Are you sure you want to delete all responses from this survey?');">Delete All Responses</a></li>
			<li><a href="survey_ClearAnon.cfm?sid=#sid#" onClick="return confirm('Are you sure you want to delete all anonymous responses from this survey?');">Delete Anonymous Responses</a></li>
			<li><a href="survey_CleanResponses.cfm?sid=#sid#">Clean Up Survey Responses</a></li>
			<br><br>
			<li><a href="##" onClick="window.open('Report_All.cfm?sID=#sID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">View Overall Results</a></li>
			<cfif gets.sAnonymous eq 'no'>
				<CFquery datasource="#Application.dsn#" name="getRG">
				SELECT rgID, rgName from Respondent_Groups
				</CFQUERY>
				
				<CFquery datasource="#Application.dsn#" name="getRR">
				SELECT rrRgID, rrSID from Respondent_SurveyRoster
				WHERE rrSID=#SID#
				</CFQUERY>
				
				<cfset rrList="">
				<cfloop query="getRR">
					<cfset rrList=#ListAppend(rrList, rrRgID)#>
				</cfloop>
				<li>View Results By Group:<br><br>
				<ul>
				<cfloop query="getRG">
					<cfif ListFind(rrList, rgID) neq 0>
					<li><a href="##" onClick="window.open('Report_byGroup.cfm?sID=#sID#&rgID=#rgID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">#rgName#</a>
					
					</li>
					</cfif>
				</cfloop>
				</ul></li>
			</cfif>
			<li>View Results by Individual:<br><br>
			<ul>
			<CFquery datasource="#Application.dsn#" name="getIndivs">
			SELECT respFirst, respLast, srRespID FROM survey_responses, respondents
			WHERE srSID=#SID#
			and respID=srRespID
			</CFQUERY>
			
			<cfloop query="getIndivs">
			<li><a href="##" onClick="window.open('Report_byIndiv.cfm?sID=#sID#&respID=#srRespID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');">#respFirst# #respLast#</a></li>
			</cfloop>
			</ul></li>
		</ul><br>
		</td>
	</tr>
</table>
</cfoutput>
<br><br><br>
</body>
</html>
