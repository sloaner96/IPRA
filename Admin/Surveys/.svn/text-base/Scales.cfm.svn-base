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
<strong>Rating Scales</strong>
<hr><br><br>
<cfif not isdefined('scale')><cfset scale=0></cfif>
<cfquery name="getScales" datasource="#Application.dsn#">
SELECT scID, scName FROM Scales
ORDER BY scName asc
</cfquery>
	<table cellpadding="5" border="1" align="center" width="570">
	<tr bgcolor="gray">
		<td colspan="2"><font class="lightfont"><strong>Rating Scales</strong></font></td>
	</tr>
	<tr bgcolor="lightgrey">
		<td width="200" valign="top">
		<img src="/images/surveys/scale_new.gif">&nbsp;&nbsp;<a href="##" onClick="window.open('Scale_new.cfm?s=s','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Add New Scale...</a>
		<hr>
		<strong>Existing Scales:</strong></a>
		<br><br>
		<div align="left">
		<table cellpadding="0" cellspacing="2">
		<cfoutput query="getScales">
			<cfif not isDefined('scale')>
				<cfif currentrow eq 1><cfset scale=#scID#></cfif>
			</cfif>
			<tr>
			<td valign="middle"><img src="/images/surveys/scale.gif"></td>
			<td valign="middle">
			<cfif scale eq #scID#>
			<strong>#scName#</strong>
			<cfelse>
			<a href="Scales.cfm?scale=#scID#">#scName#</a>
			</cfif>
			</td>
			</tr>
			</cfoutput>
		</table>
		</div>
		</td>
		<td bgcolor="lightgrey" valign="top" width="350">
			<cfquery name="getThisScale" datasource="#Application.dsn#">
			SELECT scID, scName FROM Scales
			WHERE scID=#scale#
			</cfquery>
			<cfoutput query="getThisScale">
			<table align="center" cellpadding="0" cellspacing="5" bgcolor="white" width="100%">
			<tr>
				<td bgcolor="lightgrey">
				<br>
				<div align="center"><strong>#scName#</strong></div>
				<br>
				</td>
			</tr>
			</tr>
			<cfquery name="getScaleValues" datasource="#Application.dsn#">
			SELECT scpID, scpValue from Scale_Values
			WHERE scpScID=#scID#
			AND scpScID=#scID#
			</cfquery>
			<tr>
				<td>
				<div align="center">
				<a href="##" onClick="window.open('Scale_edit.cfm?scID=#scale#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Edit Scale</A>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="##" onClick="window.open('scale_ConfirmDelete.cfm?scID=#scale#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Delete Scale</A>
				</div>
				<hr>
				<ul>
				<cfloop query="getScaleValues">
				<li>#scpValue#</li>
				</cfloop>
				</ul>
				</td>
			</tr>
			</table>
			</cfoutput>
			</td>
		</tr>
		</table>


</body>
</html>
