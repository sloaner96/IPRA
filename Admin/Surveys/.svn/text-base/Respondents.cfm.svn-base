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
<strong>Respondents</strong>
<hr><br><br>
<cfif not isDefined('group')>
	<cfset group=0>
</cfif>
<table cellpadding="5" border="1" align="center" width="570">
<tr bgcolor="gray">
	<td colspan="2"><font class="lightfont"><strong>Respondents</strong></font></td>
</tr>
<tr bgcolor="lightgrey">
	<cfquery name="getRG" datasource="#Application.dsn#">
	SELECT * FROM Respondent_Groups
	ORDER BY rgName asc
	</cfquery>
	<td width="200" valign="top">
	<img src="/images/Surveys/folder_new.gif">&nbsp;<a href="##" onClick="window.open('respGroup_new.cfm','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Add New Group...</a>
	<br><hr>
	<img src="/images/Surveys/folder_open.gif">&nbsp;
	<cfif group eq 0>		
		<strong>All Respondents</strong><br>
		<cfoutput query="getRG">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/Surveys/folder.gif">&nbsp;<a href="Respondents.cfm?group=#rgID#">#rgName#</a><br>
		</cfoutput>
	<cfelse>
		<a href="Respondents.cfm?group=0">All Respondents</a><br>
		<cfoutput query="getRG">
			<cfif group eq #rgID#>
				<cfset groupName=#rgName#>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/Surveys/folder_open.gif">&nbsp;<strong>#left(rgName,25)#</strong><br>
			<cfelse>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/Surveys/folder.gif">&nbsp;<a href="Respondents.cfm?group=#rgID#">#left(rgName,25)#</a><br>
			</cfif>
		</cfoutput>
	</cfif>
	</td>
	<td bgcolor="lightgrey" valign="top" width="350">
	<cfif group eq 0>
		<cfquery name="getResp" datasource="#Application.dsn#">
		SELECT [#user_First#] as respFirst, [#user_Last#] as respLast, [#user_ID#] as respID<cfif isDefined('user_sub1')>, [#user_sub1#] as sub1</cfif><cfif isDefined('user_sub2')>, [#user_sub2#] as sub2</cfif>
		FROM [#table_Users#]
		ORDER BY <cfif isDefined('user_sub1')>[#user_sub1#], </cfif><cfif isDefined('user_sub2')>[#user_sub2#], </cfif>[#user_Last#], [#user_First#] asc  
		</cfquery>
	<cfelse>
		<cfquery name="getResp" datasource="#Application.dsn#">
		SELECT [#user_First#] as respFirst, [#user_Last#] as respLast, [#user_ID#] as respID<cfif isDefined('user_sub1')>, [#user_sub1#] as sub1</cfif><cfif isDefined('user_sub2')>, [#user_sub2#] as sub2</cfif>
		FROM [#table_Users#], Respondent_GroupRoster
		WHERE rgrRgID=#group#
		AND [#user_ID#]=rgrRespID
		AND [#user_ID#] <> 0
		ORDER BY <cfif isDefined('user_sub1')>[#user_sub1#], </cfif>[#user_Last#], [#user_First#]<cfif isDefined('user_sub2')>, [#user_sub2#]</cfif> asc
		</cfquery>
	</cfif>
	<cfoutput>
	<table align="center" cellpadding="0" cellspacing="5" bgcolor="white" width="100%">
	<tr>
		<td colspan="3" bgcolor="lightgrey">
		<br>
		<div align="center"><strong><cfif group eq 0>All Respondents<cfelse>#GroupName#</strong></cfif></div>
		<br>
		</td>
	</tr>
	<cfif group neq 0>
	<tr>
		<td colspan="3" valign="top" align="center">
		<a href="##" onClick="window.open('respGroup_addRespondent.cfm?rgID=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=480');">Add Respondent</a>&nbsp;&nbsp;|&nbsp;&nbsp;  
		<a href="##" onClick="window.open('respGroup_edit.cfm?rgID=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Edit Group</A>&nbsp;&nbsp;|&nbsp;&nbsp; 
		<a href="##" onClick="window.open('respGroup_ConfirmDelete.cfm?rgID=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Delete Group</A>
		<hr>
		</td>
	</tr>
	</cfif>
	<cfif getResp.recordcount eq 0>
	<tr>
		<td colspan="3" align="center"> - No respondents in group - </td>
	</tr>
	<cfelse>
		<cfif group eq 0>
			<cfloop query="getResp">
			<tr>
				<td width="15"><img src="/images/Surveys/user.gif">&nbsp;</td>
				<td><a href="##" onClick="window.open('respondent_view.cfm?respID=#respID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=200');">#respFirst# #respLast#<cfif isDefined('user_sub1')> - #left(sub1,25)#</cfif><cfif isDefined('user_sub2')> - #left(sub2,25)#</cfif></a></td>
				<td>&nbsp;</td>
			</tr>
			</cfloop>
		<cfelse>
			<cfloop query="getResp">
			<tr>
				<td width="15"><img src="/images/Surveys/user.gif">&nbsp;</td>
				<td><a href="##" onClick="window.open('respondent_view.cfm?respID=#respID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=200');">#respFirst# #respLast#<cfif isDefined('user_sub1')> - #left(sub1,25)#</cfif><cfif isDefined('user_sub2')> - #left(sub2,25)#</cfif></a></td>
				<td><a href="##" onClick="window.open('respondent_remGroup.cfm?respID=#respID#&rgID=#group#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=250');">Remove</a></td>
			</tr>
			</cfloop>
		</cfif>
	</cfif>
	</table>
	</cfoutput>
	</td>
</tr>
</table>
</body>
</html>
